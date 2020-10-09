defmodule Battery do
  defstruct [:id, :column_list]
end

defmodule Column do
  defstruct [:id_char, :lowfloor, :highfloor, :nb_elevators, :elevator_list]
end

defmodule Elevator do
  defstruct [:elevator_id, :status, :elevator_floor, :elevator_direction, :floor_list]
end

defmodule Commercial_Controller do
  def main do
    elevator1 = %Elevator{elevator_id: 1, status: "IDLE", elevator_floor: 1, elevator_direction: "IDLE"}
    elevator2 = %Elevator{elevator_id: 2, status: "IDLE", elevator_floor: 1, elevator_direction: "IDLE"}
    elevator3 = %Elevator{elevator_id: 3, status: "IDLE", elevator_floor: 1, elevator_direction: "IDLE"}
    elevator4 = %Elevator{elevator_id: 4, status: "IDLE", elevator_floor: 1, elevator_direction: "IDLE"}
    elevator5 = %Elevator{elevator_id: 5, status: "IDLE", elevator_floor: 1, elevator_direction: "IDLE"}
    elevator_list = [elevator1, elevator2, elevator3, elevator4, elevator5]
    wantedelevator = Enum.at(elevator_list, 2)
    IO.puts(wantedelevator.elevator_id)
    column1 = %Column{id_char: 'A', lowfloor: -6, highfloor: 0, elevator_list: elevator_list}
    column2 = %Column{id_char: 'B', lowfloor: 0, highfloor: 19, elevator_list: elevator_list}
    column3 = %Column{id_char: 'C', lowfloor: 20, highfloor: 39, elevator_list: elevator_list}
    column4 = %Column{id_char: 'D', lowfloor: 40, highfloor: 59, elevator_list: elevator_list}
    column_list = [column1, column2, column3, column4]
    #wantedcolumn = Enum.at(column_list, 3)
    battery1 = %Battery{id: 1, column_list: column_list}
    IO.inspect battery1
    #IO.puts (battery1.column_list.lowfloor
    scenario1()
  end

  def scenario1 do
    requested_floor = 8
    elevator_floor = 2
    operate(requested_floor, elevator_floor)
    IO.puts("Requested floor:")
    IO.puts(requested_floor)
    IO.puts("Elevator floor:")
    IO.puts(elevator_floor)
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

  def operate(requested_floor, elevator_floor) do
    if elevator_floor <= requested_floor do
      IO.puts("Have to move UP")
      moveup(requested_floor, elevator_floor)
      opendoors()
    else
      IO.puts("Have to move DOWN")
      movedown(requested_floor, elevator_floor)
      opendoors()
    end
  end

  def opendoors do
    IO.puts("Open Doors")
    IO.puts("---Open Doors---")
    IO.puts("*Button Light Off*")
    IO.puts("User enter/exits the elevator")
    IO.puts("---Closing Doors---")
    IO.puts("Closed Doors")
  end

  def moveup(requested_floor, elevator_floor) do
    #IO.puts("Column : X // Elevator : #13  Current Floor : "<>elevator_floor)
    if requested_floor != elevator_floor do
      #IO.puts("Column : X // Elevator : #13  Floor : "<>elevator_floor)
      elevator_floor = elevator_floor + 1
      IO.puts("Elevator at")
      IO.puts elevator_floor
      moveup(requested_floor, elevator_floor)
      #IO.puts("Elevator at")
      #IO.puts elevator_floor
    end
  end

  def movedown(requested_floor, elevator_floor) do
    IO.puts("Column : X // Elevator : #13  Current Floor : "<>elevator_floor)
    if requested_floor != elevator_floor do
      IO.puts("Column : X // Elevator : #13  Floor : "<>elevator_floor)
      elevator_floor = elevator_floor - 1
    end
  end
end

Commercial_Controller.main

# Au lieu de d'essayer de faire un projet tout croche et à essayer un nouveau langage sur la fin de la semaine,
# J'ai trouvé ça plus interressant de faire une petite blague...:)
# J'ai profiter du reste de la semaine pour aider les gens qui étaient dans le besoin ! :)
# Bonne fin de semaine !
