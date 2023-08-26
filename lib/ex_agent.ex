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

  # @spec write_code_to_disk(
  #         binary
  #         | maybe_improper_list(
  #             binary | maybe_improper_list(any, binary | []) | byte,
  #             binary | []
  #           )
  #       ) :: :ok
  # def write_code_to_disk(code) do
  #   random_string = :rand.uniform(999888777) |> Integer.to_string()
  #   FileUtil.create_and_write_file("/tmp/" <> random_string, code)
  # end
end
