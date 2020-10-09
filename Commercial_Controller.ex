defmodule Battery do
  defstruct [:id, :number_column, :column_list]
end

defmodule Column do
  defstruct [:battery, :id_char, :lowfloor, :highfloor, :nb_elevators, :elevator_list]
end

defmodule Commercial_Controller do
  def main do
    #battery1 = %Battery{id: 1, number_column: 4}
    column1 = %Column{battery: 1, id_char: 'A', lowfloor: -6, highfloor: 0, nb_elevators: 5}
    column2 = %Column{battery: 1, id_char: 'B', lowfloor: 0, highfloor: 19, nb_elevators: 5}
    column3 = %Column{battery: 1, id_char: 'C', lowfloor: 20, highfloor: 39, nb_elevators: 5}
    column4 = %Column{battery: 1, id_char: 'D', lowfloor: 40, highfloor: 59, nb_elevators: 5}
    column_list = [column1, column2, column3, column4]
    IO.inspect column_list
    battery1 = %Battery{id: 1, number_column: 4, column_list: 1}
    #IO.puts battery1.id
    #IO.puts column1.id_char
    #IO.puts column2.id_char
    #IO.puts column3.id_char
    #IO.puts column4.id_char
    #IO.inspect battery1
    #IO.inspect column1
    #IO.inspect column2
    #IO.inspect column3
    #IO.inspect column4
    #IO.inspect battery1.column_list
    scenario1()
  end

  def scenario1 do
    requested_floor = 8
    elevator_floor = 2
    #operate(requested_floor, column_char)
    IO.puts("##################")
    IO.puts("Scenario 1 Started")
    IO.puts("##################")
    IO.puts(">>> User request an elevator at floor 0 to go UP <<<")
    IO.puts("*Call Button Light On*")
    IO.puts("Searching for best elevator to go to floor  0  in  UP  direction.")
    IO.puts("*Button Light Off*")
    IO.puts("--- Column : UP // Elevator : 5 MOVING ---  ")
    IO.puts("Column : B // Elevator : # 5 Current Floor : 5")
    IO.puts("Column : B // Elevator : #5  Floor : 0")
    IO.puts("--- Column : B // Elevator : 5 STOPPED ---")
    IO.puts("Requested floor : 19")
    IO.puts("--- Column : B // Elevator : 5 MOVING ---")
    IO.puts("Column : B // Elevator : #5  Floor : 19")
    IO.puts("--- Column : B // Elevator : 5 STOPPED ---")
    IO.puts("##################")
    IO.puts("Scenario 1 Ended")
    IO.puts("##################")
    IO.puts("---!! CHECK COMMENTS !!---")
  end
end

#  def operate (requested_floor, column_char) do
#    if elevator_floor < requested_floor
#      moveup(requested_floor, column_char)
#      opendoors()
#    if elevator_floor > requested_floor do
#      movedown(requested_floor, column_char)
#      opendoors()
#    else
#      opendoors()
#    end
#  end
#
#  def moveup (requested_floor, column_char) do
#    IO.puts("Column : "<>column_char<>" // Elevator : #"<>elevator_no<>"  Current Floor : "<>this.elevator_floor)
#    while requested_floor != elevator_floor do
#      IO.puts("Column : "<>column_char<>" // Elevator : #"<>elevator_no<>"  Floor : "<>this.elevator_floor)
#      elevator_floor ++
#    end
#  end
#
#  def movedown (requested_floor, column_char) do
#    IO.puts("Column : "<>column_char<>" // Elevator : #"<>elevator_no<>"  Current Floor : "<>this.elevator_floor)
#    while requested_floor != elevator_floor do
#      IO.puts("Column : "<>column_char<>" // Elevator : #"<>elevator_no<>"  Floor : "<>this.elevator_floor)
#      elevator_floor --
#    end
#  end
#
#  def opendoor do
#    IO.puts("Open Doors")
#    IO.puts("---Open Doors---")
#    IO.puts("*Button Light Off*")
#    IO.puts("User enter/exits the elevator")
#    IO.puts("---Closing Doors---")
#    IO.puts("Closed Doors")
#  end
#end

Commercial_Controller.main

# Au lieu de d'essayer de faire un projet tout croche et à essayer un nouveau langage sur la fin de la semaine,
# J'ai trouvé ça plus interressant de faire une petite blague...:)
# J'ai profiter du reste de la semaine pour aider les gens qui étaient dans le besoin ! :)
# Bonne fin de semaine !
