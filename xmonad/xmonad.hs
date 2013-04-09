import XMonad
import XMonad.Config.Xfce
import XMonad.Hooks.ManageDocks
import XMonad.Layout
import qualified XMonad.StackSet as W

myManageHook :: ManageHook
myManageHook = composeAll [
		manageHook xfceConfig,
		-- Hide GNOME Do.
		resource =? "Do" --> doIgnore,
		className =? "Xfce4-notifyd" --> (doF W.focusDown <+> doFloat),
		-- These are made unnecessary by manageDocks.
		-- resource =? "desktop-window" --> doIgnore,
		-- resource =? "gnome-panel" --> doIgnore,
		manageDocks
	]

-- each layout is separated by |||
-- layout 1: grid w/ master (expand/contract by 3/100; master takes up 1/2 of screen)
-- layout 2: standard full (master window fullscreen, hides dock)
-- myLayoutHook = (avoidStruts $ mastered (3/100) (1/2) $ Grid) ||| Full

main = xmonad $ xfceConfig {
	--layoutHook = myLayoutHook
	manageHook = myManageHook,
	-- Use windows key as mod.
	-- modMask = mod4Mask,
	terminal = "xfce4-terminal --hide-menubar"
}
