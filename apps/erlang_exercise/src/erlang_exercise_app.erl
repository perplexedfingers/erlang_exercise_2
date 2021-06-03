%%%-------------------------------------------------------------------
%% @doc erlang_exercise public API
%% @end
%%%-------------------------------------------------------------------

-module(erlang_exercise_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    Dispatch = cowboy_router:compile([
        {'_', [{"/", hello_handler, []}]}
    ]),
    {ok, Port} = application:get_env(port),
    {ok, _} = cowboy:start_clear(my_http_listener,
        [{port, Port}],
        #{env => #{dispatch => Dispatch}}
    ),
    erlang_exercise_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
