module MyLib (setBudgets, importCsv) where
import Data.Text(unpack)
import JsonControl(readSettings, readBudgets, jsonPath, budgetsPath)

setBudgets = do
    settings <- readSettings
    case settings of 
        Nothing -> Prelude.putStrLn "no contents in Settings"
        Just s -> do
            budgets <- readBudgets $ Data.Text.unpack (jsonPath (budgetsPath s))
            print "ok"
importCsv = putStrLn "importCsv"
