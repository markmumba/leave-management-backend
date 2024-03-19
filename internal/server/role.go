package server

import (
	"context"
	"fmt"
	"log"
	"net/http"
	"server/internal/database"

	"github.com/labstack/echo/v4"
)

func (s *Server) CreateRoleHandler(c echo.Context) error {
	type Params struct {
		Roles []string `json:"role"`
	}
	var parameters Params
	var roleNames []string

	err := c.Bind(&parameters)
	if err != nil {
		log.Printf("Error %v", err)
		return c.JSON(http.StatusBadRequest, "Unable to parse input")
	}
	for _, role := range parameters.Roles {
		roleName, err := s.db.CreateRole(context.Background(), database.Roletype(role))
		if err != nil {
			log.Printf("Error %v", err)
			return c.JSON(http.StatusInternalServerError, "Role is not among of the suggested roles")
		}
		roleNames = append(roleNames, string(roleName))
	}

	resp := map[string]string{
		"message": fmt.Sprintf("%s succesfully created ", roleNames),
	}
	return c.JSON(http.StatusOK, resp)

}
