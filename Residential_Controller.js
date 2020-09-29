function test_elevator1() {
    var controller = init_elevator_system(10, 2);

    console.log("##### Scenario 1 Started ! #####");
  
    controller.column.elevator_list[0].elevator_floor = 2;          // set elevator 1 floor
    controller.column.elevator_list[1].elevator_floor = 6;          // set elevator 2 floor

    var elevator = controller.RequestElevator(3, "UP");             // User call on floor with direction
    controller.RequestFloor(elevator, 7);                           // User call inside eleva
    
    console.log("##### Scenario 1 Ended ! #####");
}

function test_elevator2() {
    var controller = init_elevator_system(10, 2);

    console.log("##### Scenario 2 Started ! #####");

    controller.column.elevator_list[0].elevator_floor = 10;         // set elevator 1 floor
    controller.column.elevator_list[1].elevator_floor = 3;          // set elevator 2 floor

    var elevator = controller.RequestElevator(1, "UP");             // User call on floor with direction
    controller.RequestFloor(elevator, 6);                           // User call inside elevator
    elevator = controller.RequestElevator(3, "UP");                 // User call on floor with direction
    controller.RequestFloor(elevator, 5);                           // User call inside elevator
    elevator = controller.RequestElevator(9, "DOWN");               // User call on floor with direction
    controller.RequestFloor(elevator, 2);                           // User call inside elevator

    console.log("##### Scenario 2 ended ! #####");
}

function test_elevator3() {
    var controller = init_elevator_system(10, 2);

    console.log("##### Scenario 3 Started ! #####");
  
    controller.column.elevator_list[0].elevator_floor = 10;         // set elevator 1 floor
    controller.column.elevator_list[1].elevator_floor = 3;          // set elevator 2 floor
    
    controller.RequestFloor(controller.column.elevator_list[1], 6); // User call inside elevator
    var elevator = controller.RequestElevator(3, "DOWN");           // User call on floor with direction
    controller.RequestFloor(elevator, 2);                           // User call inside elevator
    elevator = controller.RequestElevator(10, "DOWN");              // User call on floor with direction
    controller.RequestFloor(elevator, 3);                           // User call inside elevator

    console.log("##### Scenario 3 ended ! #####")
}

// Init System

function init_elevator_system(nb_of_floor, nb_of_elevator) {
    var controller = new ColumnController(nb_of_floor, nb_of_elevator);
    return controller;
}

// Column Class definition

var Column = function(nb_of_floor, nb_of_elevator) {
    this.nb_of_floor = nb_of_floor;
    this.nb_of_elevator = nb_of_elevator;
    this.elevator_list = [];
    for (let i = 0; i < this.nb_of_elevator; i++) {
        let elevator = new Elevator(i, "IDLE", 1, "IDLE");
        this.elevator_list.push(elevator);
    };
};

// Elevator Class definition

var Elevator = function(elevator_no, status, elevator_floor, elevator_direction) {
    this.elevator_no = elevator_no;
    this.elevator_letter = (String.fromCharCode(97 + elevator_no));
    this.status = status;
    this.elevator_floor = elevator_floor;
    this.elevator_direction = elevator_direction;
    this.floor_list = [];
}

// Send Request then operate

Elevator.prototype.send_request = function(RequestedFloor) {
    this.floor_list.push(RequestedFloor);
    this.compute_list();
    this.operate_elevator(RequestedFloor);
}

// Sort list if the elevator is going "UP" or "DOWN"

Elevator.prototype.compute_list = function() {
    if (this.elevator_direction === "UP") {
    this.floor_list.sort(function(a, b){return a-b}); // NORMAL SORT
    } else if (this.elevator_direction === "DOWN") {
    this.floor_list.sort(function(a, b){return b-a}); // REVERSE SORT
    }
    return this.floor_list;
}

// System operation

Elevator.prototype.operate_elevator = function(RequestedFloor) {
    while (this.floor_list > 0) {
        if (RequestedFloor === this.elevator_floor) {
            this.Open_door();
            this.status = "moving";
            this.floor_list.shift();
        } else if (RequestedFloor < this.elevator_floor) {
            this.status = "moving";
            console.log("---Elevator " + this.elevator_letter.toUpperCase(), this.status,"---");
            this.Direction = "DOWN";
            this.Move_down(RequestedFloor);
            this.status = "stopped";
            console.log("---Elevator " + this.elevator_letter.toUpperCase(), this.status,"---");
            this.Open_door();
            this.floor_list.shift();
        } else if (RequestedFloor > this.elevator_floor) {
            sleep(1000);
            this.status = "moving";
            console.log("---Elevator " + this.elevator_letter.toUpperCase(), this.status,"---");
            this.Direction = "UP";
            this.Move_up(RequestedFloor);
            this.status = "stopped";
            console.log("---Elevator " + this.elevator_letter.toUpperCase(), this.status,"---");
            this.Open_door();
            this.floor_list.shift();
        }
    }
    if (this.floor_list === 0) {
        this.status = "IDLE";
    }
}
Elevator.prototype.Request_floor_button = function(RequestedFloor) {
    this.RequestedFloor = RequestedFloor;
    this.floor_light = floor_light;
}
Elevator.prototype.Call_floor_button = function(FloorNumber, Direction) {
    this.FloorNumber = FloorNumber;
    this.Direction = Direction;
}

// OPEN DOORS FUNCTION

Elevator.prototype.Open_door = function() {
    sleep(1000);
    console.log("Open Doors");
    console.log("---Opening Doors---");
    sleep(1000);
    console.log("*Button Light Off*");
    console.log("User enters/exits the elevator");
    sleep(1000);
    console.log("---Closing Doors---");
    sleep(1000);
    this.Close_door();
}

// CLOSE DOORS FUNCTION

Elevator.prototype.Close_door = function() {
        
    console.log("Closed Doors");
    sleep(1000);
}

// MOVE THE ELEVATOR UP FUNCTION

Elevator.prototype.Move_up = function(RequestedFloor) {
    console.log("Floor : " + this.elevator_floor);
    sleep(1000);
    while (this.elevator_floor !== RequestedFloor) {
        this.elevator_floor += 1;
        console.log("Floor : " + this.elevator_floor);
        sleep(1000);
    }
}

// MOVE THE ELEVATOR DOWN FUNCTION

Elevator.prototype.Move_down = function(RequestedFloor) {
    console.log("Floor : " + this.elevator_floor);
    sleep(1000);
    while (this.elevator_floor !== RequestedFloor) {
        this.elevator_floor -= 1;
        console.log("Floor : " + this.elevator_floor);
        sleep(1000);
    }
}

//  Creates a controller to find best elevator and manages requests

var ColumnController = function(nb_of_floor, nb_of_elevator) {
        this.nb_of_floor = nb_of_floor;
        this.nb_of_elevator = nb_of_elevator;
        this.column = new Column(nb_of_floor, nb_of_elevator);
}
  
//  Request elevator function with find best elevator

ColumnController.prototype.RequestElevator = function(FloorNumber, Direction) {
    sleep(1000);
    console.log(">>> User request an elevator at floor", FloorNumber, "to go", Direction, "<<<");
    sleep(1000);
    console.log("*Call Button Light On*");
    sleep(1000);

    let elevator = this.find_best_elevator(FloorNumber, Direction);
    elevator.send_request(FloorNumber);
    return elevator;
}

// Request floor inside elevator

ColumnController.prototype.RequestFloor = function(elevator, RequestedFloor) {
    sleep(1000);
    console.log(">>> User wants to go to floor", RequestedFloor,"<<<");
    sleep(1000);
    console.log("*Request Button Light On*");
    sleep(1000);
    elevator.send_request(RequestedFloor);
}

// Best elevator Function()

ColumnController.prototype.find_best_elevator = function(FloorNumber, Direction) {
    console.log("Searching for best elevator to go to floor", FloorNumber, "in", Direction, "direction.");
    if (FloorNumber === 10) {
        Direction = "UP"
    } else if (FloorNumber === 1) {
        Direction = "DOWN"
    }
    if (Direction === "UP"){
        var resultArray = [];
        var scoreArray = [];
        var b_elevator = null;
        var bestElevator = null;
        for (var i = 0; i < this.column.elevator_list.length; i++) {
            var elevator = this.column.elevator_list[i];
            if ((elevator.elevator_direction === "UP") && (elevator.elevator_floor < FloorNumber)) {
                resultArray.push(i);
                var score = Math.abs(elevator.elevator_floor-FloorNumber);
                scoreArray.push(score);
            };
        };
        if (scoreArray.length === 0) {
            for (var i = 0; i < this.column.elevator_list.length; i++) {
                var elevator = this.column.elevator_list[i];
                if (elevator.elevator_direction === "IDLE") {
                    resultArray.push(i);
                    var score = Math.abs(elevator.elevator_floor-FloorNumber);
                    scoreArray.push(score);
                };
            };
        };
        if (resultArray.length > 0) {
            var minimum = scoreArray[0];
            var location = 0
            for (var k = 1; k < scoreArray.length; k++) {
                if (scoreArray[k] < minimum) {
                    minimum = scoreArray[k]
                    location = k
                };
            };
            b_elevator = resultArray[location]
        };
        bestElevator = this.column.elevator_list[b_elevator];
        return bestElevator;
    } else {
        var resultArray = [];
        var scoreArray = [];
        var b_elevator = null;
        var bestElevator = null;
        for (var i = 0; i < this.column.elevator_list.length; i++) {
            var elevator = this.column.elevator_list[i];
            if ((elevator.elevator_direction === "DOWN") && (elevator.elevator_floor > FloorNumber)) {
                resultArray.push(i);
                var score = Math.abs(elevator.elevator_floor-FloorNumber);
                scoreArray.push(score);
            };
        };
        if (scoreArray.length === 0) {
            for (var i = 0; i < this.column.elevator_list.length; i++) {
                var elevator = this.column.elevator_list[i];
                if (elevator.elevator_direction === "IDLE") {
                    resultArray.push(i);
                    var score = Math.abs(elevator.elevator_floor-FloorNumber);
                    scoreArray.push(score);
                };
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
        bestElevator = this.column.elevator_list[b_elevator];
        return bestElevator;
    };
}

// Creates a sleep function() to put waiting times in program
  
function sleep(milliseconds) {
    var start = new Date().getTime();
    while ((new Date().getTime() - start) < milliseconds) {
    }
}