package main

import (
	"fmt"
	"os"

	"github.com/StartloJ/dexen_app/internal/logs"
	"github.com/StartloJ/dexen_app/src/handlers"
	"github.com/gofiber/fiber/v3"
	"github.com/gofiber/fiber/v3/middleware/logger"
	"github.com/spf13/viper"
)

var (
	version = "dev"
	commit  = "none"
	date    = "unknown"
	builtBy = "me"
)

func init() {
	viper.SetDefault("versionNumber", version)
	viper.SetDefault("commit", commit)
	viper.SetDefault("date", date)
	viper.SetDefault("builtBy", builtBy)
}

func main() {
	if viper.GetBool("version") {
		fmt.Println(viper.GetString("versionNumber"))
		os.Exit(0)
	}

	viper.AutomaticEnv()

	sugar := logs.CreateLogger().Sugar()
	defer sugar.Sync()

	app := fiber.New()
	app.Use(logger.New(logger.Config{
		Format:     "${time} - [${ip}] ${path} ${status} - ${method} ${resBody} ${error}\n",
		TimeFormat: "2006-01-02T15:04:05-0700",
		TimeZone:   "Local",
		Output:     os.Stdout,
	}))

	api_v1 := app.Group("/v1")

	api_v1.Get("/", func(c fiber.Ctx) error {
		msg := fmt.Sprintf("✋ %s", "Hello")
		return c.SendString(msg)
	})
	api_v1.Get("/base-os", handlers.GetBaseOs)
	api_v1.Get("/version", handlers.GetAppVersion)

	sugar.Infoln("New server had running...")
	sugar.Fatalln(app.Listen(viper.GetString("app_listen")))
}
