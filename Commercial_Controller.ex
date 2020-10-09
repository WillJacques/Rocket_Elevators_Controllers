#Scenario list start at line 17 ! It ain't much but it's honest work !
#It will start on compile ! Thank you !

#Define Battery structure
defmodule Battery do
  defstruct [:id, :column_list]
end

#Define Column structure
defmodule Column do
  defstruct [:id_char, :lowfloor, :highfloor, :nb_elevators, :elevator_list]
end

#Define Elevator structure
defmodule Elevator do
  defstruct [:elevator_id, :status, :elevator_floor, :elevator_direction, :floor_list]
end

defmodule Commercial_Controller do
  def main do
    scenario1()
    #scenario2()
    #scenario3()
    #scenario4()
  end

  def scenario1 do
    elevator1 = %Elevator{elevator_id: 1, status: "MOVING", elevator_floor: 19, elevator_direction: "DOWN"}
    elevator2 = %Elevator{elevator_id: 2, status: "MOVING", elevator_floor: 2, elevator_direction: "UP"}
    elevator3 = %Elevator{elevator_id: 3, status: "MOVING", elevator_floor: 12, elevator_direction: "DOWN"}
    elevator4 = %Elevator{elevator_id: 4, status: "MOVING", elevator_floor: 14, elevator_direction: "DOWN"}
    elevator5 = %Elevator{elevator_id: 5, status: "MOVING", elevator_floor: 5, elevator_direction: "DOWN"}
    elevator_list = [elevator1, elevator2, elevator3, elevator4, elevator5]
    #wantedelevator = Enum.at(elevator_list, 2)
    #IO.puts(wantedelevator.elevator_id)
    column1 = %Column{id_char: 'A', lowfloor: -6, highfloor: 0, elevator_list: elevator_list}
    column2 = %Column{id_char: 'B', lowfloor: 0, highfloor: 19, elevator_list: elevator_list}
    column3 = %Column{id_char: 'C', lowfloor: 20, highfloor: 39, elevator_list: elevator_list}
    column4 = %Column{id_char: 'D', lowfloor: 40, highfloor: 59, elevator_list: elevator_list}
    column_list = [column1, column2, column3, column4]
    battery1 = %Battery{id: 1, column_list: column_list}
    IO.puts("##################")
    IO.puts("Scenario 1 Started")
    IO.puts("##################")
    #wantedcolumn = Enum.at(column_list,1)
    #req_elevator = Battery.wantedcolumn.request_elevator(0, "UP", 'B')
    #Battery.wantedcolumn.request_floor(req_elevator, 19, 'B')
    column_used = "B"
    requested_floor = 0                               # request from floor =
    req_elevator = elevator5                          # best elevator for the request
    elevator_floor = req_elevator.elevator_floor      # floor of required elevator =
    elevator_request = 19                             # floor called inside elevator
    elevator_floor = operate_elevator(requested_floor, elevator_floor, req_elevator, column_used)
    elevator_floor = operate_elevator(elevator_request, elevator_floor, req_elevator, column_used)
    IO.puts("##################")
    IO.puts("Scenario 1 Ended !")
    IO.puts("##################")
  end

  def scenario2 do
    elevator1 = %Elevator{elevator_id: 1, status: "MOVING", elevator_floor: 0, elevator_direction: "UP"}
    elevator2 = %Elevator{elevator_id: 2, status: "MOVING", elevator_floor: 22, elevator_direction: "UP"}
    elevator3 = %Elevator{elevator_id: 3, status: "MOVING", elevator_floor: 32, elevator_direction: "DOWN"}
    elevator4 = %Elevator{elevator_id: 4, status: "MOVING", elevator_floor: 39, elevator_direction: "DOWN"}
    elevator5 = %Elevator{elevator_id: 5, status: "MOVING", elevator_floor: 38, elevator_direction: "DOWN"}
    elevator_list = [elevator1, elevator2, elevator3, elevator4, elevator5]
    #wantedelevator = Enum.at(elevator_list, 2)
    #IO.puts(wantedelevator.elevator_id)
    column1 = %Column{id_char: 'A', lowfloor: -6, highfloor: 0, elevator_list: elevator_list}
    column2 = %Column{id_char: 'B', lowfloor: 0, highfloor: 19, elevator_list: elevator_list}
    column3 = %Column{id_char: 'C', lowfloor: 20, highfloor: 39, elevator_list: elevator_list}
    column4 = %Column{id_char: 'D', lowfloor: 40, highfloor: 59, elevator_list: elevator_list}
    column_list = [column1, column2, column3, column4]
    battery1 = %Battery{id: 1, column_list: column_list}
    IO.puts("##################")
    IO.puts("Scenario 2 Started")
    IO.puts("##################")
    #wantedcolumn = Enum.at(column_list,1)
    #req_elevator = Battery.wantedcolumn.request_elevator(0, "UP", 'c')
    #Battery.wantedcolumn.request_floor(req_elevator, 36, 'c')
    column_used = "C"
    requested_floor = 0                               # request from floor =
    req_elevator = elevator1                          # best elevator for the request
    elevator_floor = req_elevator.elevator_floor      # floor of required elevator =
    elevator_request = 36                             # floor called inside elevator
    elevator_floor = operate_elevator(requested_floor, elevator_floor, req_elevator, column_used)
    elevator_floor = operate_elevator(elevator_request, elevator_floor, req_elevator, column_used)
    IO.puts("##################")
    IO.puts("Scenario 2 Ended !")
    IO.puts("##################")
  end

  def scenario3 do
    elevator1 = %Elevator{elevator_id: 1, status: "MOVING", elevator_floor: 57, elevator_direction: "DOWN"}
    elevator2 = %Elevator{elevator_id: 2, status: "MOVING", elevator_floor: 49, elevator_direction: "UP"}
    elevator3 = %Elevator{elevator_id: 3, status: "MOVING", elevator_floor: 45, elevator_direction: "UP"}
    elevator4 = %Elevator{elevator_id: 4, status: "MOVING", elevator_floor: 0, elevator_direction: "UP"}
    elevator5 = %Elevator{elevator_id: 5, status: "MOVING", elevator_floor: 59, elevator_direction: "DOWN"}
    elevator_list = [elevator1, elevator2, elevator3, elevator4, elevator5]
    #wantedelevator = Enum.at(elevator_list, 2)
    #IO.puts(wantedelevator.elevator_id)
    column1 = %Column{id_char: 'A', lowfloor: -6, highfloor: 0, elevator_list: elevator_list}
    column2 = %Column{id_char: 'B', lowfloor: 0, highfloor: 19, elevator_list: elevator_list}
    column3 = %Column{id_char: 'C', lowfloor: 20, highfloor: 39, elevator_list: elevator_list}
    column4 = %Column{id_char: 'D', lowfloor: 40, highfloor: 59, elevator_list: elevator_list}
    column_list = [column1, column2, column3, column4]
    battery1 = %Battery{id: 1, column_list: column_list}
    IO.puts("##################")
    IO.puts("Scenario 3 Started")
    IO.puts("##################")
    #wantedcolumn = Enum.at(column_list,1)
    #req_elevator = Battery.wantedcolumn.request_elevator(53, "DOWN", 'D')
    #Battery.wantedcolumn.request_floor(req_elevator, 0, 'D')
    column_used = "D"
    requested_floor = 53                              # request from floor =
    req_elevator = elevator1                          # best elevator for the request
    elevator_floor = req_elevator.elevator_floor      # floor of required elevator =
    elevator_request = 0                              # floor called inside elevator
    elevator_floor = operate_elevator(requested_floor, elevator_floor, req_elevator, column_used)
    elevator_floor = operate_elevator(elevator_request, elevator_floor, req_elevator, column_used)
    IO.puts("##################")
    IO.puts("Scenario 3 Ended !")
    IO.puts("##################")
  end

  def scenario4 do
    elevator1 = %Elevator{elevator_id: 1, status: "IDLE", elevator_floor: -4, elevator_direction: "IDLE"}
    elevator2 = %Elevator{elevator_id: 2, status: "IDLE", elevator_floor: 0, elevator_direction: "IDLE"}
    elevator3 = %Elevator{elevator_id: 3, status: "MOVING", elevator_floor: -3, elevator_direction: "DOWN"}
    elevator4 = %Elevator{elevator_id: 4, status: "MOVING", elevator_floor: -6, elevator_direction: "DOWN"}
    elevator5 = %Elevator{elevator_id: 5, status: "MOVING", elevator_floor: -1, elevator_direction: "DOWN"}
    elevator_list = [elevator1, elevator2, elevator3, elevator4, elevator5]
    #wantedelevator = Enum.at(elevator_list, 2)
    #IO.puts(wantedelevator.elevator_id)
    column1 = %Column{id_char: 'A', lowfloor: -6, highfloor: 0, elevator_list: elevator_list}
    column2 = %Column{id_char: 'B', lowfloor: 0, highfloor: 19, elevator_list: elevator_list}
    column3 = %Column{id_char: 'C', lowfloor: 20, highfloor: 39, elevator_list: elevator_list}
    column4 = %Column{id_char: 'D', lowfloor: 40, highfloor: 59, elevator_list: elevator_list}
    column_list = [column1, column2, column3, column4]
    battery1 = %Battery{id: 1, column_list: column_list}
    IO.puts("##################")
    IO.puts("Scenario 4 Started")
    IO.puts("##################")
    #wantedcolumn = Enum.at(column_list,1)
    #req_elevator = Battery.wantedcolumn.request_elevator(-3, "UP", 'A')
    #Battery.wantedcolumn.request_floor(req_elevator, 0, 'A')
    column_used = "A"
    requested_floor = -3                              # request from floor =
    req_elevator = elevator4                          # best elevator for the request
    elevator_floor = req_elevator.elevator_floor      # floor of required elevator =
    elevator_request = 0                              # floor called inside elevator
    elevator_floor = operate_elevator(requested_floor, elevator_floor, req_elevator, column_used)
    elevator_floor = operate_elevator(elevator_request, elevator_floor, req_elevator, column_used)
    IO.puts("##################")
    IO.puts("Scenario 4 Ended !")
    IO.puts("##################")
  end

  def request_elevator(floor_number, direction, id_char) do
    IO.puts("####################################")
    IO.puts(">>> User request an elevator at floor #{floor_number} to go #{direction} <<<")
    IO.puts("*Call Button Light On*")
    #request_elevator = elevator4 #find_best_elevator(floor_number, direction)
    #request_elevator.send_1request(floor_number, id_char)
    #request_elevator
  end

  def request_floor(request_elevator, request_floor, id_char) do
    IO.puts("Requested floor : #{RequestedFloor}")
    IO.puts("*Call Button Light On*")
    request_elevator.send_2request(request_floor, id_char)
  end

  def send_1request(request_floor, id_char) do
    # add requested floor to floor_list, sort and send first in line
    #operate_elevator(requested_floor, id_char)
  end

  def send_2request(request_floor, id_char) do
    # add requested floor to floor_list, sort and send first in line, and put on IDLE when floor_list is empty
    #operate_elevator(requested_floor, id_char)
  end

  def operate_elevator(requested_floor, elevator_floor, req_elevator, column_used) do #HAve maybe to add bestelevator current floor
    if elevator_floor <= requested_floor do
      elevator_floor = moveup(requested_floor, elevator_floor, req_elevator, column_used)
      opendoors()
      elevator_floor
    else
      elevator_floor = movedown(requested_floor, elevator_floor, req_elevator, column_used)
      opendoors()
      elevator_floor
    end
  end

  #def find_best_elevator(floor_number, direction) do
  #  IO.puts("Searching for best elevator to go to floor #{floor_number} in #{direction} direction.")
  #  if direction == "UP" do
  #  end
  #end

  def opendoors do
    IO.puts("Open Doors")
    IO.puts("---Open Doors---")
    IO.puts("*Button Light Off*")
    IO.puts("User enter/exits the elevator")
    IO.puts("---Closing Doors---")
    IO.puts("Closed Doors")
  end

  def moveup(requested_floor, elevator_floor, req_elevator, column_used) do
    IO.puts("Column : #{column_used} // Elevator : #{req_elevator.elevator_id} Floor : #{elevator_floor}")
    if requested_floor != elevator_floor do
      elevator_floor = elevator_floor + 1
      moveup(requested_floor, elevator_floor, req_elevator, column_used)
    else
      elevator_floor
    end
  end

  def movedown(requested_floor, elevator_floor, req_elevator, column_used) do
    IO.puts("Column : #{column_used} // Elevator : #{req_elevator.elevator_id} Current Floor : #{elevator_floor}")
    if requested_floor != elevator_floor do
      elevator_floor = elevator_floor - 1
      movedown(requested_floor, elevator_floor, req_elevator, column_used)
    else
      elevator_floor
    end
  end
end

Commercial_Controller.main
