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
myScratchPadTerminal = "urxvt +sb -bg Black -fg Gray -name xm-scratchpad"
myScratchPadIPython = "urxvt +sb -bg Black -fg Gray -name xm-ipython -e ipython"
myScratchPadUtop = "urxvt +sb -bg Black -fg Gray -name xm-utop -e utop"

myScratchPads :: [NamedScratchpad]
myScratchPads = [ NS "terminal" spawnTerm findTerm manageTerm
                , NS "ipython" spawnIPython findIPython manageIPython
                , NS "utop" spawnUtop findUtop manageUtop]
    where
        spawnTerm  = myScratchPadTerminal
        findTerm   = resource =? "xm-scratchpad"
        manageTerm = customFloating $ W.RationalRect l t w h
            where
                h = 0.1
                w = 1
                t = 1 - h
                l = 1 - w
        spawnIPython  = myScratchPadIPython
        findIPython   = resource =? "xm-ipython"
        manageIPython = customFloating $ W.RationalRect l t w h
            where
                h = 0.75
                w = 0.25
                t = 0.0
                l = 0.75
        spawnUtop  = myScratchPadUtop
        findUtop   = resource =? "xm-utop"
        manageUtop = customFloating $ W.RationalRect l t w h
            where
                h = 0.75
                w = 0.25
                t = 0.0
                l = 0.5

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
         , ("M-u", namedScratchpadAction myScratchPads "utop")
         , ("M-S-n", spawn "gnome-do")
         , ("M-S-y", spawn "spotify-cli-wrapper previous")
         , ("M-S-u", spawn "spotify-cli-wrapper play-pause")
         , ("M-S-i", spawn "spotify-cli-wrapper notify")
         , ("M-S-o", spawn "spotify-cli-wrapper next") ]

myConfig = xfceConfig { manageHook = myManageHook
                      , terminal = myTerminal
                      }

main = xmonad $ myConfig `additionalKeysP` myKeys
