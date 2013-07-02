-module(math_functions).
-compile(export_all).

even(Number) -> Number rem 2 =:= 0.

odd(Number) -> Number rem 2 =:= 1.

filter(F, L) -> [X || X <- L, F(X)].

split(L) -> split_accum(L, [], []).

split_accum([H|T], Even, Odd) ->
  case (H rem 2) of
    0 -> split_accum(T, [H|Even], Odd);
    1 -> split_accum(T, Even, [H|Odd])
  end;
split_accum([], Even, Odd) -> {lists:reverse(Even), lists:reverse(Odd)}.

split_filter(L) ->
  {filter(fun even/1, L), filter(fun odd/1, L)}.
