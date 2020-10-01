/*
To run JavaScript application, download in same folder :

1-Residential_Controller.html
2-Residential_Controller.js

Then open Residential_Controller.html
Press a scenario Button and look at Console.

---OR---

Uncomment wanted scenario at the end of program
*/


function scenario1() {
    var column = new Column(10, 2)

    console.log("##### Scenario 1 Started ! #####");

    column.elevator_list[0].elevator_floor = 2;                 // set elevator 1 floor
    column.elevator_list[1].elevator_floor = 6;                 // set elevator 2 floor

    var called_elevator = column.RequestElevator(3, "UP");      // User call on floor with direction
    column.RequestFloor(called_elevator, 7);                    // User call inside elevator

    console.log("##### Scenario 1 Ended ! #####");
}

function scenario2() {
    var column = new Column(10, 2)

    console.log("##### Scenario 2 Started ! #####");

    column.elevator_list[0].elevator_floor = 10;                // set elevator 1 floor
    column.elevator_list[1].elevator_floor = 3;                 // set elevator 2 floor

    var called_elevator = column.RequestElevator(1, "UP");      // User call on floor with direction
    column.RequestFloor(called_elevator, 6);                    // User call inside elevator
    called_elevator = column.RequestElevator(3, "UP");          // User call on floor with direction
    column.RequestFloor(called_elevator, 5);                    // User call inside elevator
    called_elevator = column.RequestElevator(9, "DOWN");        // User call on floor with direction
    column.RequestFloor(called_elevator, 2);                    // User call inside elevator

    console.log("##### Scenario 2 ended ! #####");
}

function scenario3() {
    var column = new Column(10, 2)

    console.log("##### Scenario 3 Started ! #####");

    column.elevator_list[0].elevator_floor = 10;                // set elevator 1 floor
    column.elevator_list[1].elevator_floor = 6;                 // set elevator 2 floor
    column.elevator_list[1].elevator_direction = "UP";          // set elevator 2 direction

    var called_elevator = column.RequestElevator(3, "DOWN");    // User call on floor with direction
    column.RequestFloor(called_elevator, 2);                    // User call inside elevator
    called_elevator = column.RequestElevator(10, "DOWN");       // User call on floor with direction
    column.RequestFloor(called_elevator, 3);                    // User call inside elevator

    console.log("##### Scenario 3 ended ! #####")
}

function scenariorandom() {
    var numberbuildingfloors = Math.ceil(Math.random()*5+5);  //to have between 5 and 10 floors
    var numberofelevators = Math.ceil(Math.random()*3+2);
    var numberofcalls = Math.ceil(Math.random()*3+2);
    console.log(numberofcalls)
    var column = new Column(numberbuildingfloors, numberofelevators)

    console.log("##### Scenario Random Started ! #####");
    console.log(">>> Scenario with :", numberbuildingfloors, "floors, ", numberofelevators, "elevators and", numberofcalls, "calls <<<");
    sleep(2000);
    for (var i = 0; i < numberofelevators; i++) {
        column.elevator_list[i].elevator_floor = Math.ceil(Math.random()*numberbuildingfloors)
        console.log(">>> Elevator", column.elevator_list[i].elevator_letter, "is on :", column.elevator_list[i].elevator_floor, "<<<");
    }
    sleep(2000)
    for (var i = 0; i < numberofcalls; i++) {
        var startfloor = Math.ceil(Math.random()*numberbuildingfloors)
        var wantedfloor = Math.ceil(Math.random()*numberbuildingfloors)
        var wanteddirection = "IDLE"
            while(wantedfloor === startfloor)
            wantedfloor = Math.ceil(Math.random()*numberbuildingfloors)
        if (startfloor > wantedfloor) {
            wanteddirection = "DOWN";
        } else {
            wanteddirection = "UP";
        }
        var called_elevator = column.RequestElevator(startfloor, wanteddirection);     // User call on floor with direction
        column.RequestFloor(called_elevator, wantedfloor);                                                            // User call inside elevator
    }

    console.log("##### Scenario Random Ended ! #####")
}

// Column Class definition

var Column = function (nb_of_floor, nb_of_elevator) {
    this.nb_of_floor = nb_of_floor;
    this.nb_of_elevator = nb_of_elevator;
    this.elevator_list = [];
    for (var i = 0; i < this.nb_of_elevator; i++) {
        var elevator = new Elevator(i, "IDLE", 1, "IDLE");
        this.elevator_list.push(elevator);
    };
};

//  Request elevator function with find best elevator

Column.prototype.RequestElevator = function (FloorNumber, Direction) {
    sleep(400);
    console.log(">>> User request an elevator at floor", FloorNumber, "to go", Direction, "<<<");
    sleep(400);
    console.log("*Call Button Light On*");
    sleep(400);

    var request_elevator = this.find_best_elevator(FloorNumber, Direction);
    request_elevator.send_request(FloorNumber);
    return request_elevator;
}

// Request floor inside elevator

Column.prototype.RequestFloor = function (elevator_object, RequestedFloor) {
    sleep(400);
    console.log(">>> User wants to go to floor", RequestedFloor, "<<<");
    sleep(400);
    console.log("*Request Button Light On*");
    sleep(400);
    elevator_object.send_request(RequestedFloor);
}

// Best elevator Function()

Column.prototype.find_best_elevator = function (FloorNumber, Direction) {
    console.log("Searching for best elevator to go to floor", FloorNumber, "in", Direction, "direction.");
    if (FloorNumber === 10) {
        Direction = "UP"
    } else if (FloorNumber === 1) {
        Direction = "DOWN"
    }
    if (Direction === "UP") {
        var resultArray = [];
        var scoreArray = [];
        var b_elevator = null;
        var bestElevator = null;
        for (var i = 0; i < this.elevator_list.length; i++) {
            var elevator_i = this.elevator_list[i];
            if ((elevator_i.elevator_direction === "UP") && (elevator_i.elevator_floor < FloorNumber)) {
                resultArray.push(i);
                var score = Math.abs(elevator_i.elevator_floor - FloorNumber);
                scoreArray.push(score);
            };
        };
        if (scoreArray.length === 0) {
            for (var i = 0; i < this.elevator_list.length; i++) {
                var elevator_i = this.elevator_list[i];
                if (elevator_i.elevator_direction === "IDLE") {
                    resultArray.push(i);
                    var score = Math.abs(elevator_i.elevator_floor - FloorNumber);
                    scoreArray.push(score);
                };
            };
        };
        if (scoreArray.length === 0) {
            for (var i = 0; i < this.elevator_list.length; i++) {
                var elevator_i = this.elevator_list[i];
                resultArray.push(i);
                var score = Math.abs(elevator_i.elevator_floor - FloorNumber);
                scoreArray.push(score);
            };
        };
        if (resultArray.length > 0) {
            var minimum = scoreArray[0];
            var location = 0
            for (var i = 1; i < scoreArray.length; i++) {
                if (scoreArray[i] < minimum) {
                    minimum = scoreArray[i]
                    location = i
                };
            };
            b_elevator = resultArray[location]
        };
        bestElevator = this.elevator_list[b_elevator];
        return bestElevator;
    } else {
        var resultArray = [];
        var scoreArray = [];
        var b_elevator = null;
        var bestElevator = null;
        for (var i = 0; i < this.elevator_list.length; i++) {
            var elevator_i = this.elevator_list[i];
            if ((elevator_i.elevator_direction === "DOWN") && (elevator_i.elevator_floor > FloorNumber)) {
                resultArray.push(i);
                var score = Math.abs(elevator_i.elevator_floor - FloorNumber);
                scoreArray.push(score);
            };
        };
        if (scoreArray.length === 0) {
            for (var i = 0; i < this.elevator_list.length; i++) {
                var elevator_i = this.elevator_list[i];
                if (elevator_i.elevator_direction === "IDLE") {
                    resultArray.push(i);
                    var score = Math.abs(elevator_i.elevator_floor - FloorNumber);
                    scoreArray.push(score);
                };
            };
        };
        if (scoreArray.length === 0) {
            for (var i = 0; i < this.elevator_list.length; i++) {
                var elevator_i = this.elevator_list[i];
                resultArray.push(i);
                var score = Math.abs(elevator_i.elevator_floor - FloorNumber);
                scoreArray.push(score);
            };
        };
        //Algorithm to decide which of the elevators is nearest from the call
        //If my scorearray as multiple value like {2,3,1,6},
        //My result array list the id when it sends a score {1,3,4,5}
        //After algorithm look for minimum value in score array and save position
        //After algorithm send the ID from the result array position
        //QUICK SORT PRINCIPLE
        if (resultArray.length > 0) {
            var minimum = scoreArray[0];
            var location = 0
            for (var i = 1; i < scoreArray.length; i++) {
                if (scoreArray[i] < minimum) {
                    minimum = scoreArray[i]
                    location = i
                };
            };
            b_elevator = resultArray[location]
        };
        bestElevator = this.elevator_list[b_elevator];
        return bestElevator;
    };
}

// Elevator Class definition

var Elevator = function (elevator_no, status, elevator_floor, elevator_direction) {
    this.elevator_no = elevator_no;
    this.elevator_letter = (String.fromCharCode(97 + elevator_no)).toUpperCase();
    this.status = status;
    this.elevator_floor = elevator_floor;
    this.elevator_direction = elevator_direction;
    this.floor_list = [];
}

// Send Request then operate

Elevator.prototype.send_request = function (RequestedFloor) {
    this.floor_list.push(RequestedFloor);
    this.compute_list();
    this.operate_elevator(RequestedFloor);
}

// Sort list if the elevator is going "UP" or "DOWN"

Elevator.prototype.compute_list = function () {
    if (this.elevator_direction === "UP") {
        this.floor_list.sort(function (a, b) { return a - b }); // NORMAL SORT
    } else if (this.elevator_direction === "DOWN") {
        this.floor_list.sort(function (a, b) { return b - a }); // REVERSE SORT
    }
    return this.floor_list;
}

// System operation

Elevator.prototype.operate_elevator = function (RequestedFloor) {
    while (this.floor_list.length > 0) {
        if (RequestedFloor === this.elevator_floor) {
            this.Open_door();
            this.status = "moving";
            this.floor_list.shift();
        } else if (RequestedFloor < this.elevator_floor) {
            this.status = "moving";
            console.log("---Elevator " + this.elevator_letter, this.status, "---");
            this.elevator_direction = "DOWN";
            this.Move_down(RequestedFloor);
            this.status = "stopped";
            console.log("---Elevator " + this.elevator_letter, this.status, "---");
            this.Open_door();
            this.floor_list.shift();
        } else if (RequestedFloor > this.elevator_floor) {
            this.status = "moving";
            console.log("---Elevator " + this.elevator_letter, this.status, "---");
            this.elevator_direction = "UP";
            this.Move_up(RequestedFloor);
            this.status = "stopped";
            console.log("---Elevator " + this.elevator_letter, this.status, "---");
            this.Open_door();
            this.floor_list.shift();
        }
    }
    if (this.floor_list.length === 0) {
        this.elevator_direction = "IDLE";
    }
}

// OPEN DOORS FUNCTION

Elevator.prototype.Open_door = function () {
    sleep(400);
    console.log("Open Doors");
    console.log("---Opening Doors---");
    sleep(400);
    console.log("*Button Light Off*");
    console.log("User enters/exits the elevator");
    sleep(400);
    console.log("---Closing Doors---");
    sleep(400);
    this.Close_door();
}

// CLOSE DOORS FUNCTION

Elevator.prototype.Close_door = function () {

    console.log("Closed Doors");
    sleep(400);
}

// MOVE THE ELEVATOR UP FUNCTION

Elevator.prototype.Move_up = function (RequestedFloor) {
    console.log("Floor : " + this.elevator_floor);
    sleep(400);
    while (this.elevator_floor !== RequestedFloor) {
        this.elevator_floor += 1;
        console.log("Floor : " + this.elevator_floor);
        sleep(400);
    }
}

// MOVE THE ELEVATOR DOWN FUNCTION

Elevator.prototype.Move_down = function (RequestedFloor) {
    console.log("Floor : " + this.elevator_floor);
    sleep(400);
    while (this.elevator_floor !== RequestedFloor) {
        this.elevator_floor -= 1;
        console.log("Floor : " + this.elevator_floor);
        sleep(400);
    }
}

// Creates a sleep function() to put waiting times in program

function sleep(milliseconds) {
    var start = new Date().getTime();
    while ((new Date().getTime() - start) < milliseconds) {
    }
}

//######## SCENARIOS ########

//### UNCOMMENT, RUN and RELAX watching CONSOLE :) ###

//scenario1()
//scenario2()
//scenario3()
scenariorandom()

//#### HAVE A NICE DAY ! ####