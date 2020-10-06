defmodule TopTopsterTest do
  use ExUnit.Case

   describe "build/1" do
    test "Quando receber um arquivo válido, retorna a lista convertida" do
      resposta_esperada = {:ok,
      [1, 2, :top, 4, :topster, :top, 7, 8, :top, :topster, 11, :top, 13, 14,:toptopster]}

      assert TopTopster.build("numeros.txt") == resposta_esperada
    end

    test "Quando um arquivo inválido for recebido, retorna um erro"do
      resposta_esperada = {:error, "Deu erro por causa de enoent"}

      assert TopTopster.build("numeross.txt") == resposta_esperada
    end
  end
end
