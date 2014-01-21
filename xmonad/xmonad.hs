import XMonad
import XMonad.Config.Xfce
import XMonad.Hooks.ManageDocks
import XMonad.Layout
import qualified XMonad.StackSet as W

myManageHook :: ManageHook
myManageHook = composeAll [ manageHook xfceConfig
                          , resource =? "Do" --> doIgnore
                          , className =? "Xfce4-notifyd" --> doIgnore
                          , manageDocks
                          ]

main = xmonad $ xfceConfig { manageHook = myManageHook
                           , terminal = "xfce4-terminal --hide-menubar"
                           }
