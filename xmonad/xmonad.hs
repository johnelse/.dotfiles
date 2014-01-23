import XMonad
import XMonad.Config.Xfce (xfceConfig)
import XMonad.Hooks.ManageDocks (manageDocks)
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.NamedScratchpad ( NamedScratchpad(NS)
                                   , customFloating
                                   , namedScratchpadManageHook
                                   , namedScratchpadAction
                                   )
import qualified XMonad.StackSet as W

myTerminal = "xfce4-terminal --hide-menubar"
myScratchPadTerminal = "urxvt +sb -bg Black -fg Gray -name scratchpad"

myScratchPads :: [NamedScratchpad]
myScratchPads = [ NS "terminal" spawnTerm findTerm manageTerm ]
    where
        spawnTerm  = myScratchPadTerminal
        findTerm   = resource =? "scratchpad"
        manageTerm = customFloating $ W.RationalRect l t w h
            where
                h = 0.1
                w = 1
                t = 1 - h
                l = 1 - w

myManageHook :: ManageHook
myManageHook = (composeAll [ manageHook xfceConfig
                           , resource =? "Do" --> doIgnore
                           , className =? "Xfce4-notifyd" --> doIgnore
                           , manageDocks
                           ])
               <+> namedScratchpadManageHook myScratchPads

myKeys :: [(String, X ())]
myKeys = [ ("M-p", namedScratchpadAction myScratchPads "terminal")
         , ("M-S-y", spawn "spotify-cli-wrapper previous")
         , ("M-S-u", spawn "spotify-cli-wrapper play-pause")
         , ("M-S-i", spawn "spotify-cli-wrapper notify")
         , ("M-S-o", spawn "spotify-cli-wrapper next") ]

myConfig = xfceConfig { manageHook = myManageHook
                      , terminal = myTerminal
                      }

main = xmonad $ myConfig `additionalKeysP` myKeys
