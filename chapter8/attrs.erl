-module(attrs).
-vsn('1.2.3.4').
-author({ross,cooperman}).
-purpose("learning about attributes").
-export([fac/1]).

fac(1) -> 1;
fac(N) -> N * fac(N - 1).
