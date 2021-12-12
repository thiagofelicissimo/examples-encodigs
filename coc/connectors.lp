require open
  encodings.base  
  encodings.coc;

// Definition of logical connectors throught impredicative encodings

symbol False : El (u Type) ≔ Prod I (u Type) (λ A, A);

symbol elim-false : El (Prod I (u Type) (λ A, 
                        Prod I False (λ _, A)))
     ≔ abs I (λ A, abs I (λ false, app I false A ■));

symbol True : El (u Type) ≔ 
  Prod I (u Type) (λ A, 
  Prod I A        (λ _, A));

symbol intro-True : El True ≔ abs I (λ A, abs I (λ x, x));

symbol And : El (Prod I (u Type) (λ _,
                 Prod I (u Type) (λ _, u Type)))
     ≔ abs I (λ A, abs I (λ B, Prod I (u Type) (λ P,
                                Prod I (Prod I A (λ _, Prod I B (λ _, P))) (λ _, P))));

symbol intro-And : El (Prod I (u Type) (λ A,
                       Prod I (u Type) (λ B,
                       Prod I A (λ _,
                       Prod I B (λ _, app I (app I And A ■) B ■)))))
     ≔ abs I (λ A, abs I (λ B, abs I (λ a, abs I (λ b, abs I (λ P, abs I (λ p, app I (app I p a ■) b ■))))));

symbol elim1-And : El (Prod I (u Type) (λ A,
                       Prod I (u Type) (λ B,
                       Prod I (app I (app I And A ■) B ■) (λ _, A))))
     ≔ abs I (λ A, abs I (λ B, abs I (λ andAB, app I (app I andAB A ■) (abs I (λ a, abs I (λ b, a))) ■)));

symbol elim2-And : El (Prod I (u Type) (λ A,
                       Prod I (u Type) (λ B,
                       Prod I (app I (app I And A ■) B ■) (λ _, B))))
     ≔ abs I (λ A, abs I (λ B, abs I (λ andAB, app I (app I andAB B ■) (abs I (λ a, abs I (λ b, b))) ■)));


// cut elimination for the and connectors : elim1-And (intro-And a b) ≡ a
assert A B a b ⊢ app I (app I (app I elim1-And A ■) B ■) (app I (app I (app I (app I intro-And A ■) B ■) a ■) b ■) ■ ≡ a;




