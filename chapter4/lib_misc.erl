-module(lib_misc).
-compile(export_all).
-import(lists, [seq/2]).

for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I)|for(I + 1, Max, F)].

qsort([]) -> [];
qsort([Pivot|T]) ->
  qsort([X || X <- T, X < Pivot])
  ++ [Pivot] ++
  qsort([X || X <- T, X >= Pivot]).

pythag(N) ->
  [ {A,B,C} || A <- seq(1,N), B <- seq(1,N), C <- seq(1,N), A+B+C =< N, A*A+B*B =:= C*C ].

perms([]) -> [[]];
perms(L) -> [[H|T] || H <- L, T <- perms(L--[H])].

odds_and_evens({[H|T], Odds, Evens}) ->
  case (H rem 2) of
    1 -> odds_and_evens({T, [H|Odds], Evens});
    0 -> odds_and_evens({T, Odds, [H|Evens]})
  end;
odds_and_evens({[], Odds, Evens}) -> {lists:reverse(Odds), lists:reverse(Evens)};
odds_and_evens(List) -> odds_and_evens({List, [], []}).

my_tuple_to_list(T) when tuple_size(T) > 0 -> [element(1,T)|my_tuple_to_list(erlang:delete_element(1,T))];
my_tuple_to_list({}) -> [].

my_time_func(F) ->
  {_,Start,_} = now(),
  F(),
  {_,End,_} = now(),
  End - Start.

my_date_string() ->
  {Y,O,D} = date(),
  {H,M,_} = time(),
  lists:flatten(io_lib:format("~p/~p/~p ~2..0B:~p", [O, D, Y, H, M])).

