(* Un type triléen, avec l'ajout des opérateurs associés : &&& ||| et tnot *)

type t = T | F | U

let ( ||| ) a b = match a, b with
	| T, _ | _, T -> T
	| U, _ | _, U -> U
	| _ -> F

let ( &&& ) a b = match a, b with
	| F, _ | _, F -> F
	| U, _ | _, U -> U
	| _ -> T

let tnot = function
	| T -> F
	| F -> T
	| U -> U

(* Une tentative d'implémentation pratique de l'évaluation paresseuse, mais finalement ca optimisait quasiment pas *)

let lazy_or a b = match a with
	| T -> T
	| _ -> a ||| (b ())

let lazy_and a b = match a with
	| F -> F
	| _ -> a &&& (b ())

let string_of_trilean = function
	| T -> "T"
	| F -> "F"
	| U -> "?"
