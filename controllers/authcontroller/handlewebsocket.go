package authcontroller

import (
	"fmt"
	"net/http"
	"sync"

	"github.com/gorilla/mux"
	"github.com/gorilla/websocket"
)

var upgrader = websocket.Upgrader{
	CheckOrigin: func(r *http.Request) bool {
		return true
	},
}

type Client struct {
	conn      *websocket.Conn
	username  string
	sendMutex sync.Mutex
}

var (
	clientsMu sync.Mutex
	clients   = make(map[*Client]bool)
)

func HandleWebSocket(w http.ResponseWriter, r *http.Request) {
	username := mux.Vars(r)["username"]

	conn, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		fmt.Println(err)
		return
	}

	client := &Client{conn: conn, username: username}
	registerClient(client)

	defer func() {
		unregisterClient(client)
		client.conn.Close()
	}()

	for {
		_, message, err := client.conn.ReadMessage()
		if err != nil {
			break
		}

		broadcastMessage(username, string(message))
	}
}

func registerClient(c *Client) {
	clientsMu.Lock()
	clients[c] = true
	clientsMu.Unlock()
}

func unregisterClient(c *Client) {
	clientsMu.Lock()
	delete(clients, c)
	clientsMu.Unlock()
}

func broadcastMessage(senderUsername, message string) {
	clientsMu.Lock()
	defer clientsMu.Unlock()

	for client := range clients {
		if client.username != senderUsername {
			client.sendMutex.Lock()
			client.conn.WriteMessage(websocket.TextMessage, []byte(senderUsername+": "+message))
			client.sendMutex.Unlock()
		}
	}
}
