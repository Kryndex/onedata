#!/usr/bin/env escript
%%! -name parse@parse -setcookie cookie2

main([OpNodeStr]) ->
    OpNode = list_to_atom(OpNodeStr),
    ok = rpc:call(OpNode, fprof, trace,[[start, verbose, {procs, all}]]).