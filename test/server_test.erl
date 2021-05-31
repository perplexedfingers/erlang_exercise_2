-module(server_test).

-include_lib("eunit/include/eunit.hrl").

-import(the_server, [start_link/1, show_now/0, go_up/0]).

simple_test() ->
    gen_event:start_link({local, info_man}),
    start_link(0),
    ?assertEqual(0, show_now()),
    go_up(),
    ?assertEqual(1, show_now()).
