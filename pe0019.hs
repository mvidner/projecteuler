import Data.Time.Calendar
import Data.Time.Calendar.OrdinalDate

days :: [Day]
days = [fromGregorian y m d | y <- [1901..2000], m <- [1..12], d <- [1]]

main = do
  print $ length $ filter isSunday days
    where isSunday d = (snd (mondayStartWeek d) == 7)
