-module(server_test).

-include_lib("eunit/include/eunit.hrl").


simple_test() ->
    the_server:start_link(),
    ?assertEqual(0, the_server:show_now()),
    the_server:go_up(),
    ?assertEqual(1, the_server:show_now()).
