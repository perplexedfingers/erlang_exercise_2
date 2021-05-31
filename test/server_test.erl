-module(server_test).

-include_lib("eunit/include/eunit.hrl").

simple_test() ->
    %CounterRef = counters:new(1, [atomics]),
    %?assertEqual(0, counters:get(CounterRef, 1)),
    %counters:put(CounterRef, 1, 3),
    %?assertEqual(3, counters:get(CounterRef, 1)),
    %counters:add(CounterRef, 1, 1),
    %?assertEqual(4, counters:get(CounterRef, 1)).

    the_server:start_link(),
    ?assertEqual(0, the_server:show_now()),
    the_server:go_up(),
    ?assertEqual(1, the_server:show_now()).
