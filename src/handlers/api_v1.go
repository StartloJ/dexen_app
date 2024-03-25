package handlers

import (
	"github.com/gofiber/fiber/v3"
	"github.com/spf13/viper"
	"github.com/zcalusic/sysinfo"
)

// GetBaseOs is a function to return Go base OS in runtime.
func GetBaseOs(c fiber.Ctx) error {
	var sys_info sysinfo.SysInfo
	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"status":          "success",
		"runtime_os":      sys_info.OS.Vendor,
		"runtime_version": sys_info.OS.Release,
		"runtime_arch":    sys_info.OS.Architecture,
	})
}

// GetAppVersion is a function to return built app version.
func GetAppVersion(c fiber.Ctx) error {
	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"status":        "success",
		"app_version":   viper.GetString("versionNumber"),
		"app_commit":    viper.GetString("commit"),
		"app_builtDate": viper.GetString("date"),
	})
}
