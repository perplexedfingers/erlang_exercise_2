-module(the_server).

-behaviour(gen_server).

-export([start_link/0, terminate/2]).
-export([go_up/0, go_down/0]).
-export([init/1, handle_call/3, handle_cast/2]).

-spec the_server:go_up_logic(Count :: integer) -> integer.


start_link() ->
    gen_server:start_link({local, server}, the_server, [], []).

init(_Args) ->
    {ok, 0}.  % Let initial value be adjustable

terminate(shutdown, _State) ->
    ok.

go_up() ->
    gen_server:call(server, up).

go_down() ->
    gen_server:call(server, down).

handle_call(up, _From, Count) ->
    {reply, ok, go_up_logic(Count)}.

% Reset the value
% handle_cast({free, Ch}, Chs) ->
%     Chs2 = free(Ch, Chs),
%     {noreply, Chs2}.

handle_cast(_, _) ->
    noop.

go_up_logic(Count) ->
    Count + 1.
