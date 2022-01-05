{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Lib (main) where

import GHC.Generics
import Data.Aeson

data User = User {
  userId :: Int,
  name   :: String
} deriving (Generic, Show)

instance ToJSON User where
  toEncoding = genericToEncoding defaultOptions

instance FromJSON User

user = User {
  userId = 0,
  name   = "Travis"
}

jsonFromUser = encode user

userFromJSON =
  decode "{\"userId\":0,\"name\":\"Traivs\"}" :: Maybe User

main :: IO ()
main = do
  print $ jsonFromUser
  print $ userFromJSON
