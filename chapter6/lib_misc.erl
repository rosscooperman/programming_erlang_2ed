-module(lib_misc).
-compile(export_all).

sqrt(X) when X < 0 -> error({squareRootNegativeArgument, X});
sqrt(X) -> math:sqrt(X).

read(File) ->
  case file:read_file(File) of
    {ok, Bin}    -> Bin;
    {error, Why} -> error({fileReadError, Why})
  end.

