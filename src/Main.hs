import System.Environment (getArgs)
import Control.Monad (forM_)
import Text.ParserCombinators.Parsec (spaces, char, chainl1, runParser)
import Text.ParserCombinators.Parsec.Number (int)

infixOp = do
  spaces
  char '+'
  spaces
  return (+)

expr = chainl1 int infixOp

runExpr = runParser expr 0 "<input>"

showResult (Left a)  = "Error: " ++ show a
showResult (Right a) = show a

main = do
  putStrLn "args:"
  args <- System.Environment.getArgs
  forM_ args $ putStrLn . (" - " ++) . showResult . runExpr
  putStrLn ""
