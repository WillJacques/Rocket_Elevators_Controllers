defmodule Commercial_Controller do
  def main do
    scenario1()
  end

  def scenario1 do
    andie = "7"
    nellie = "5"
    coralie = "3"
    lexie = "1"
    IO.puts "Hello Andie you're "<>andie<>" years old !"
    IO.puts "Hello Nellie you're "<>nellie<>" years old !"
    IO.puts "Hello Coralie you're "<>coralie<>" years old !"
    IO.puts "Hello Lexie you're "<>lexie<>" years old !"
  end
end
