{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE RankNTypes #-}

module ChurchBool where

type CBool = forall r. r -> r -> r

cTrue :: CBool
cTrue  x y = x

cFalse :: CBool
cFalse x y = y

cNot :: CBool -> CBool
cNot cb = cb cFalse cTrue

cAnd :: CBool -> CBool -> CBool
cAnd cb1 cb2 = cb1 cb2 cFalse

cOr :: CBool -> CBool -> CBool
cOr cb1 cb2 = cb1 cTrue cb2

cBoolToBool :: CBool -> Bool
cBoolToBool cb = cb True False

boolToCBool :: Bool -> CBool
boolToCBool b = if b then cTrue else cFalse

cBoolToString :: CBool -> String
cBoolToString cb = cb "True" "False"
