# DomoUmbrellaReproduction.Umbrella

Domo is installed in both `domo_umbrella_reproduction` and `domo_umbrella_reproduction_web`.

## Setup

```sh
asdf install
mix setup
```

## Reproducing [Domo#23](https://github.com/IvanRublev/Domo/pull/23)

A fresh setup with only the `phx.new` and `domo` installed and configured.
The `apps/domo_umbrella_reproduction/lib/domo_umbrella_reproduction/product.ex` File uses Domo and the `domo_umbrella_reproduction_web` depends on `domo_umbrella_reproduction`.
This is enough for the hot reload compiler to fail.

So to provoke the Issue, start the Phoenix Webserver, in the Umrella Root Folder run `mix phx.server` and overse the following:

```
❯ mix phx.server
==> domo_umbrella_reproduction
Generated domo_umbrella_reproduction app
** (CompileError) domo_phoenix_hot_reload: :elixir compiler wasn't run. Please, check if :domo_phoenix_hot_reload is placed after :elixir in the compilers list in the mix.exs file and in reloadable_compilers list in the configuration file.
    (domo 1.5.8) lib/domo/raises.ex:263: Domo.Raises.raise_no_elixir_compiler_was_run/0
    (domo 1.5.8) lib/mix/task.compile.domo_phoenix_hot_reload.ex:14: Mix.Tasks.Compile.DomoPhoenixHotReload.run/1
    (mix 1.14.0) lib/mix/task.ex:421: anonymous fn/3 in Mix.Task.run_task/4
    (elixir 1.14.0) lib/file.ex:1607: File.cd!/2
    (mix 1.14.0) lib/mix/project_stack.ex:61: Mix.ProjectStack.on_recursing_root/1
    (mix 1.14.0) lib/mix/tasks/compile.all.ex:92: Mix.Tasks.Compile.All.run_compiler/2
    (mix 1.14.0) lib/mix/tasks/compile.all.ex:72: Mix.Tasks.Compile.All.compile/4
    (mix 1.14.0) lib/mix/tasks/compile.all.ex:59: Mix.Tasks.Compile.All.with_logger_app/2
```

It is not possible to configure the mentioned `reloadable_compilers` for the `domo_umrella_reproduction` App as it is not a Phoenix Application, only `domo_umbrella_reproduction_web` is.

The Proposed change in [Domo#23](https://github.com/IvanRublev/Domo/pull/23) goes through all Umbrella Apps and only acts on Apps that have the `:domo_phoenix_hot_reload` compiler in their compiler chain.
For non Phoenix Apps (`domo_umbrella_reproduction`) it does not seem to make a difference if the compiler is added to the `mix.exs` compilers property or not, which is why I left it out in this example.
