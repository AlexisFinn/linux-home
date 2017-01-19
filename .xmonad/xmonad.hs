import XMonad
import XMonad.Config.Desktop
import XMonad.Util.EZConfig(additionalKeys)

baseConfig = desktopConfig
myModMask = mod4Mask -- Super

main = xmonad $ baseConfig
	{ terminal	= "sakura"
	, modMask	= myModMask
	} `additionalKeys`
	[ ((mod4Mask, xK_x), spawn "rofi -show run -sidebar-mode -font 'Fira code 12'")
	, ((myModMask, xK_m), spawn "echo 'his, mom!' | dzen2 -p 4") 
	]


