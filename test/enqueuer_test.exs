defmodule EnqueuerTest do
  use ExUnit.Case
  doctest Enqueuer

  test "greets the world" do
    assert Enqueuer.hello() == :world
  end
end
