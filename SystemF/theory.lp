// ----Encoding as described in the article----
constant symbol Type : TYPE;
constant symbol Kind : TYPE;

injective symbol Elₜ (A : Type) : TYPE;
injective symbol Elₖ (A : Kind) : TYPE;

constant symbol 'type : Kind; // we rename u_type into 'type
rule Elₖ 'type ↪ Type;

constant symbol Prod_kt (A : Kind) (B : Elₖ A → Type) : Type;
constant symbol abs_kt [A : Kind] [B : Elₖ A → Type] (M : Π x : Elₖ A, Elₜ (B x)) : Elₜ (Prod_kt A B);
symbol app_kt [A : Kind] [B : Elₖ A → Type] (M : Elₜ (Prod_kt A B)) (T : Elₖ A) : Elₜ (B T);
rule app_kt (abs_kt $M) $N ↪ $M $N;

constant symbol Prod_tt (A : Type) (B : Elₜ A → Type) : Type;
constant symbol abs_tt [A : Type] [B : Elₜ A → Type] (M : Π x : Elₜ A, Elₜ (B x)) : Elₜ (Prod_tt A B);
symbol app_tt [A : Type] [B : Elₜ A → Type] (M : Elₜ (Prod_tt A B)) (T : Elₜ A) : Elₜ (B T);
rule app_tt (abs_tt $M) $N ↪ $M $N;

// ----We introduce aliases to simplify our developements----

symbol ∀ (A : Type → Type) : Type ≔ Prod_kt 'type A;
notation ∀ quantifier;
symbol Λ [A : Type → Type] (M : Π x : Type, Elₜ (A x)) : Elₜ (∀ A) ≔ @abs_kt 'type A M;
notation Λ quantifier;
symbol at [A : Type → Type] (M : Elₜ (∀ A)) (T : Type) : Elₜ (A T) ≔ @app_kt 'type A M T;
notation at infix left 7;

assert (A : Type → Type) (M : Π x, Elₜ (A x)) (N : Type) ⊢ (Λ M) at N ≡ M N;

symbol ⇝ (A : Type) (B : Type) : Type ≔ Prod_tt A (λ _, B);
notation ⇝ infix right 6;
symbol λ' [A : Type] [B : Type] (M : Elₜ A → Elₜ B) : Elₜ (A ⇝ B) ≔ @abs_tt A (λ _, B) M;
notation λ' quantifier;
symbol ▪ [A : Type] [B : Type] (M : Elₜ (A ⇝ B)) (N : Elₜ A) : Elₜ B ≔ @app_tt A (λ _, B) M N; 
notation ▪ infix left 7;

assert (A B : Type) (M : Elₜ A → Elₜ B) (N : Elₜ A) ⊢ (λ' M) ▪ N ≡ M N;                    
