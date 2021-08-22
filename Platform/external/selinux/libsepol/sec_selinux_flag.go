package init

import (
    "android/soong/android"
    "android/soong/cc"
	"fmt"
)

func optionalFlags(ctx android.BaseContext) ([]string) {
    var cflags []string

    sec_quickbuild_build_type  := ctx.AConfig().Getenv("SEC_QUICKBUILD_BUILD_TYPE")
    target_build_variant := ctx.AConfig().Getenv("TARGET_BUILD_VARIANT")
    sec_product_ship := ctx.AConfig().Getenv("SEC_PRODUCT_SHIP")

    if sec_quickbuild_build_type == "RBS" && target_build_variant == "user" && sec_product_ship == "true"{
        fmt.Println("sec_selinux_flag.go : It is RBS USER SHIP build, will makes build fail when meet neverallow violation")
        cflags = append(cflags, "-DSEC_SELINUX_NEVERALLOW_FAIL")
    }

    return cflags
}

func flagDefaults(ctx android.LoadHookContext) {
    type props struct {
        Cflags   []string
    }

    p := &props{}
    p.Cflags = optionalFlags(ctx)

    ctx.AppendProperties(p)
}

func init() {
    android.RegisterModuleType("sec_selinux_flag_defaults", optionalflagDefaults)
}

func optionalflagDefaults() android.Module {
    module := cc.DefaultsFactory()
    android.AddLoadHook(module, flagDefaults)

    return module
}


