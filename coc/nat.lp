require open
  encodings.base  
  encodings.coc;

// Definition of integers thought impredicative encoding (or church encoding)

symbol Nat : El (u Type) ≔ 
  Prod I (u Type) (λ A, 
  Prod I A (λ _,
  Prod I (Prod I A (λ _, A)) (λ _, A)));

symbol zero : El Nat ≔ 
  abs I (λ A, abs I (λ z, abs I (λ s, z)));

symbol succ : El (Prod I Nat (λ _, Nat)) ≔ 
  abs I (λ n, abs I (λ A, abs I (λ z, abs I (λ s, app I s (app I (app I (app I n A ■) z ■) s ■) ■))));

symbol plus : El (Prod I Nat (λ _,
                  Prod I Nat (λ _, Nat))) ≔
  abs I (λ n, abs I (λ m, app I (app I (app I m Nat ■) n ■) succ ■));

symbol two : El Nat ≔ app I succ (app I succ zero ■) ■;
symbol three : El Nat ≔ app I succ two ■;

symbol five : El Nat ≔ app I succ (app I succ three ■) ■;

// we have 2 + 3 ≡ 5
assert ⊢ app I (app I plus two ■) three ■ ≡ five;

