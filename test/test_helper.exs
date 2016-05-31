ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Aknascake.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Aknascake.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Aknascake.Repo)

