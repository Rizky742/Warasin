package models

import (
	"fmt"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

var DB *gorm.DB

func ConnectDatabase() {
	db, err := gorm.Open(mysql.Open("root:@tcp/warasin"))
	if err != nil {
		fmt.Println("gagal koneksi database")
	}

	db.AutoMigrate(&User{})
	DB = db
}
