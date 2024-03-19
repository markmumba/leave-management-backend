package server

import (
	"context"
	"database/sql"
	"log"
	"net/http"
	"server/internal/database"

	"github.com/labstack/echo/v4"
)

func (s *Server) CreateUserHandler(c echo.Context) error {

	type Params struct {
		Username string `json:"username"`
		Email    string `json:"email"`
		Password string `json:"password"`
		Role     string `json:"role"`
	}

	var params Params

	err := c.Bind(&params)

	if err != nil {
		log.Printf("Error %v", err)
		return c.JSON(http.StatusBadRequest, "error parsing user data ")
	}

	role, err := s.db.FindRole(context.Background(), database.Roletype(params.Role))
	if err != nil {
		log.Printf("Error %v", err)
		return c.JSON(http.StatusInternalServerError,"Role not available")
	}

	err = s.db.CreateUser(context.Background(), database.CreateUserParams{
		Username: params.Username,
		Email:    params.Email,
		Password: params.Password,
		RoleID:   sql.NullInt32{Int32: role.RoleID, Valid: true},
	})

	if err != nil {
		log.Printf("Error %v", err)
		return c.JSON(http.StatusInternalServerError, "Unable to create user")
	}

	resp := map[string]string{
		"message": "User Created succefully",
	}

	return c.JSON(http.StatusOK, resp)

}
