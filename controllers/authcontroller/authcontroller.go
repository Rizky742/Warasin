package authcontroller

import (
	"backend_warasin/helper"
	"backend_warasin/models"
	"encoding/json"
	"fmt"
	"net/http"
	"time"

	"github.com/gorilla/mux"
	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"
)

func Login(w http.ResponseWriter, r *http.Request) {
	// ambil inputan user
	var userInput models.User
	decoder := json.NewDecoder(r.Body)
	if err := decoder.Decode(&userInput); err != nil {
		response := map[string]string{"message": err.Error()}
		helper.ResponseJSON(w, http.StatusBadRequest, response)
		return
	}
	defer r.Body.Close()

	//ambil data berdasarkan email
	var response map[string]interface{}
	var user models.User
	if err := models.DB.Where("email = ?", userInput.Email).First(&user).Error; err != nil {
		switch err {
		case gorm.ErrRecordNotFound:
			response = map[string]interface{}{"status": "error", "message": "username atau password salah"}
			helper.ResponseJSON(w, http.StatusUnauthorized, response)
			return
		default:
			response = map[string]interface{}{"message": err.Error()}
			helper.ResponseJSON(w, http.StatusInternalServerError, response)
			return
		}
	}

	if err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(userInput.Password)); err != nil {
		response := map[string]string{"status": "error", "message": "username atau password salah"}
		helper.ResponseJSON(w, http.StatusUnauthorized, response)
		return
	}

	data := map[string]interface{}{
		"id":        user.Id,
		"nama":      user.Nama,
		"foto":      user.Foto,
		"email":     user.Email,
		"tgl_lahir": user.Tgl_lahir,
	}

	response = map[string]interface{}{"status": "success", "data": data}
	helper.ResponseJSON(w, http.StatusOK, response)
}

func Register(w http.ResponseWriter, r *http.Request) {
	// ambil inputan user
	var userInput models.User
	decoder := json.NewDecoder(r.Body)
	if err := decoder.Decode(&userInput); err != nil {
		response := map[string]string{"message": err.Error()}
		helper.ResponseJSON(w, http.StatusBadRequest, response)
		return
	}
	defer r.Body.Close()

	// hash password menggunakan bcrypt

	hashPassword, _ := bcrypt.GenerateFromPassword([]byte(userInput.Password), bcrypt.DefaultCost)
	userInput.Password = string(hashPassword)

	//insert ke database
	if err := models.DB.Create(&userInput).Error; err != nil {
		response := map[string]string{"message": err.Error()}
		helper.ResponseJSON(w, http.StatusInternalServerError, response)
		return
	}
	response := map[string]string{"status": "success", "message": "User berhasil ditambahkan"}
	helper.ResponseJSON(w, http.StatusOK, response)
}

func GetUsers(w http.ResponseWriter, r *http.Request) {
	var users []models.User
	var response map[string]interface{}

	result := models.DB.Raw("SELECT * FROM users where id = 2").Scan(&users)

	if result.Error != nil {
		response = map[string]interface{}{
			"Status": "Error",
			"Data":   nil,
			"Error":  "gagal fetch users",
		}
		// c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to fetch users"})
		helper.ResponseJSON(w, http.StatusOK, response)
		return
	}
	// c.JSON(http.StatusOK, users)
	response = map[string]interface{}{
		"sdfs": "Success",
		"Data": users,
	}
	helper.ResponseJSON(w, http.StatusOK, response)
}

func AddBiodata(w http.ResponseWriter, r *http.Request) {
	var userInput models.User
	id := mux.Vars(r)["id"]
	fmt.Println(time.Now())
	decoder := json.NewDecoder(r.Body)
	if err := decoder.Decode(&userInput); err != nil {
		response := map[string]string{"message": err.Error()}
		helper.ResponseJSON(w, http.StatusBadRequest, response)
		return
	}
	defer r.Body.Close()

	//insert ke database
	if err := models.DB.Raw("UPDATE users SET gender = ?, tgl_lahir = ?, negara = ?, nomor_telepon = ? WHERE id = ?", userInput.Gender, userInput.Tgl_lahir, userInput.Negara, userInput.Nomor_telepon, id).Scan(&userInput).Error; err != nil {
		response := map[string]string{"message": err.Error()}
		helper.ResponseJSON(w, http.StatusInternalServerError, response)
		return
	}
	response := map[string]string{"status": "success", "message": "Berhasil menambahkan biodata"}
	helper.ResponseJSON(w, http.StatusOK, response)

}

func GetPsikolog(w http.ResponseWriter, r *http.Request) {

	type Psikolog struct {
		models.Psikolog
		Rating      float64 `gorm:"type:double" json:"rating"`
		TotalUlasan int     `gorm:"type:int" json:"total_ulasan"`
		TotalPasien int     `gorm:"type:int" json:"total_pasien"`
	}
	var psikolog []Psikolog

	var response map[string]interface{}

	result := models.DB.Raw("SELECT psikologs.*,FORMAT(SUM(reviews.rating) / COUNT(reviews.rating), 1) AS rating,COUNT(reviews.id) AS total_ulasan, COUNT(DISTINCT konsuls.users_id) AS total_pasien  FROM psikologs LEFT JOIN reviews ON psikologs.id = reviews.psikolog_id LEFT JOIN konsuls ON psikologs.id = konsuls.psikolog_id GROUP BY reviews.`psikolog_id`").Scan(&psikolog)
	if result.Error != nil {
		response = map[string]interface{}{
			"Status":  "Error",
			"Message": "gagal fetch data",
		}
		// c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to fetch users"})
		helper.ResponseJSON(w, http.StatusBadRequest, response)
		return
	}
	response = map[string]interface{}{
		"Status": "Success",
		"Data":   psikolog,
	}
	helper.ResponseJSON(w, http.StatusOK, response)
}

func GetPsikologByID(w http.ResponseWriter, r *http.Request) {

	type Psikolog struct {
		models.Psikolog
		Rating      float64 `gorm:"type:double" json:"rating"`
		TotalUlasan int     `gorm:"type:int" json:"total_ulasan"`
		TotalPasien int     `gorm:"type:int" json:"total_pasien"`
	}
	id := mux.Vars(r)["id"]
	var psikolog []Psikolog

	var response map[string]interface{}
	result := models.DB.Raw("SELECT psikologs.*,FORMAT(SUM(reviews.rating) / COUNT(reviews.rating), 1) AS rating,COUNT(reviews.id) AS total_ulasan, COUNT(DISTINCT konsuls.users_id) AS total_pasien  FROM psikologs LEFT JOIN reviews ON psikologs.id = reviews.psikolog_id LEFT JOIN konsuls ON psikologs.id = konsuls.psikolog_id WHERE psikologs.id = ? GROUP BY reviews.`psikolog_id`", id).Scan(&psikolog)
	if result.Error != nil {
		response = map[string]interface{}{
			"Status":  "Error",
			"Message": "gagal fetch data",
		}
		// c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to fetch users"})
		helper.ResponseJSON(w, http.StatusBadRequest, response)
		return
	}
	response = map[string]interface{}{
		"Status": "Success",
		"Data":   psikolog,
	}
	helper.ResponseJSON(w, http.StatusOK, response)
}

func RegisterPsikolog(w http.ResponseWriter, r *http.Request) {
	// ambil inputan
	var inputPsikolog models.Psikolog
	decoder := json.NewDecoder(r.Body)
	if err := decoder.Decode(&inputPsikolog); err != nil {
		response := map[string]string{"message": err.Error()}
		helper.ResponseJSON(w, http.StatusBadRequest, response)
		return
	}
	defer r.Body.Close()

	// hash password menggunakan bcrypt

	hashPassword, _ := bcrypt.GenerateFromPassword([]byte(inputPsikolog.Password), bcrypt.DefaultCost)
	inputPsikolog.Password = string(hashPassword)

	if err := models.DB.Create(&inputPsikolog).Error; err != nil {
		response := map[string]string{"message": err.Error()}
		helper.ResponseJSON(w, http.StatusInternalServerError, response)
		return
	}
	response := map[string]string{"status": "success", "message": "psikolog berhasil ditambahkan"}
	helper.ResponseJSON(w, http.StatusOK, response)
}

func CreateConsul(w http.ResponseWriter, r *http.Request) {
	var inputKonsul models.Konsul
	decoder := json.NewDecoder(r.Body)
	if err := decoder.Decode(&inputKonsul); err != nil {
		response := map[string]string{"message": err.Error()}
		helper.ResponseJSON(w, http.StatusBadRequest, response)
		return
	}
	defer r.Body.Close()

	if err := models.DB.Create(&inputKonsul).Error; err != nil {
		response := map[string]string{"message": err.Error()}
		helper.ResponseJSON(w, http.StatusInternalServerError, response)
		return
	}
	response := map[string]string{"status": "success", "message": "Pesanan berhasil ditambahkan"}
	helper.ResponseJSON(w, http.StatusOK, response)
}

func CreateReview(w http.ResponseWriter, r *http.Request) {
	var inputReview models.Review
	decoder := json.NewDecoder(r.Body)
	if err := decoder.Decode(&inputReview); err != nil {
		response := map[string]string{"message": err.Error()}
		helper.ResponseJSON(w, http.StatusBadRequest, response)
		return
	}
	defer r.Body.Close()

	if err := models.DB.Create(&inputReview).Error; err != nil {
		response := map[string]string{"message": err.Error()}
		helper.ResponseJSON(w, http.StatusInternalServerError, response)
		return
	}
	response := map[string]string{"status": "success", "message": "Review berhasil ditambahkan"}
	helper.ResponseJSON(w, http.StatusOK, response)
}
