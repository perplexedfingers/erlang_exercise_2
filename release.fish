function start_first_release
    rebar3 as prod release
    PORT=8000 _build/prod/rel/erlang_exercise/bin/erlang_exercise-0.1.0 console
end

function start_upgrade
    git stash pop
    cp apps/erlang_exercise/src/erlang_exercise.appup.src _build/prod/lib/erlang_exercise/ebin/erlang_exercise.appup
    rebar3 as prod release
    rebar3 as prod relup --relname erlang_exercise --relvsn "0.1.1"  --upfrom "0.1.0"
    rebar3 as prod tar --relname erlang_exercise --relvsn "0.1.1"  --upfrom "0.1.0"
    cp _build/prod/rel/erlang_exercise/erlang_exercise-0.1.1.tar.gz \
       _build/prod/rel/erlang_exercise/releases/0.1.1/erlang_exercise.tar.gz
    PORT=8000 _build/prod/rel/erlang_exercise/bin/erlang_exercise-0.1.0 upgrade 0.1.1
end
