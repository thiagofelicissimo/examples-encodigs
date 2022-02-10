require open
  examples.ECoC.theory;

// Impredicative definition of equality

symbol eq : El (`Π' A : El (u z), A ⇝ A ⇝ (u z)) ≔ 
  `λ' A, `λ' a, `λ' b, `Π' P : El (A ⇝ (u z)), P ▪ a ⇝ P ▪ b;

symbol refl : El (`Π' A, `Π' a, eq ▪ A ▪ a ▪ a) ≔   
  `λ' A, `λ' a, `λ' P, `λ' pa, pa;

symbol sym : El (`Π' A, `Π' a, `Π' b, eq ▪ A ▪ a ▪ b ⇝ eq ▪ A ▪ b ▪ a) ≔   
  `λ' A, `λ' a, `λ' b, `λ' pab, pab ▪ (`λ' x, eq ▪ A ▪ x ▪ a) ▪ (refl ▪ A ▪ a);

symbol trans : El (`Π' A, `Π' a, `Π' b, `Π' c, eq ▪ A ▪ a ▪ b ⇝ eq ▪ A ▪ b ▪ c ⇝ eq ▪ A ▪ a ▪ c) ≔   
  `λ' A, `λ' a, `λ' b, `λ' c, `λ' pab, `λ' pbc, `λ' P, `λ' pa, pbc ▪ P ▪ (pab ▪ P ▪ pa);


  
