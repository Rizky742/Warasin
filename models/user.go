package models

type User struct {
	Id       int64  `gorm:"primaryKey" json:"id"`
	Nama     string `gorm:"varchar(255)" json:"nama" binding:"required"`
	Email    string `gorm:"varchar(255)" json:"email" binding:"required"`
	Password string `gorm:"varchar(255)" json:"password" binding:"required"`
}
