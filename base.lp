constant symbol Sort : TYPE;
constant symbol U : Sort → TYPE;

constant symbol END : TYPE;
constant symbol ■ : END;

constant symbol ⊤: TYPE;
constant symbol I : ⊤;

symbol ∃𝓡 : Sort → Sort → TYPE;
symbol 𝓡 : Sort → Sort → Sort;
symbol 𝓐 : Sort → Sort;

injective symbol El : Π {s : Sort}, U s → TYPE;

constant symbol u s : U (𝓐 s);
rule El (u $s) ↪ U $s;

constant symbol Prod {s1 s2} (_ : ∃𝓡 s1 s2) : Π (A : U s1) (B : El A → U s2), U (𝓡 s1 s2);
constant symbol abs {s1 s2} (i : ∃𝓡 s1 s2) : Π {A : U s1} {B : El A → U s2}, (Π x : El A, El (B x)) → El (Prod i A B);
symbol app {s1 s2} (i : ∃𝓡 s1 s2) : Π {A : U s1} {B : El A → U s2}, El (Prod i A B) → Π x : El A, END → El (B x);
rule app _ (abs _ $M) $N _ ↪ $M $N;
