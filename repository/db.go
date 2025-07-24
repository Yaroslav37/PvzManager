package repository

import (
	"database/sql"

	"github.com/Masterminds/squirrel"
	"github.com/Yaroslav37/PvzManager/internal"
)

type Repository struct {
	db *sql.DB
	qb squirrel.StatementBuilderType
}

func NewRepository(db *sql.DB) *Repository {
	return &Repository{
		db: db,
		qb: squirrel.StatementBuilder.PlaceholderFormat(squirrel.Dollar),
	}
}

type UsersRepo interface {
	CreateUser(user *internal.User) error
	GetUserByEmail(email string) (*internal.User, error)
}

type PVZRepo interface {
	createPVZ(pvz *internal.PVZ) error
	GetPVZList(offset, limit int) ([]internal.PVZ, error)
}

type ReceptionsRepo interface {
	CreateReception(reception *internal.Reception) error
	GetActiveReceptionByPVZID(pvzID int) (*internal.Reception, error)
	CloseReception(id int) error
}

type ItemsRepo interface {
	CreateItem(item *internal.Item) error
	DeleteLastItem(receptionID int) error
}
