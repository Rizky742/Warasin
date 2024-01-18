package main

import (
	"backend_warasin/controllers/authcontroller"
	"backend_warasin/models"
	"net/http"

	"github.com/gorilla/handlers"
	"github.com/gorilla/mux"
)

func main() {

	models.ConnectDatabase()
	r := mux.NewRouter()

	r.HandleFunc("/login", authcontroller.Login).Methods("POST")
	r.HandleFunc("/register", authcontroller.Register).Methods("POST")
	r.HandleFunc("/users", authcontroller.GetUsers).Methods("GET")
	r.HandleFunc("/users/biodata/{id}", authcontroller.AddBiodata).Methods("PUT")
	r.HandleFunc("/psikolog", authcontroller.GetPsikolog).Methods("GET")
	r.HandleFunc("/psikolog/{id}", authcontroller.GetPsikologByID).Methods("GET")
	r.HandleFunc("/psikolog/register", authcontroller.RegisterPsikolog).Methods("POST")
	r.HandleFunc("/konsul", authcontroller.CreateConsul).Methods("POST")
	r.HandleFunc("/review", authcontroller.CreateReview).Methods("POST")
	r.HandleFunc("/ws/{username}", authcontroller.HandleWebSocket)

	http.ListenAndServe(":8080",
		handlers.CORS(
			handlers.AllowedOrigins([]string{"*"}),
			handlers.AllowedMethods([]string{"GET", "POST", "PUT", "DELETE", "OPTIONS"}),
			handlers.AllowedHeaders([]string{"X-Requested-With", "Content-Type", "Authorization"}),
		)(r))

}
