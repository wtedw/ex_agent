defmodule ExAgent do
  use Application
  @moduledoc """
  Documentation for `ExAgent`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ExAgent.hello()
      :world

  """
  def hello do
    :world
  end

  @impl true
  def start(_type, _args) do
    # Although we don't use the supervisor name below directly,
    # it can be useful when debugging or introspecting the system.
    IO.puts("test")
    ExAgent.Supervisor.start_link(name: ExAgent.Supervisor)
  end
end
