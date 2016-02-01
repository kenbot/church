{-# LANGUAGE RankNTypes #-}

module ChurchList where

type CList a = forall r. (a -> r -> r) -> r -> r

cNil :: CList a  
cNil f nil = nil

cCons :: a -> CList a -> CList a
cCons a clist = \f b -> f a (clist f b) 

cListToList :: CList a -> [a]
cListToList clist = clist (:) [] 

listToCList :: [a] -> CList a
listToCList [] = cNil
listToCList (a : as) = a `cCons` (listToCList as) 

cListToString :: Show a => CList a -> String
cListToString = show . cListToList 
