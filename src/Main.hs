import System.Environment
import Control.Monad (forM_)
import Text.ParserCombinators.Parsec
import qualified Text.ParserCombinators.Parsec.Number as Numbers

expr = chainl1 int infixOp

int = Numbers.int

infixOp = do
  spaces
  char '+'
  spaces
  return (+)

runExpr = runParser expr 0 "<input>"

showResult (Left a)  = "Error: " ++ show a
showResult (Right a) = show a
  
main = do
  putStrLn "args:"
  args <- System.Environment.getArgs
  args `forM_` ((\s -> putStr " - " >> putStrLn s) . showResult . runExpr)
  putStrLn ""
