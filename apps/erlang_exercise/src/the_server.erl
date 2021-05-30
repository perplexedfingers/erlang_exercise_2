-module(the_server).

-behaviour(gen_server).

-export([start_link/0, terminate/2]).
-export([go_up/0, go_down/0, show_now/0]).
-export([init/1, handle_call/3, handle_cast/2]).

start_link() ->
    gen_server:start_link({local, server}, the_server, [], []).

init(_Args) ->
    {ok, 0}.  % Let initial value be adjustable

terminate(shutdown, _State) ->
    ok.

show_now() ->
    gen_event:notify(info_man, "Query current value"),
    gen_server:call(server, show_now).

go_up() ->
    gen_event:notify(info_man, io:format("The value does UP and become '~p'~n", [what])),
    gen_server:call(server, up).

go_down() ->
    gen_event:notify(info_man, io:format("The value does DOWN and become '~p'~n", [what])),
    gen_server:call(server, down).

handle_call(up, _From, Count) ->
    {reply, ok, Count + 1};
handle_call(show_now, _From, Count) ->
    {reply, Count, Count}.

% Reset the value
% handle_cast({free, Ch}, Chs) ->
%     Chs2 = free(Ch, Chs),
%     {noreply, Chs2}.

handle_cast(_, _) ->
    noop.
