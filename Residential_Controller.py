# SCENARIO CHOICES ARE AT THE END OF THE PROGRAM, YOU ONLY HAVE TO UNCOMMENT THE WANTED ONE ! THANK YOU !

import time
import random

class Column:
    def __init__(self, nb_of_floor, nb_of_elevator):
        self.nb_of_floor = nb_of_floor
        self.nb_of_elevator = nb_of_elevator
        self.elevator_list = []
        for i in range(nb_of_elevator):
            self.elevator_list.append(Elevator(i, "IDLE", 1, "IDLE"))

    # Request elevator function with find best elevator

    def RequestElevator(self, FloorNumber, Direction):
        time.sleep(1)
        print("####################################")
        print(f">>> User request an elevator at floor", FloorNumber, "to go", Direction, "<<<")
        time.sleep(1)
        print(f"*Call Button Light On*")
        time.sleep(1)

        request_elevator = self.find_best_elevator(FloorNumber, Direction)
        request_elevator.send_request(FloorNumber)
        return request_elevator

    # Request floor inside elevator

    def RequestFloor(self, elevator_object, RequestedFloor):
        time.sleep(1)
        print(f">>> User wants to go to floor", RequestedFloor, "<<<")
        time.sleep(1)
        print(f"*Request Button Light On*")
        time.sleep(1)
        elevator_object.send_request(RequestedFloor)

    # Best elevator Function()

    def find_best_elevator(self, FloorNumber, Direction):
        print(f"Searching for best elevator to go to floor",
              FloorNumber, "in", Direction, "direction.")
        if FloorNumber == 10:
            Direction = "UP"
        elif FloorNumber == 1:
            Direction = "DOWN"
        resultArray = []
        scoreArray = []
        b_elevator = None
        bestElevator = None
        for i in range(len(self.elevator_list)):
            elevator_i = self.elevator_list[i]
            if (elevator_i.elevator_direction == Direction) and (elevator_i.elevator_floor < FloorNumber):
                resultArray.append(i)
                score = abs(elevator_i.elevator_floor - FloorNumber)
                scoreArray.append(score)

        if scoreArray == []:
            for i in range(len(self.elevator_list)):
                elevator_i = self.elevator_list[i]
                if (elevator_i.elevator_direction == "IDLE"):
                    resultArray.append(i)
                    score = abs(elevator_i.elevator_floor - FloorNumber)
                    scoreArray.append(score)

        if scoreArray == []:
            for i in range(len(self.elevator_list)):
                elevator_i = self.elevator_list[i]
                resultArray.append(i)
                score = abs(elevator_i.elevator_floor - FloorNumber)
                scoreArray.append(score)

        if len(resultArray) > 0:
            minimum = scoreArray[0]
            location = 0
            for i in range(1, len(scoreArray)):
                if scoreArray[i] < minimum:
                    minimum = scoreArray[i]
                    location = i
            b_elevator = resultArray[location]
        bestElevator = self.elevator_list[b_elevator]
        return bestElevator
        


class Elevator:
    def __init__(self, elevator_no, status, elevator_floor, elevator_direction):
        self.elevator_no = elevator_no
        self.elevator_letter = (chr(97 + elevator_no)).capitalize()
        self.status = status
        self.elevator_floor = elevator_floor
        self.elevator_direction = elevator_direction
        self.floor_list = []

    # Send Request then operate

    def send_request(self, RequestedFloor):
        self.floor_list.append(RequestedFloor)
        self.compute_list()
        self.operate_elevator(RequestedFloor)

    # Sort list if the elevator is going "UP" or "DOWN"

    def compute_list(self):
        if self.elevator_direction == "UP":
            self.floor_list.sort()                  # NORMAL SORT
        elif self.elevator_direction == "DOWN":
            self.floor_list.sort(reverse=True)      # REVERSE SORT
        return self.floor_list

    # System operation

    def operate_elevator(self, RequestedFloor):
        while len(self.floor_list) > 0:
            if RequestedFloor == self.elevator_floor:
                self.Open_door()
                self.status = "moving"
                self.floor_list.pop()
            elif RequestedFloor < self.elevator_floor:
                self.status = "moving"
                print(f"---Elevator " + self.elevator_letter, self.status, "---")
                self.elevator_direction = "DOWN"
                self.Move_down(RequestedFloor)
                self.status = "stopped"
                print(f"---Elevator " + self.elevator_letter, self.status, "---")
                self.Open_door()
                self.floor_list.pop()
            elif RequestedFloor > self.elevator_floor:
                self.status = "moving"
                print(f"---Elevator " + self.elevator_letter, self.status, "---")
                self.elevator_direction = "UP"
                self.Move_up(RequestedFloor)
                self.status = "stopped"
                print(f"---Elevator " + self.elevator_letter, self.status, "---")
                self.Open_door()
                self.floor_list.pop()
        self.elevator_direction = "IDLE"

    # OPEN DOORS FUNCTION

    def Open_door(self):
        time.sleep(1)
        print(f"Open Doors")
        print(f"---Opening Doors---")
        time.sleep(1)
        print(f"*Button Light Off*")
        print(f"User enters/exits the elevator")
        time.sleep(1)
        print(f"---Closing Doors---")
        time.sleep(1)
        self.Close_door()

    # CLOSE DOORS FUNCTION

    def Close_door(self):

        print(f"Closed Doors")
        time.sleep(1)

    # MOVE THE ELEVATOR UP FUNCTION

    def Move_up(self, RequestedFloor):
        print(f"Floor : ", self.elevator_floor)
        time.sleep(1)
        while self.elevator_floor != RequestedFloor:
            self.elevator_floor += 1
            print(f"Floor : ", self.elevator_floor)
            time.sleep(1)

    # MOVE THE ELEVATOR DOWN FUNCTION

    def Move_down(self, RequestedFloor):
        print(f"Floor : ", self.elevator_floor)
        time.sleep(1)
        while self.elevator_floor != RequestedFloor:
            self.elevator_floor -= 1
            print(f"Floor : ", self.elevator_floor)
            time.sleep(1)


def scenario1():
    column = Column(10, 2)

    print("##### Scenario 1 Started ! #####")
    
    column.elevator_list[0].elevator_floor = 2              # set elevator 1 floor
    column.elevator_list[1].elevator_floor = 6              # set elevator 2 floor

    called_elevator = column.RequestElevator(3, "UP")       # User call on floor with direction
    column.RequestFloor(called_elevator, 7)                 # User call inside elevator

    print("##### Scenario 1 Ended ! #####")


def scenario2():
    column = Column(10, 2)

    print("##### Scenario 2 Started ! #####")

    column.elevator_list[0].elevator_floor = 10             # set elevator 1 floor
    column.elevator_list[1].elevator_floor = 3              # set elevator 2 floor

    called_elevator = column.RequestElevator(1, "UP")       # User call on floor with direction
    column.RequestFloor(called_elevator, 6)                 # User call inside elevator
    called_elevator = column.RequestElevator(3, "UP")       # User call on floor with direction
    column.RequestFloor(called_elevator, 5)                 # User call inside elevator
    called_elevator = column.RequestElevator(9, "DOWN")     # User call on floor with direction
    column.RequestFloor(called_elevator, 2)                 # User call inside elevator

    print("##### Scenario 2 Ended ! #####")

def scenario3():
    column = Column(10, 2)

    print("##### Scenario 3 Started ! #####")
    
    column.elevator_list[0].elevator_floor = 10             # set elevator 1 floor
    column.elevator_list[1].elevator_floor = 6              # set elevator 2 floor
    column.elevator_list[1].elevator_direction = "UP"       # set elevator 2 direction

    called_elevator = column.RequestElevator(3, "DOWN")     # User call on floor with direction
    column.RequestFloor(called_elevator, 2)                 # User call inside elevator
    called_elevator = column.RequestElevator(10, "DOWN")    # User call on floor with direction
    column.RequestFloor(called_elevator, 3)                 # User call inside elevator

    print("##### Scenario 3 Ended ! #####")

def scenariorandom():
    numberbuildingfloors = random.randint(5, 10)                            #To have between 5 and 10 floors
    numberofelevators = random.randint(2, 5)                                #To have between 2 and 5 elevators
    numberofcalls = random.randint(2, 5)                                    #To have between 2 and 5 calls
    elevatorlistofdirections = ["DOWN", "IDLE", "UP"]                       #Array of elevator directions on creation

    column = Column(numberbuildingfloors, numberofelevators)                #Creates the new Column

    print("##### Scenario Random Started ! #####")                          #Console log the start and list the random number for the program
    print(">>> Scenario with :", numberbuildingfloors, "floors, ", numberofelevators, "elevators and", numberofcalls, "calls <<<")
    time.sleep(2)
    for i in range(numberofelevators):                                      #Change elevators floors and direction created in program and console.log data
        column.elevator_list[i].elevator_floor = random.randint(1, numberbuildingfloors)
        column.elevator_list[i].elevator_direction = elevatorlistofdirections[random.randint(0, 2)]
        if (column.elevator_list[i].elevator_direction == "IDLE"):
            print(f">>> Elevator", column.elevator_list[i].elevator_letter, "is on floor", 
            column.elevator_list[i].elevator_floor, "on", column.elevator_list[i].elevator_direction, "<<<")
        else:
            print(f">>> Elevator", column.elevator_list[i].elevator_letter, "is on floor", 
            column.elevator_list[i].elevator_floor, "in", column.elevator_list[i].elevator_direction, "direction <<<")
    time.sleep(2)
    for i in range(numberofcalls):                                          #Creates different call from users
        startfloor = random.randint(1, numberbuildingfloors)
        wantedfloor = random.randint(1, numberbuildingfloors)
        wanteddirection = "IDLE"
        while wantedfloor == startfloor:                                   #To be sure that a user doesn't call a floor he's already on
            wantedfloor = random.randint(1, numberbuildingfloors)
        if (startfloor > wantedfloor):
            wanteddirection = "DOWN"
        else:
            wanteddirection = "UP"
        called_elevator = column.RequestElevator(startfloor, wanteddirection)     #User call on floor with direction
        column.RequestFloor(called_elevator, wantedfloor)                             #User call inside elevator

    print("##### Scenario Random Ended ! #####")

def scenarioinput():

    print("Welcome to my JavaScript application !")
    print("Please choose your scenario from list :")
    print("1- Scenario 1")
    print("2- Scenario 2")
    print("3- Scenario 3")
    print("4- Scenario Random")

    doc = input("Please enter your choice (1,2,3,4) :")
    if doc == "1":
        scenario1()
    elif doc == "2":
        scenario2()
    elif doc == "3":
        scenario3()
    elif doc == "4":
        scenariorandom()
    else:
        print("Your input is invalid ! Bye !")

######## SCENARIOS ########

### UNCOMMENT, RUN and RELAX watching CONSOLE :) ###

#scenario1()
#scenario2()
#scenario3()
#scenariorandom()
scenarioinput()

#### HAVE A NICE DAY ! ####
