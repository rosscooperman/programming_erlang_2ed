-module(mathy).
-export([sum/1]).

sum([]) -> 0;
sum(Numbers) ->
  [H|T] = Numbers,
  sum(T) + H.
