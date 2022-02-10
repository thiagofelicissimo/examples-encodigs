// Calculus of Extended Constructions
// z → Prop
// s x → Typeₓ 

constant symbol Sort : TYPE;

// Encoding of the sorts
constant symbol z : Sort;
constant symbol s : Sort → Sort;
symbol R (s₁ s₂ : Sort) : Sort;
// R Prop Typeₓ = Typeₓ
rule R z $x ↪ $x 
// R Typeₓ Prop = Prop
with R (s $x) z ↪ z
// R Type₀ Typeₓ = Typeₓ
with R (s z) (s $x) ↪ s $x
// R Typeₓ Type₀ = Typeₓ
with R (s $x) (s z) ↪ s $x
// R Type(s x) Type (s y) = 
with R (s (s $x)) (s (s $y)) ↪ s (R (s $x) (s $y));

symbol A (s₁ : Sort) : Sort;
rule A $s ↪ s $s;

constant symbol U (s : Sort) : TYPE;
// Lambdapi uses ( - ) for normal arguments and [ - ] for implicit arguments 
injective symbol El [s : Sort] (A : U s) : TYPE;

constant symbol u (s : Sort) : U (A s);
rule El (u $s) ↪ U $s;

constant symbol Π' [s₁ s₂ : Sort] [A : U s₁] (B : El A → U s₂) : U (R s₁ s₂);
notation Π' quantifier;
constant symbol λ' [s₁ s₂ : Sort] [A : U s₁] [B : El A → U s₂] (N : Π x : El A, El (B x)): El (Π' B);
notation λ' quantifier;
symbol ▪ [s₁ s₂ : Sort] [A : U s₁] [B : El A → U s₂] (M : El (Π' B)) (N : El A) : El (B N);
notation ▪ infix left 7;
rule (λ' $M) ▪ $N ↪ $M $N;

// we also define the following alias, to be used when we have Π' x : A. B with x not free in B
symbol ⇝ [s₁ s₂ : Sort] (A : U s₁) (B : U s₂) ≔ Π' [_] [_] [A] (λ _ : El A, B);
notation ⇝ infix right 6;

