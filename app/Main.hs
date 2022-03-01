module Main where
import System.Environment (getArgs)
import  MyLib (setBudgets, importCsv)
import Sqlite3Control (createMonthlyTableIfNotExists)

main :: IO ()
main = do
    createMonthlyTableIfNotExists
    args <- getArgs
    if null args then importCsv else setBudgets
