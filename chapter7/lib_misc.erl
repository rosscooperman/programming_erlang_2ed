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
  << <<Bit:1>> || Bit <- lists:reverse([ Bit || <<Bit:1>> <= Bin ]) >>.

