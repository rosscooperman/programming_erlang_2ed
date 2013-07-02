-module(mylists).
-compile(export_all).

sum([]) -> 0;
sum([H|T]) -> H + sum(T).

map(_, []) -> [];
map(F, [H|T]) -> [F(H)|map(F, T)].
