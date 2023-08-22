defmodule ExAgentTest do
  use ExUnit.Case
  doctest ExAgent

  test "greets the world" do
    assert ExAgent.hello() == :world
  end
end
