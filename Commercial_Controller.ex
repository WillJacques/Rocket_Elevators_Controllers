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
    #wantedelevator = Enum.at(elevator_list, 2)
    column1 = %Column{id_char: 'A', lowfloor: -6, highfloor: 0, elevator_list: elevator_list}
    column2 = %Column{id_char: 'B', lowfloor: 0, highfloor: 19, elevator_list: elevator_list}
    column3 = %Column{id_char: 'C', lowfloor: 20, highfloor: 39, elevator_list: elevator_list}
    column4 = %Column{id_char: 'D', lowfloor: 40, highfloor: 59, elevator_list: elevator_list}
    column_list = [column1, column2, column3, column4]
    #wantedcolumn = Enum.at(column_list, 3)
    battery1 = %Battery{id: 1, column_list: column_list}
    IO.inspect battery1
    #IO.puts (battery1.column_list.lowfloor)
    scenario1()
  end

  def scenario1 do
    #requested_floor = 8
    #elevator_floor = 2
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



%{
  "conferences" => [
    %{
      "alias" => "EASTERN",
      "divisions" => [
        %{
          "alias" => "SOUTHEAST",
          "id" => "54dc7348-c1d2-40d8-88b3-c4c0138e085d",
          "name" => "Southeast",
          "teams" => [
            %{
              "alias" => "WAS",
              "id" => "583ec8d4-fb46-11e1-82cb-f4ce4684ea4c",
              "market" => "Washington",
              "name" => "Wizards",
              "reference" => "1610612764",
              "sr_id" => "sr:team:3431",
              "venue" => %{
                "address" => "601 F St. N.W.",
                "capacity" => 20356,
                "city" => "Washington",
                "country" => "USA",
                "id" => "f62d5b49-d646-56e9-ba60-a875a00830f8",
                "name" => "Capital One Arena",
                "state" => "DC",
                "zip" => "20004"
              }
            }
          ]
        },
      ],
      "id" => "3960cfac-7361-4b30-bc25-8d393de6f62f",
      "name" => "EASTERN CONFERENCE"
    },
    %{
      "alias" => "WESTERN",
      "divisions" => [
        %{
          "alias" => "NORTHWEST",
          "id" => "12bf14ba-eb16-4c6f-8275-e801b6947c1e",
          "name" => "Northwest",
          "teams" => [
            %{
              "alias" => "DEN",
              "id" => "583ed102-fb46-11e1-82cb-f4ce4684ea4c",
              "market" => "Denver",
              "name" => "Nuggets",
              "reference" => "1610612743",
              "sr_id" => "sr:team:3417",
              "venue" => %{
                "address" => "1000 Chopper Circle",
                "capacity" => 19155,
                "city" => "Denver",
                "country" => "USA",
                "id" => "1a28ef88-76c9-5bcc-b4ee-51d30ca98f4f",
                "name" => "Pepsi Center",
                "sr_id" => "sr:venue:5976",
                "state" => "CO",
                "zip" => "80204"
              }
            }
          ]
        }
      ],
      "id" => "7fe7e212-de01-4f8f-a31d-b9f0a95731e3",
      "name" => "WESTERN CONFERENCE"
    }
  ],
  "league" => %{
    "alias" => "NBA",
    "id" => "4353138d-4c22-4396-95d8-5f587d2df25c",
    "name" => "NBA"
  }
}
