require open
  examples.ECoC.theory;

// Definition of logical connectors using impredicative encodings

symbol False : El (u z) ≔ `Π' A : El (u z), A;

symbol elim-false : El (u z) ≔ `Π' A : El (u z), False ⇝ A;

symbol True : El (u z) ≔ `Π' A : El (u z), A ⇝ A;

symbol intro-true : El (u z) ≔ `Π' A : El (u z), A ⇝ A;

symbol And : El ((u z) ⇝ (u z) ⇝ (u z)) ≔
  `λ' A, `λ' B, `Π' P : El (u z), (A ⇝ B ⇝ P) ⇝ P;

symbol intro-and : El (`Π' A, `Π' B, A ⇝ B ⇝ And ▪ A ▪ B)
     ≔ `λ' A, `λ' B, `λ' a, `λ' b, `λ' P, `λ' P, P ▪ a ▪ b;

symbol elim1-and : El (`Π' A, `Π' B, And ▪ A ▪ B ⇝ A)
     ≔ `λ' A, `λ' B, `λ' p, p ▪ A ▪ (`λ' a, `λ' b, a);

symbol elim2-and : El (`Π' A, `Π' B, And ▪ A ▪ B ⇝ B)
     ≔ `λ' A, `λ' B, `λ' p, p ▪ B ▪ (`λ' a, `λ' b, b);

// cut elimination for the and connectors : 
//elim1-And (intro-And a b) ≡ a
assert A B a b ⊢ elim1-and ▪ A ▪ B ▪ (intro-and ▪ A ▪ B ▪ a ▪ b) ≡ a;
//elim2-And (intro-And a b) ≡ b
assert A B a b ⊢ elim2-and ▪ A ▪ B ▪ (intro-and ▪ A ▪ B ▪ a ▪ b) ≡ b;

symbol Or : El ((u z) ⇝ (u z) ⇝ (u z)) ≔
  `λ' A, `λ' B, `Π' P : El (u z), (A ⇝ P) ⇝ (B ⇝ P) ⇝ P;

symbol intro1-or : El (`Π' A, `Π' B, A ⇝ Or ▪ A ▪ B) ≔
  `λ' A, `λ' B, `λ' a, `λ' P, `λ' pa, `λ' pb, pa ▪ a;

symbol intro2-or : El (`Π' A, `Π' B, B ⇝ Or ▪ A ▪ B) ≔
  `λ' A, `λ' B, `λ' b, `λ' P, `λ' pa, `λ' pb, pb ▪ b;

symbol elim-or : El (`Π' A, `Π' B,`Π' P : El (u z), (A ⇝ P) ⇝ (B ⇝ P) ⇝ Or ▪ A ▪ B ⇝ P) ≔
  `λ' A, `λ' B, `λ' P, `λ' ap, `λ' bp, `λ' or, or ▪ P ▪ ap ▪ bp;






