{-# LANGUAGE OverloadedStrings, OverloadedLabels #-}
module Lib
    ( run
    ) where

import qualified GI.Gtk as Gtk
import Data.GI.Base

run :: IO ()
run = do
  Gtk.init Nothing
  win <- new Gtk.Window [ #title := "Hi there" ]
  on win #destroy Gtk.mainQuit
  button <- new Gtk.Button [ #label := "Click me" ]
  on button #clicked (set button [ #sensitive := False,
                                   #label := "Thanks for clicking me" ])
  #add win button
  #showAll win
  Gtk.main
