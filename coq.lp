require open encodings.base;

constant symbol L : TYPE;
constant symbol z : L;
constant symbol s : L → L;
symbol max : L → L → L;
rule max z $i ↪ $i
with max $i z ↪ $i
with max (s $i) (s $j) ↪ s (max $i $j);


constant symbol Prop : Sort;
constant symbol Set : L → Sort;

rule ∃𝓡 (Set _) Prop ↪ ⊤
with ∃𝓡 Prop (Set _) ↪ ⊤
with ∃𝓡 (Set _) (Set _) ↪ ⊤
with ∃𝓡 Prop Prop ↪ ⊤;

rule 𝓐 (Set $i) ↪ Set (s $i)
with 𝓐 Prop ↪ Set z;

rule 𝓡 _ Prop ↪ Prop
with 𝓡 (Set $i) (Set $j) ↪ Set (max $i $j)
with 𝓡 Prop (Set $i) ↪ Set $i;
