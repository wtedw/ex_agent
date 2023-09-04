defmodule ExAgent.Coderunner do
  @moduledoc """
  A module to write and execute Elixir code.
  """

  @doc """
  Writes the given code to a file in the /tmp directory.

  ## Examples

      iex> CodeRunner.write_code("IO.puts(\"Hello, world!\")")
      {:ok, "/tmp/code.ex"}

  """
  @spec write_code(String.t()) :: {:ok, String.t()} | {:error, term()}
  def write_code(code) do
    # Generate a unique file name
    file_name = "/tmp/code_#{:rand.uniform(1_000_000)}.ex"

    # Write the code to the file
    case File.write(file_name, code) do
      :ok ->
        {:ok, file_name}

      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc """
  Executes the code in the given file and returns the result.

  ## Examples

      iex> CodeRunner.execute_code("/tmp/code.ex")
      "Hello, world!"

  """
  @spec execute_code(String.t()) :: term() | {:error, term()}
  def execute_code(file_name) do
    case File.read(file_name) do
      {:ok, code} ->
        try do
          Code.eval_string(code)
        catch
          kind, reason ->
            {:error, {kind, reason}}
        end

      {:error, reason} ->
        {:error, reason}
    end
  end
end
