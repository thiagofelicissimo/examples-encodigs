require open
  examples.ECoC.theory;

// we can define the natural numbers through their impredicative encoding
symbol Nat : El (u z) ≔ 
  `Π' A : El (u z), A ⇝ (A ⇝ A) ⇝ A;
symbol zero : El Nat ≔ 
  `λ' A, `λ' pz, `λ' ps, pz;
symbol succ : El (Nat ⇝ Nat) ≔ 
  `λ' n, `λ' A, `λ' pz, `λ' ps, ps ▪ (n ▪ A ▪ pz ▪ ps);

symbol sum : El (Nat ⇝ Nat ⇝ Nat) ≔
  `λ' n, `λ' m, m ▪ Nat ▪ n ▪ succ;

symbol two ≔ succ ▪ (succ ▪ zero);
symbol three ≔ succ ▪ (succ ▪ (succ ▪ zero));
symbol five ≔ succ ▪ (succ ▪ (succ ▪ (succ ▪ (succ ▪ zero))));

// we have 2 + 3 ≡ 5
assert ⊢ sum ▪ two ▪ three ≡ five;



