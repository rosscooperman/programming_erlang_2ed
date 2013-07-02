-module(lib_misc).
-compile(export_all).

reverse_binary(Bin) -> list_to_binary(lists:reverse(binary_to_list(Bin))).

term_to_packet(Term) ->
  Bin  = term_to_binary(Term),
  Size = byte_size(Bin),
  <<Size:32, Bin/binary>>.

packet_to_term(<<_:32, Bin/binary>>) -> binary_to_term(Bin).

term_packet_test(Term) ->
  Term = packet_to_term(term_to_packet(Term)),
  {ok, Term}.

reverse_bits(Bin) ->
  Bytes = [ lists:reverse([ X || <<X:1>> <= <<Byte:8>> ]) || Byte <- lists:reverse(binary_to_list(Bin)) ],

