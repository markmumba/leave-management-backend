package server

import (
	"fmt"
	"server/internal/database"

	"github.com/labstack/echo/v4"
)


func (s *Server) CreateUserHandler(c echo.Context) error {

	var user database.User
	err := c.Bind(&user)
	if err !=nil {
		fmt.Println(err)
	}

	return nil
}