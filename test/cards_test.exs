defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "greets the world" do
    assert Cards.hello() == :world
  end

  test "is/2" do
    assert Cards.is("brett", "cool") == "brett is cool"
  end
end
