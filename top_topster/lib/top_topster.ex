defmodule TopTopster do
  def build(file_name) do
    file_name
    |>File.read()
    |>handle_file_read()
  end

  def handle_file_read({:ok, result}) do
    result =
      result
      |>String.split(",")
      |>Enum.map(&convert_and_evaluate_numbers/1)
      {:ok, result}
  end

  def handle_file_read({:error, reason}), do: {:error, "Deu erro por causa de #{reason}"}

  def convert_and_evaluate_numbers(element) do
    number = String.to_integer(element)
    evaluate_numbers(number)
  end

  def evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :toptopster
  def evaluate_numbers(number) when rem(number, 3) == 0 , do: :top
  def evaluate_numbers(number) when rem(number, 5) == 0 , do: :topster
  def evaluate_numbers(number), do: number
end
