-module(terminal_logger).
-behaviour(gen_event).

-export([init/1, handle_event/2, terminate/2, handle_call/2]).

init(_Args) ->
    {ok, []}.

handle_event(Info, State) ->
    io:format("***Info*** ~p~n", [Info]),
    {ok, State}.

handle_call(_, _) ->
    noop.

terminate(_Args, _State) ->
    ok.
