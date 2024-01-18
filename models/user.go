package models

import (
	"time"

	"gorm.io/gorm"
)

type GenderEnum string

const (
	Pria   GenderEnum = "Pria"
	Wanita GenderEnum = "Wanita"
)

type User struct {
	Id            int64          `gorm:"primaryKey" json:"id"`
	Nama          string         `gorm:"type:varchar(100)" json:"nama"`
	Foto          string         `gorm:"type:varchar(255)" json:"foto"`
	Email         string         `gorm:"type:varchar(255)" json:"email"`
	Negara        string         `gorm:"type:varchar(255)" json:"negara"`
	Password      string         `gorm:"type:varchar(255)" json:"password"`
	Tgl_lahir     time.Time      `gorm:"type:date" json:"tgl_lahir"`
	Gender        GenderEnum     `gorm:"type:enum('Pria','Wanita')" json:"gender"`
	Nomor_telepon string         `gorm:"varchar(50)" json:"nomor_telepon"`
	CreatedAt     time.Time      `gorm:"default:CURRENT_TIMESTAMP" json:"created_at"`
	DeletedAt     gorm.DeletedAt `gorm:"index" json:"deleted_at,omitempty"`
}

type Psikolog struct {
	Id         int64          `gorm:"primaryKey" json:"id"`
	Foto       string         `gorm:"type:varchar(255)" json:"foto"`
	Nama       string         `gorm:"type:varchar(100)" json:"nama"`
	RumahSakit string         `gorm:"type:varchar(100)" json:"rumah_sakit"`
	Email      string         `gorm:"type:varchar(255)" json:"email"`
	Password   string         `gorm:"type:varchar(50)" json:"password"`
	Deskripsi  string         `gorm:"type:varchar(100)" json:"deskripsi"`
	Tarif      float64        `gorm:"type:double" json:"tarif"`
	LamaKerja  int            `gorm:"type:int" json:"lama_kerja"`
	CreatedAt  time.Time      `gorm:"default:CURRENT_TIMESTAMP" json:"created_at"`
	DeletedAt  gorm.DeletedAt `gorm:"index" json:"deleted_at,omitempty"`
}

type Konsul struct {
	Id          int64 `gorm:"primaryKey" json:"id"`
	Users_id    int   `gorm:"type:int" json:"users_id"`
	Psikolog_id int   `gorm:"type:int" json:"psikolog_id"`
	Waktu       time.Time
	CreatedAt   time.Time `gorm:"default:CURRENT_TIMESTAMP" json:"created_at"`
}

type Review struct {
	Id          int64          `gorm:"primaryKey" json:"id"`
	Psikolog_id int            `gorm:"type:int" json:"psikolog_id"`
	Users_id    int            `gorm:"type:int" json:"users_id"`
	Pesan       string         `gorm:"type:text" json:"pesan"`
	Rating      int            `gorm:"type:int(2)" json:"rating"`
	CreatedAt   time.Time      `gorm:"default:CURRENT_TIMESTAMP" json:"created_at"`
	DeletedAt   gorm.DeletedAt `gorm:"index" json:"deleted_at,omitempty"`
}
