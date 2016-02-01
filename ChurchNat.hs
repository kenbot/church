{-# LANGUAGE RankNTypes #-}

module ChurchNat where

type CNat = forall r. (r -> r) -> r -> r

c0, c1, c2, c3, c4 :: CNat 

c0 f z = z 
c1 f z = f z
c2 f z = f (f z)
c3 f z = f (f (f z))
c4 f z = f (f (f (f z)))

cSucc :: CNat -> CNat
cSucc cn f = f . cn f 

cPlus :: CNat -> CNat -> CNat
cPlus cn1 cn2 f = cn1 f . cn2 f 

cMult :: CNat -> CNat -> CNat
cMult cn1 cn2 = cn1 . cn2

cNatToInt :: CNat -> Int
cNatToInt cn = cn (+1) 0

-- assuming positive int
intToCNat :: Int -> CNat
intToCNat n = if n == 0 then c0 else cSucc (intToCNat (n - 1)) 

cNatToString :: CNat -> String 
cNatToString = show . cNatToInt
