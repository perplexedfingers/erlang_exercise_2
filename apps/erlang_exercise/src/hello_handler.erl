-module(hello_handler).

-import(the_server, [go_up/0]).

-export([init/2]).

init(Req0, State) ->
    ok = go_up(),
    Req = cowboy_req:reply(200, #{<<"content-type">> => <<"text/plain">>}, <<"+1!">>, Req0),
    {ok, Req, State}.
