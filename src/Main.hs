import System.Environment (getArgs)
import Text.ParserCombinators.Parsec (Parser, ParseError, spaces, char, chainl1, runParser)
import Text.ParserCombinators.Parsec.Number (int)

infixOp :: Parser (Integer -> Integer -> Integer)
infixOp = do
  spaces
  _ <- char '+'
  spaces
  return (+)

expr :: Parser Integer
expr = chainl1 int infixOp

evalExpr :: String -> Either ParseError Integer
evalExpr = runParser expr () "<input>"

showResult :: Either ParseError Integer -> String
showResult = either (("Error: " ++) . show) show

main :: IO ()
main = do
  putStrLn "args:"
  args <- System.Environment.getArgs
  mapM_ (putStrLn . (" - " ++) . showResult . evalExpr) args
  putStrLn ""
