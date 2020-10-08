defmodule Commercial_Controller do
  def main do
    scenario1()
  end

  def scenario1 do
    my_int =123
    IO.puts "Integer #{is_integer(my_int)}"
  end
end
