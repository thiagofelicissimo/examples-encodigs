require open encodings.base;

constant symbol Type : Sort;
constant symbol Kind : Sort;

// if we had ∃𝓡 _ Type ↪ ⊤ then we would have ∃𝓡 (𝓐 Kind) Type ≡ ⊤, absurd as 𝓐 Kind does not correspond to a sort
rule ∃𝓡 Type Type ↪ ⊤
with ∃𝓡 Kind Type ↪ ⊤;

rule 𝓡 _ Type ↪ Type;
rule 𝓐 Type ↪ Kind;



