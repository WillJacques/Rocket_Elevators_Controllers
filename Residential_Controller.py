# SCENARIO CHOICES ARE AT THE END OF THE PROGRAM, YOU ONLY HAVE TO UNCOMMENT THE WANTED ONE ! THANK YOU !

import time

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
        if Direction == "UP":
            resultArray = []
            scoreArray = []
            b_elevator = None
            bestElevator = None
            for i in range(len(self.elevator_list)):
                elevator_i = self.elevator_list[i]
                if (elevator_i.elevator_direction == "UP") and (elevator_i.elevator_floor < FloorNumber):
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
        else:
            resultArray = []
            scoreArray = []
            b_elevator = None
            bestElevator = None
            for i in range(len(self.elevator_list)):
                elevator_i = self.elevator_list[i]
                if (elevator_i.elevator_direction == "DOWN") and (elevator_i.elevator_floor > FloorNumber):
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
        self.elevator_letter = chr(97 + elevator_no)
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
                print(f"---Elevator " +
                      self.elevator_letter.capitalize(), self.status, "---")
                self.elevator_direction = "DOWN"
                self.Move_down(RequestedFloor)
                self.status = "stopped"
                print(f"---Elevator " +
                      self.elevator_letter.capitalize(), self.status, "---")
                self.Open_door()
                self.floor_list.pop()
            elif RequestedFloor > self.elevator_floor:
                self.status = "moving"
                print(f"---Elevator " +
                      self.elevator_letter.capitalize(), self.status, "---")
                self.elevator_direction = "UP"
                self.Move_up(RequestedFloor)
                self.status = "stopped"
                print(f"---Elevator " +
                      self.elevator_letter.capitalize(), self.status, "---")
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


def test_elevator1():
    column = Column(10, 2)

    print("##### Scenario 1 Started ! #####")
    
    column.elevator_list[0].elevator_floor = 2              # set elevator 1 floor
    column.elevator_list[1].elevator_floor = 6              # set elevator 2 floor

    called_elevator = column.RequestElevator(3, "UP")       # User call on floor with direction
    column.RequestFloor(called_elevator, 7)                 # User call inside elevator

    print("##### Scenario 1 Ended ! #####")


def test_elevator2():
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

def test_elevator3():
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


######## SCENARIOS ########

### UNCOMMENT, RUN and RELAX watching CONSOLE :) ###

#test_elevator1()
#test_elevator2()
#test_elevator3()

#### HAVE A NICE DAY ! ####
