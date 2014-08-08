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
myScratchPadIPython = "urxvt +sb -bg Black -fg Gray -name ipython -e ipython"

myScratchPads :: [NamedScratchpad]
myScratchPads = [ NS "terminal" spawnTerm findTerm manageTerm
                , NS "ipython" spawnIPython findIPython manageIPython]
    where
        spawnTerm  = myScratchPadTerminal
        findTerm   = resource =? "scratchpad"
        manageTerm = customFloating $ W.RationalRect l t w h
            where
                h = 0.1
                w = 1
                t = 1 - h
                l = 1 - w
        spawnIPython  = myScratchPadIPython
        findIPython   = resource =? "ipython"
        manageIPython = customFloating $ W.RationalRect l t w h
            where
                h = 0.1
                w = 0.5
                t = 0
                l = 0

myManageHook :: ManageHook
myManageHook = (composeAll $ concat
                   [ [ manageHook xfceConfig]
                   , [ className =? c --> doIgnore | c <- myIgnores ]
                   , [ manageDocks ]
                   , [ namedScratchpadManageHook myScratchPads ]
                   ])
    where
        myIgnores = ["Do", "Xfce4-notifyd"]

myKeys :: [(String, X ())]
myKeys = [ ("M-p", namedScratchpadAction myScratchPads "terminal")
         , ("M-i", namedScratchpadAction myScratchPads "ipython")
         , ("M-S-y", spawn "spotify-cli-wrapper previous")
         , ("M-S-u", spawn "spotify-cli-wrapper play-pause")
         , ("M-S-i", spawn "spotify-cli-wrapper notify")
         , ("M-S-o", spawn "spotify-cli-wrapper next") ]

myConfig = xfceConfig { manageHook = myManageHook
                      , terminal = myTerminal
                      }

main = xmonad $ myConfig `additionalKeysP` myKeys
