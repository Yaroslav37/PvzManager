package internal

import "time"

type UserRole string
type ItemType string
type ReceptionStatus string

const (
	RoleClient    UserRole = "client"
	RoleModerator UserRole = "moderator"
)

const (
	StatusInProgress ReceptionStatus = "in_progress"
	StatusClosed     ReceptionStatus = "close"
)

const (
	TypeElectronics ItemType = "electronics"
	TypeClothes     ItemType = "clothes"
	TypeShoes       ItemType = "shoes"
)

type User struct {
	ID           int
	Email        string
	PasswordHash string
	Role         string
	CreatedAt    time.Time
}

type PVZ struct {
	ID        int
	City      string
	CreatedAt time.Time
}

type Reception struct {
	ID        int
	PVZID     int
	Status    ReceptionStatus
	StartedAt time.Time
	ClosedAt  *time.Time
}

type Item struct {
	ID          int
	ReceptionID int
	Type        ItemType
	ReceivedAt  time.Time
}
