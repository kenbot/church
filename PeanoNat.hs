module PeanoNat where

data PNat = Zero | Succ PNat 
  deriving Show

p0, p1, p2, p3, p4 :: PNat

p0 = Zero
p1 = Succ p0
p2 = Succ p1
p3 = Succ p2
p4 = Succ p3

pPlus :: PNat -> PNat -> PNat
pPlus Zero b = b 
pPlus (Succ x) b = pPlus x (Succ b) 

pMult :: PNat -> PNat -> PNat
pMult Zero _ = Zero  
pMult (Succ x) b = pPlus b (pMult x b)

pNatToInt :: PNat -> Int
pNatToInt Zero = 0
pNatToInt (Succ n) = 1 + pNatToInt n 

intToPNat :: Int -> PNat
intToPNat 0 = Zero
intToPNat n = Succ (intToPNat (n - 1))
