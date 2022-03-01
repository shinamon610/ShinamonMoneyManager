{-# LANGUAGE OverloadedStrings #-}
module Sqlite3Control(createMonthlyTableIfNotExists) where
import Database.SQLite.Simple

-- Table作成
createMonthlyTableIfNotExists :: IO ()
createMonthlyTableIfNotExists = do
    conn <- open "shinamonMM.db"
    execute_ conn "CREATE TABLE IF NOT EXISTS monthly(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, date TEXT NOT NULL)"