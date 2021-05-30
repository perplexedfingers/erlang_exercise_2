%%%-------------------------------------------------------------------
%% @doc erlang_exercise public API
%% @end
%%%-------------------------------------------------------------------

-module(erlang_exercise_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    erlang_exercise_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
