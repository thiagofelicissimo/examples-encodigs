require open examples.SystemF.theory;

// we can define the natural numbers through the impredicative encoding

symbol Nat : Type ≔ 
  `∀ A, A ⇝ (A ⇝ A) ⇝ A;
symbol zero : Elₜ Nat ≔ 
  `Λ A, `λ' pz, `λ' ps, pz;
symbol succ : Elₜ (Nat ⇝ Nat) ≔ 
  `λ' n, `Λ A, `λ' pz, `λ' ps, ps ▪ (n at A ▪ pz ▪ ps);

symbol sum : Elₜ (Nat ⇝ Nat ⇝ Nat) ≔
  `λ' n, `λ' m, m at Nat ▪ n ▪ succ;

symbol two ≔ succ ▪ (succ ▪ zero);
symbol three ≔ succ ▪ two;
symbol five ≔ succ ▪ (succ ▪ three);
symbol six ≔ succ ▪ five;

// we have 2 + 3 ≡ 5
assert ⊢ sum ▪ two ▪ three ≡ five;
