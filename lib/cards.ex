defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six",
      "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # List Comprehension, inherently a Map
    # These are LinkedLists (not arrays)
    # for suit <- suits do
    #   for value <- values do
    #     "#{value} of #{suit}"
    #   end
    # end
    # |> List.flatten

    # Can write nested comprehensions for flat list as following
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end

  end

  def shuffle(deck) do
     Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  # {hand, rest} returned by Enum.split is a Tuple
  def deal(deck, hand_size) do
    {hand, _} = deck
    |> shuffle
    |> Enum.split(hand_size)

    hand
  end

  def save(deck, filename) do
    # Whenever write Erlang code, just use :erlang
    # and then the erlang function

    # binary here is not actual term_to_binary
    # is just a writeable file
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end

end
