require open 
  examples.SystemF.theory
  examples.SystemF.nat;

// impredicative encoding of lists of natural numbers

symbol ListNat : Type ≔ 
  `∀ A, A ⇝ (Nat ⇝ A ⇝ A) ⇝ A;
symbol empty : Elₜ ListNat ≔
  `Λ A, `λ' hd, `λ' tl, hd;
symbol cons : Elₜ (Nat ⇝ ListNat ⇝ ListNat) ≔
  `λ' n, `λ' l, `Λ A, `λ' hd, `λ' tl, tl ▪ n ▪ (l at A ▪ hd ▪ tl);

symbol map : Elₜ ((Nat ⇝ Nat) ⇝ ListNat ⇝ ListNat) ≔
  `λ' f, `λ' l, l at ListNat ▪ empty ▪ (`λ' x, `λ' s, cons ▪ (f ▪ x) ▪ s);

symbol list1 ≔ cons ▪ two ▪ (cons ▪ three ▪ empty);
symbol list2 ≔ cons ▪ five ▪ (cons ▪ six ▪ empty);

// map (fun x → x + 3) list1 = list2
assert ⊢ map ▪ (`λ' x, sum ▪ x ▪ three) ▪ list1 ≡ list2;
