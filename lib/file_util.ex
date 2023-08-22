defmodule FileUtil do
  def create_and_write_file(file_path, content) do
    case File.write(file_path, content) do
      :ok ->
        IO.puts("File created and written successfully!")
      {:error, reason} ->
        IO.puts("Error creating/writing to file: #{reason}")
    end
  end
end
