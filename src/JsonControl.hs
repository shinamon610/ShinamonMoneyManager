{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module JsonControl where
import GHC.Generics ( Generic )
import Data.Text ( Text )
import Data.Aeson ( FromJSON, ToJSON, decode )
import Data.ByteString.Lazy ( readFile )

data Settings = Settings {
    tableAndCsv :: [Bank]
    ,budgetsPath ::BudgetsPath
}deriving(Generic, Show)

data Bank = Bank{
    name ::Text
    ,path::Text
    ,shouldClear ::Bool
    ,date::Text
    ,spending::Text
    ,income::Text
    ,characterCode::Text
    ,category::Text
    ,account::Text
}deriving(Generic, Show)

data BudgetsPath = BudgetsPath{
    jsonPath::Text
    ,csvPath::Text
}deriving(Generic, Show)

data Budgets = Budgets{
    budgets::[Budget]
}deriving(Generic, Show)

data Budget = Budget{
    categories::[Text]
    ,money::[Int]
    ,date_b::Text
}deriving(Generic, Show)

instance ToJSON Settings
instance FromJSON Settings
instance ToJSON Bank
instance FromJSON Bank
instance ToJSON BudgetsPath
instance FromJSON BudgetsPath
instance ToJSON Budgets
instance FromJSON Budgets
instance ToJSON Budget
instance FromJSON Budget

-- settings.jsonを読み込んで、Settingsを作成する
readSettings :: IO (Maybe Settings)
readSettings = do
    let file = "/Users/shinamon/Projects/ShinamonMoneyManager/src/setting.json"
    txt <- Data.ByteString.Lazy.readFile file
    return $ decode txt

readBudgets::FilePath -> IO(Maybe Budgets)
readBudgets budgetPath = do 
    txt <- Data.ByteString.Lazy.readFile budgetPath
    return $ decode txt