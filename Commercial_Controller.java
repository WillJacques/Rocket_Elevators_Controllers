import java.util.ArrayList;
import java.util.Collections;
import java.util.concurrent.TimeUnit;

public class Commercial_Controller {

    public static class Battery {
        int battery_no;
        ArrayList<Column> column_list;

        Battery(int battery_no) {
            this.battery_no = battery_no;
            column_list = new ArrayList<>();
            Column column1 = new Column('A', -6, 0, 5);
            column_list.add(column1);
            Column column2 = new Column('B', 0, 19, 5);
            column_list.add(column2);
            Column column3 = new Column('C', 20, 39, 5);
            column_list.add(column3);
            Column column4 = new Column('D', 40, 59, 5);
            column_list.add(column4);
        }

        public static void Scenario1() {
            Battery Battery = new Battery(1);

            Battery.column_list.get(1).elevator_list.get(0).elevator_floor = 19;
            Battery.column_list.get(1).elevator_list.get(0).elevator_direction = "DOWN";
            Battery.column_list.get(1).elevator_list.get(0).status = "MOVING";
            Battery.column_list.get(1).elevator_list.get(0).floor_list.add(4);

            Battery.column_list.get(1).elevator_list.get(1).elevator_floor = 2;
            Battery.column_list.get(1).elevator_list.get(1).elevator_direction = "UP";
            Battery.column_list.get(1).elevator_list.get(1).status = "MOVING";
            Battery.column_list.get(1).elevator_list.get(1).floor_list.add(14);

            Battery.column_list.get(1).elevator_list.get(2).elevator_floor = 12;
            Battery.column_list.get(1).elevator_list.get(2).elevator_direction = "DOWN";
            Battery.column_list.get(1).elevator_list.get(2).status = "MOVING";
            Battery.column_list.get(1).elevator_list.get(2).floor_list.add(0);

            Battery.column_list.get(1).elevator_list.get(3).elevator_floor = 14;
            Battery.column_list.get(1).elevator_list.get(3).elevator_direction = "DOWN";
            Battery.column_list.get(1).elevator_list.get(3).status = "MOVING";
            Battery.column_list.get(1).elevator_list.get(3).floor_list.add(1);

            Battery.column_list.get(1).elevator_list.get(4).elevator_floor = 5;
            Battery.column_list.get(1).elevator_list.get(4).elevator_direction = "DOWN";
            Battery.column_list.get(1).elevator_list.get(4).status = "MOVING";
            Battery.column_list.get(1).elevator_list.get(4).floor_list.add(0);
            System.out.println("##################");
            System.out.println("Scenario 1 Started");
            System.out.println("##################");
            System.out.println("Elevator B" + Battery.column_list.get(1).elevator_list.get(0).elevator_no
                    + " is on floor " + Battery.column_list.get(1).elevator_list.get(0).elevator_floor + " going "
                    + Battery.column_list.get(1).elevator_list.get(0).elevator_direction);
            System.out.println("Elevator B" + Battery.column_list.get(1).elevator_list.get(1).elevator_no
                    + " is on floor " + Battery.column_list.get(1).elevator_list.get(1).elevator_floor + " going "
                    + Battery.column_list.get(1).elevator_list.get(1).elevator_direction);
            System.out.println("Elevator B" + Battery.column_list.get(1).elevator_list.get(2).elevator_no
                    + " is on floor " + Battery.column_list.get(1).elevator_list.get(2).elevator_floor + " going "
                    + Battery.column_list.get(1).elevator_list.get(2).elevator_direction);
            System.out.println("Elevator B" + Battery.column_list.get(1).elevator_list.get(3).elevator_no
                    + " is on floor " + Battery.column_list.get(1).elevator_list.get(3).elevator_floor + " going "
                    + Battery.column_list.get(1).elevator_list.get(3).elevator_direction);
            System.out.println("Elevator B" + Battery.column_list.get(1).elevator_list.get(4).elevator_no
                    + " is on floor " + Battery.column_list.get(1).elevator_list.get(4).elevator_floor + " going "
                    + Battery.column_list.get(1).elevator_list.get(4).elevator_direction);
            System.out.println("##################");
            var reqElevator = Battery.column_list.get(1).RequestElevator(0, "UP", 'B'); // User call on floor with direction
            Battery.column_list.get(1).RequestFloor(reqElevator, 19, 'B'); // User call inside elevator
            for (int i = 0; i < Battery.column_list.get(1).elevator_list.size(); i++) {
                Battery.column_list.get(1).elevator_list.get(i).operOtherElevator('B');
            }
            System.out.println("##################");
            System.out.println("Elevator B" + Battery.column_list.get(1).elevator_list.get(0).elevator_no
                    + " is on floor " + Battery.column_list.get(1).elevator_list.get(0).elevator_floor + " is on "
                    + Battery.column_list.get(1).elevator_list.get(0).elevator_direction);
            System.out.println("Elevator B" + Battery.column_list.get(1).elevator_list.get(1).elevator_no
                    + " is on floor " + Battery.column_list.get(1).elevator_list.get(1).elevator_floor + " is on "
                    + Battery.column_list.get(1).elevator_list.get(1).elevator_direction);
            System.out.println("Elevator B" + Battery.column_list.get(1).elevator_list.get(2).elevator_no
                    + " is on floor " + Battery.column_list.get(1).elevator_list.get(2).elevator_floor + " is on "
                    + Battery.column_list.get(1).elevator_list.get(2).elevator_direction);
            System.out.println("Elevator B" + Battery.column_list.get(1).elevator_list.get(3).elevator_no
                    + " is on floor " + Battery.column_list.get(1).elevator_list.get(3).elevator_floor + " is on "
                    + Battery.column_list.get(1).elevator_list.get(3).elevator_direction);
            System.out.println("Elevator B" + Battery.column_list.get(1).elevator_list.get(4).elevator_no
                    + " is on floor " + Battery.column_list.get(1).elevator_list.get(4).elevator_floor + " is on "
                    + Battery.column_list.get(1).elevator_list.get(4).elevator_direction);
            System.out.println("##################");
            System.out.println("Scenario 1 Ended");
            System.out.println("##################");
        }

        public static void Scenario2() {
            Battery Battery = new Battery(1);

            Battery.column_list.get(2).elevator_list.get(0).elevator_floor = 0;
            Battery.column_list.get(2).elevator_list.get(0).elevator_direction = "UP";
            Battery.column_list.get(2).elevator_list.get(0).status = "MOVING";
            Battery.column_list.get(2).elevator_list.get(0).floor_list.add(20);

            Battery.column_list.get(2).elevator_list.get(1).elevator_floor = 22;
            Battery.column_list.get(2).elevator_list.get(1).elevator_direction = "UP";
            Battery.column_list.get(2).elevator_list.get(1).status = "MOVING";
            Battery.column_list.get(2).elevator_list.get(1).floor_list.add(27);

            Battery.column_list.get(2).elevator_list.get(2).elevator_floor = 32;
            Battery.column_list.get(2).elevator_list.get(2).elevator_direction = "DOWN";
            Battery.column_list.get(2).elevator_list.get(2).status = "MOVING";
            Battery.column_list.get(2).elevator_list.get(2).floor_list.add(0);

            Battery.column_list.get(2).elevator_list.get(3).elevator_floor = 39;
            Battery.column_list.get(2).elevator_list.get(3).elevator_direction = "DOWN";
            Battery.column_list.get(2).elevator_list.get(3).status = "MOVING";
            Battery.column_list.get(2).elevator_list.get(3).floor_list.add(23);

            Battery.column_list.get(2).elevator_list.get(4).elevator_floor = 38;
            Battery.column_list.get(2).elevator_list.get(4).elevator_direction = "DOWN";
            Battery.column_list.get(2).elevator_list.get(4).status = "MOVING";
            Battery.column_list.get(2).elevator_list.get(4).floor_list.add(0);
            System.out.println("##################");
            System.out.println("Scenario 2 Started");
            System.out.println("##################");
            System.out.println("Elevator C" + Battery.column_list.get(2).elevator_list.get(0).elevator_no
                    + " is on floor " + Battery.column_list.get(2).elevator_list.get(0).elevator_floor + " going "
                    + Battery.column_list.get(2).elevator_list.get(0).elevator_direction);
            System.out.println("Elevator C" + Battery.column_list.get(2).elevator_list.get(1).elevator_no
                    + " is on floor " + Battery.column_list.get(2).elevator_list.get(1).elevator_floor + " going "
                    + Battery.column_list.get(2).elevator_list.get(1).elevator_direction);
            System.out.println("Elevator C" + Battery.column_list.get(2).elevator_list.get(2).elevator_no
                    + " is on floor " + Battery.column_list.get(2).elevator_list.get(2).elevator_floor + " going "
                    + Battery.column_list.get(2).elevator_list.get(2).elevator_direction);
            System.out.println("Elevator C" + Battery.column_list.get(2).elevator_list.get(3).elevator_no
                    + " is on floor " + Battery.column_list.get(2).elevator_list.get(3).elevator_floor + " going "
                    + Battery.column_list.get(2).elevator_list.get(3).elevator_direction);
            System.out.println("Elevator C" + Battery.column_list.get(2).elevator_list.get(4).elevator_no
                    + " is on floor " + Battery.column_list.get(2).elevator_list.get(4).elevator_floor + " going "
                    + Battery.column_list.get(2).elevator_list.get(4).elevator_direction);
            System.out.println("##################");
            var reqElevator = Battery.column_list.get(2).RequestElevator(0, "UP", 'C'); // User call on floor with direction
            Battery.column_list.get(2).RequestFloor(reqElevator, 35, 'C'); // User call inside elevator
            for (int i = 0; i < Battery.column_list.get(2).elevator_list.size(); i++) {
                Battery.column_list.get(2).elevator_list.get(i).operOtherElevator('C');
            }
            System.out.println("##################");
            System.out.println("Elevator C" + Battery.column_list.get(2).elevator_list.get(0).elevator_no
                    + " is on floor " + Battery.column_list.get(2).elevator_list.get(0).elevator_floor + " is on "
                    + Battery.column_list.get(2).elevator_list.get(0).elevator_direction);
            System.out.println("Elevator C" + Battery.column_list.get(2).elevator_list.get(1).elevator_no
                    + " is on floor " + Battery.column_list.get(2).elevator_list.get(1).elevator_floor + " is on "
                    + Battery.column_list.get(2).elevator_list.get(1).elevator_direction);
            System.out.println("Elevator C" + Battery.column_list.get(2).elevator_list.get(2).elevator_no
                    + " is on floor " + Battery.column_list.get(2).elevator_list.get(2).elevator_floor + " is on "
                    + Battery.column_list.get(2).elevator_list.get(2).elevator_direction);
            System.out.println("Elevator C" + Battery.column_list.get(2).elevator_list.get(3).elevator_no
                    + " is on floor " + Battery.column_list.get(2).elevator_list.get(3).elevator_floor + " is on "
                    + Battery.column_list.get(2).elevator_list.get(3).elevator_direction);
            System.out.println("Elevator C" + Battery.column_list.get(2).elevator_list.get(4).elevator_no
                    + " is on floor " + Battery.column_list.get(2).elevator_list.get(4).elevator_floor + " is on "
                    + Battery.column_list.get(2).elevator_list.get(4).elevator_direction);
            System.out.println("##################");
            System.out.println("Scenario 2 Ended");
            System.out.println("##################");
        }

        public static void Scenario3() {
            Battery Battery = new Battery(1);

            Battery.column_list.get(3).elevator_list.get(0).elevator_floor = 57;
            Battery.column_list.get(3).elevator_list.get(0).elevator_direction = "DOWN";
            Battery.column_list.get(3).elevator_list.get(0).status = "MOVING";
            Battery.column_list.get(3).elevator_list.get(0).floor_list.add(0);

            Battery.column_list.get(3).elevator_list.get(1).elevator_floor = 49;
            Battery.column_list.get(3).elevator_list.get(1).elevator_direction = "UP";
            Battery.column_list.get(3).elevator_list.get(1).status = "MOVING";
            Battery.column_list.get(3).elevator_list.get(1).floor_list.add(59);

            Battery.column_list.get(3).elevator_list.get(2).elevator_floor = 45;
            Battery.column_list.get(3).elevator_list.get(2).elevator_direction = "UP";
            Battery.column_list.get(2).elevator_list.get(2).status = "MOVING";
            Battery.column_list.get(3).elevator_list.get(2).floor_list.add(57);

            Battery.column_list.get(3).elevator_list.get(3).elevator_floor = 0;
            Battery.column_list.get(3).elevator_list.get(3).elevator_direction = "UP";
            Battery.column_list.get(3).elevator_list.get(3).status = "MOVING";
            Battery.column_list.get(3).elevator_list.get(3).floor_list.add(53);

            Battery.column_list.get(3).elevator_list.get(4).elevator_floor = 59;
            Battery.column_list.get(3).elevator_list.get(4).elevator_direction = "DOWN";
            Battery.column_list.get(3).elevator_list.get(4).status = "MOVING";
            Battery.column_list.get(3).elevator_list.get(4).floor_list.add(0);
            System.out.println("##################");
            System.out.println("Scenario 3 Started");
            System.out.println("##################");
            System.out.println("Elevator D" + Battery.column_list.get(3).elevator_list.get(0).elevator_no
                    + " is on floor " + Battery.column_list.get(3).elevator_list.get(0).elevator_floor + " going "
                    + Battery.column_list.get(3).elevator_list.get(0).elevator_direction);
            System.out.println("Elevator D" + Battery.column_list.get(3).elevator_list.get(1).elevator_no
                    + " is on floor " + Battery.column_list.get(3).elevator_list.get(1).elevator_floor + " going "
                    + Battery.column_list.get(3).elevator_list.get(1).elevator_direction);
            System.out.println("Elevator D" + Battery.column_list.get(3).elevator_list.get(2).elevator_no
                    + " is on floor " + Battery.column_list.get(3).elevator_list.get(2).elevator_floor + " going "
                    + Battery.column_list.get(3).elevator_list.get(2).elevator_direction);
            System.out.println("Elevator D" + Battery.column_list.get(3).elevator_list.get(3).elevator_no
                    + " is on floor " + Battery.column_list.get(3).elevator_list.get(3).elevator_floor + " going "
                    + Battery.column_list.get(3).elevator_list.get(3).elevator_direction);
            System.out.println("Elevator D" + Battery.column_list.get(3).elevator_list.get(4).elevator_no
                    + " is on floor " + Battery.column_list.get(3).elevator_list.get(4).elevator_floor + " going "
                    + Battery.column_list.get(3).elevator_list.get(4).elevator_direction);
            System.out.println("##################");
            var reqElevator = Battery.column_list.get(3).RequestElevator(53, "DOWN", 'D'); // User call on floor with
                                                                                           // direction
            Battery.column_list.get(3).RequestFloor(reqElevator, 0, 'D'); // User call inside elevator
            for (int i = 0; i < Battery.column_list.get(3).elevator_list.size(); i++) {
                Battery.column_list.get(3).elevator_list.get(i).operOtherElevator('D');
            }
            System.out.println("##################");
            System.out.println("Elevator D" + Battery.column_list.get(3).elevator_list.get(0).elevator_no
                    + " is on floor " + Battery.column_list.get(3).elevator_list.get(0).elevator_floor + " is on "
                    + Battery.column_list.get(3).elevator_list.get(0).elevator_direction);
            System.out.println("Elevator D" + Battery.column_list.get(3).elevator_list.get(1).elevator_no
                    + " is on floor " + Battery.column_list.get(3).elevator_list.get(1).elevator_floor + " is on "
                    + Battery.column_list.get(3).elevator_list.get(1).elevator_direction);
            System.out.println("Elevator D" + Battery.column_list.get(3).elevator_list.get(2).elevator_no
                    + " is on floor " + Battery.column_list.get(3).elevator_list.get(2).elevator_floor + " is on "
                    + Battery.column_list.get(3).elevator_list.get(2).elevator_direction);
            System.out.println("Elevator D" + Battery.column_list.get(3).elevator_list.get(3).elevator_no
                    + " is on floor " + Battery.column_list.get(3).elevator_list.get(3).elevator_floor + " is on "
                    + Battery.column_list.get(3).elevator_list.get(3).elevator_direction);
            System.out.println("Elevator D" + Battery.column_list.get(3).elevator_list.get(4).elevator_no
                    + " is on floor " + Battery.column_list.get(3).elevator_list.get(4).elevator_floor + " is on "
                    + Battery.column_list.get(3).elevator_list.get(4).elevator_direction);
            System.out.println("##################");
            System.out.println("Scenario 3 Ended");
            System.out.println("##################");
        }

        public static void Scenario4() {
            Battery Battery = new Battery(1);

            Battery.column_list.get(0).elevator_list.get(0).elevator_floor = -4;
            Battery.column_list.get(0).elevator_list.get(0).elevator_direction = "IDLE";
            Battery.column_list.get(0).elevator_list.get(0).status = "IDLE";

            Battery.column_list.get(0).elevator_list.get(1).elevator_floor = 0;
            Battery.column_list.get(0).elevator_list.get(1).elevator_direction = "IDLE";
            Battery.column_list.get(0).elevator_list.get(1).status = "IDLE";

            Battery.column_list.get(0).elevator_list.get(2).elevator_floor = -3;
            Battery.column_list.get(0).elevator_list.get(2).elevator_direction = "DOWN";
            Battery.column_list.get(0).elevator_list.get(2).status = "MOVING";
            Battery.column_list.get(0).elevator_list.get(2).floor_list.add(-5);

            Battery.column_list.get(0).elevator_list.get(3).elevator_floor = -6;
            Battery.column_list.get(0).elevator_list.get(3).elevator_direction = "UP";
            Battery.column_list.get(0).elevator_list.get(3).status = "MOVING";
            Battery.column_list.get(0).elevator_list.get(3).floor_list.add(0);

            Battery.column_list.get(0).elevator_list.get(4).elevator_floor = -1;
            Battery.column_list.get(0).elevator_list.get(4).elevator_direction = "DOWN";
            Battery.column_list.get(0).elevator_list.get(4).status = "MOVING";
            Battery.column_list.get(0).elevator_list.get(4).floor_list.add(-6);
            System.out.println("##################");
            System.out.println("Scenario 4 Started");
            System.out.println("##################");
            System.out.println("Elevator A" + Battery.column_list.get(0).elevator_list.get(0).elevator_no
                    + " is on floor " + Battery.column_list.get(0).elevator_list.get(0).elevator_floor + " going "
                    + Battery.column_list.get(0).elevator_list.get(0).elevator_direction);
            System.out.println("Elevator A" + Battery.column_list.get(0).elevator_list.get(1).elevator_no
                    + " is on floor " + Battery.column_list.get(0).elevator_list.get(1).elevator_floor + " going "
                    + Battery.column_list.get(0).elevator_list.get(1).elevator_direction);
            System.out.println("Elevator A" + Battery.column_list.get(0).elevator_list.get(2).elevator_no
                    + " is on floor " + Battery.column_list.get(0).elevator_list.get(2).elevator_floor + " going "
                    + Battery.column_list.get(0).elevator_list.get(2).elevator_direction);
            System.out.println("Elevator A" + Battery.column_list.get(0).elevator_list.get(3).elevator_no
                    + " is on floor " + Battery.column_list.get(0).elevator_list.get(3).elevator_floor + " going "
                    + Battery.column_list.get(0).elevator_list.get(3).elevator_direction);
            System.out.println("Elevator A" + Battery.column_list.get(0).elevator_list.get(4).elevator_no
                    + " is on floor " + Battery.column_list.get(0).elevator_list.get(4).elevator_floor + " going "
                    + Battery.column_list.get(0).elevator_list.get(4).elevator_direction);
            System.out.println("##################");
            var reqElevator = Battery.column_list.get(0).RequestElevator(-3, "UP", 'A'); // User call on floor with
                                                                                         // direction
            Battery.column_list.get(0).RequestFloor(reqElevator, 0, 'A'); // User call inside elevator
            for (int i = 0; i < Battery.column_list.get(0).elevator_list.size(); i++) {
                Battery.column_list.get(0).elevator_list.get(i).operOtherElevator('A');
            }
            System.out.println("##################");
            System.out.println("Elevator A" + Battery.column_list.get(0).elevator_list.get(0).elevator_no
                    + " is on floor " + Battery.column_list.get(0).elevator_list.get(0).elevator_floor + " is on "
                    + Battery.column_list.get(0).elevator_list.get(0).elevator_direction);
            System.out.println("Elevator A" + Battery.column_list.get(0).elevator_list.get(1).elevator_no
                    + " is on floor " + Battery.column_list.get(0).elevator_list.get(1).elevator_floor + " is on "
                    + Battery.column_list.get(0).elevator_list.get(1).elevator_direction);
            System.out.println("Elevator A" + Battery.column_list.get(0).elevator_list.get(2).elevator_no
                    + " is on floor " + Battery.column_list.get(0).elevator_list.get(2).elevator_floor + " is on "
                    + Battery.column_list.get(0).elevator_list.get(2).elevator_direction);
            System.out.println("Elevator A" + Battery.column_list.get(0).elevator_list.get(3).elevator_no
                    + " is on floor " + Battery.column_list.get(0).elevator_list.get(3).elevator_floor + " is on "
                    + Battery.column_list.get(0).elevator_list.get(3).elevator_direction);
            System.out.println("Elevator A" + Battery.column_list.get(0).elevator_list.get(4).elevator_no
                    + " is on floor " + Battery.column_list.get(0).elevator_list.get(4).elevator_floor + " is on "
                    + Battery.column_list.get(0).elevator_list.get(4).elevator_direction);
            System.out.println("##################");
            System.out.println("Scenario 4 Ended");
            System.out.println("##################");
        }
    }

    public static class Column {
        int column_char;
        int nbElevators;
        int lowFloor;
        int highFloor;
        ArrayList<Elevator> elevator_list;

        Column(char column_char, int lowFloor, int highFloor, int nbElevators) {
            this.column_char = column_char;
            this.lowFloor = lowFloor;
            this.highFloor = highFloor;
            this.nbElevators = nbElevators;
            elevator_list = new ArrayList<Elevator>();
            for (int i = 1; i <= this.nbElevators; i++) {
                Elevator elevator = new Elevator(i, "IDLE", 1, "IDLE");
                elevator_list.add(elevator);
            }
        }

        public Elevator RequestElevator(int FloorNumber, String Direction, char column_char) {
            try {TimeUnit.SECONDS.sleep(1);} catch (InterruptedException e) {e.printStackTrace();}
            System.out.println("####################################");
            System.out.println(">>> User request an elevator at floor " + FloorNumber + " to go " + Direction + " <<<");
            try {TimeUnit.SECONDS.sleep(1);} catch (InterruptedException e) {e.printStackTrace();}
            System.out.println("*Call Button Light On*");

            Elevator request_elevator = this.find_Best_Elevator(FloorNumber, Direction);
            request_elevator.send_1request(FloorNumber, column_char);
            return request_elevator;
        }

        public void RequestFloor(Elevator request_elevator, int RequestedFloor, char column_char) {
            try {TimeUnit.SECONDS.sleep(1);} catch (InterruptedException e) {e.printStackTrace();}
            System.out.println("Requested floor : " + RequestedFloor);
            try {TimeUnit.SECONDS.sleep(1);} catch (InterruptedException e) {e.printStackTrace();}
            System.out.println("Call Button Light On");
            try {TimeUnit.SECONDS.sleep(1);} catch (InterruptedException e) {e.printStackTrace();}
            request_elevator.send_2request(RequestedFloor, column_char);
        }

        public Elevator find_Best_Elevator(int FloorNumber, String Direction) {
            System.out.println(
                    "Searching for best elevator to go to floor " + FloorNumber + " in " + Direction + " direction.");
            if (FloorNumber == this.lowFloor) {
                Direction = "DOWN";
            } else if (FloorNumber == 0) {
                Direction = "DOWN";
            } else if (FloorNumber == this.highFloor)
                Direction = "UP";
            ArrayList<Integer> resultArray = new ArrayList<Integer>();
            ArrayList<Integer> scoreArray = new ArrayList<Integer>();
            int b_elevator;
            Elevator bestelevator;
            if (Direction == "UP") {
                for (int i = 0; i < this.elevator_list.size(); i++) {
                    Elevator elevator_i = this.elevator_list.get(i);
                    if (((elevator_i.elevator_direction == "UP") && (elevator_i.elevator_floor <= FloorNumber))
                            || (elevator_i.elevator_floor == FloorNumber && FloorNumber == 0)) {
                        resultArray.add(i);
                        int score = Math.abs(elevator_i.elevator_floor - FloorNumber);
                        scoreArray.add(score);
                    }
                }
                if (scoreArray.size() == 0) {
                    for (int i = 0; i < this.elevator_list.size(); i++) {
                        Elevator elevator_i = this.elevator_list.get(i);
                        if (elevator_i.elevator_direction == "IDLE") {
                            resultArray.add(i);
                            int score = Math.abs(elevator_i.elevator_floor - FloorNumber);
                            scoreArray.add(score);
                        }
                    }
                }
                if (scoreArray.size() == 0) {
                    for (int i = 0; i < this.elevator_list.size(); i++) {
                        Elevator elevator_i = this.elevator_list.get(i);
                        resultArray.add(i);
                        int score = Math.abs(elevator_i.elevator_floor - FloorNumber);
                        scoreArray.add(score);

                    }
                }
                int minimum = scoreArray.get(0);
                int location = 0;
                for (int i = 1; i < scoreArray.size(); i++) {
                    if (scoreArray.get(i) < minimum) {
                        minimum = scoreArray.get(i);
                        location = i;
                    }
                }
                b_elevator = resultArray.get(location);
            } else {
                for (int i = 0; i < this.elevator_list.size(); i++) {
                    Elevator elevator_i = this.elevator_list.get(i);
                    if (((elevator_i.elevator_direction == "DOWN") && (elevator_i.elevator_floor >= FloorNumber))
                            || (elevator_i.elevator_floor == FloorNumber)) {
                        resultArray.add(i);
                        int score = Math.abs(elevator_i.elevator_floor - FloorNumber);
                        scoreArray.add(score);
                    }
                }
                if (scoreArray.size() == 0) {
                    for (int i = 0; i < this.elevator_list.size(); i++) {
                        Elevator elevator_i = this.elevator_list.get(i);
                        if (elevator_i.elevator_direction == "IDLE") {
                            resultArray.add(i);
                            int score = Math.abs(elevator_i.elevator_floor - FloorNumber);
                            scoreArray.add(score);
                        }
                    }
                }
                if (scoreArray.size() == 0) {
                    for (int i = 0; i < this.elevator_list.size(); i++) {
                        Elevator elevator_i = this.elevator_list.get(i);
                        resultArray.add(i);
                        int score = Math.abs(elevator_i.elevator_floor - FloorNumber);
                        scoreArray.add(score);

                    }
                }
                int minimum = scoreArray.get(0);
                int location = 0;
                for (int i = 1; i < scoreArray.size(); i++) {
                    if (scoreArray.get(i) < minimum) {
                        minimum = scoreArray.get(i);
                        location = i;
                    }
                }
                b_elevator = resultArray.get(location);
            }
            bestelevator = this.elevator_list.get(b_elevator);
            return bestelevator;
        }
    }

    public static class Elevator {
        int elevator_no;
        String status;
        int elevator_floor;
        String elevator_direction;
        ArrayList<Integer> floor_list;

        public Elevator(int elevator_no, String status, int elevator_floor, String elevator_direction) {
            this.elevator_no = elevator_no;
            this.status = status;
            this.elevator_floor = elevator_floor;
            this.elevator_direction = elevator_direction;
            this.floor_list = new ArrayList<Integer>(); // queue list filled by requested floor
        }

        public void send_1request(int RequestedFloor, char column_char) {
            floor_list.add(RequestedFloor);
            if (RequestedFloor >= elevator_floor) {
                Collections.sort(floor_list);
            } else if (RequestedFloor < elevator_floor) {
                Collections.sort(floor_list, Collections.reverseOrder());
            }
            int floorlistpop = floor_list.get(0);
            floor_list.remove(0);
            Operate_elevator(floorlistpop, column_char);
        }

        public void send_2request(int RequestedFloor, char column_char) {
            floor_list.add(RequestedFloor);
            for (int i = 0; i < this.floor_list.size(); i++) {
                for (int j = 0; j < this.floor_list.size(); j++) {
                    if (floor_list.get(i) == floor_list.get(j) && i != j)
                        floor_list.remove(j);
                }
            }
            while (floor_list.size() > 0) {
                if (RequestedFloor >= elevator_floor) {
                    Collections.sort(floor_list);
                } else if (RequestedFloor < elevator_floor) {
                    Collections.sort(floor_list, Collections.reverseOrder());
                }
                int floorlistpop = floor_list.get(0);
                floor_list.remove(0);
                Operate_elevator(floorlistpop, column_char);
            }
            this.elevator_direction = "IDLE";
        }

        public void operOtherElevator(char column_char) {
            while (floor_list.size() > 0) {
                if (floor_list.get(0) >= elevator_floor) {
                    Collections.sort(floor_list);
                } else if (floor_list.get(0) < elevator_floor) {
                    Collections.sort(floor_list, Collections.reverseOrder());
                }
                int floorlistpop = floor_list.get(0);
                floor_list.remove(0);
                Operate_elevator(floorlistpop, column_char);
            }
            this.elevator_direction = "IDLE";
        }

        public void Operate_elevator(int RequestedFloor, char column_char) {
            if (RequestedFloor == elevator_floor) {
                opendoor();
                this.status = "MOVING";
            } else if (RequestedFloor < this.elevator_floor) {
                try {TimeUnit.SECONDS.sleep(1);} catch (InterruptedException e) {e.printStackTrace();}
                status = "MOVING";
                System.out.println("*Button Light Off*");
                System.out.println("--- Column : " + column_char + " // Elevator : " + this.elevator_no + " " + status + " ---");
                this.elevator_direction = "DOWN";
                Move_down(RequestedFloor, column_char);
                this.status = "STOPPED";
                System.out.println("--- Column : " + column_char + " // Elevator : " + this.elevator_no + " " + status + " ---");
                this.opendoor();
            }
            else if (RequestedFloor > this.elevator_floor)
            {
                try {TimeUnit.SECONDS.sleep(1);} catch (InterruptedException e) {e.printStackTrace();}
                this.status = "MOVING";
                System.out.println("*Button Light Off*");
                System.out.println("--- Column : " + column_char + " // Elevator : " + this.elevator_no + " " + status + " ---");
                this.elevator_direction = "UP";
                this.Move_up(RequestedFloor, column_char);
                this.status = "STOPPED";
                System.out.println("--- Column : " + column_char + " // Elevator : " + this.elevator_no + " " + status + " ---");
                this.opendoor();
            }

        }
        public void opendoor()
        {
            try {TimeUnit.SECONDS.sleep(1);} catch (InterruptedException e) {e.printStackTrace();}
            System.out.println("Open Doors");
            System.out.println("---Opening Doors---");
            try {TimeUnit.SECONDS.sleep(1);} catch (InterruptedException e) {e.printStackTrace();}
            System.out.println("*Button Light Off*");
            System.out.println("User enters/exits the elevator");
            try {TimeUnit.SECONDS.sleep(1);} catch (InterruptedException e) {e.printStackTrace();}
            System.out.println("---Closing Doors---");
            try {TimeUnit.SECONDS.sleep(1);} catch (InterruptedException e) {e.printStackTrace();}
            System.out.println("Closed Doors");
            try {TimeUnit.SECONDS.sleep(1);} catch (InterruptedException e) {e.printStackTrace();}
        }
        public void Move_up(int RequestedFloor, char column_char)
        {
            System.out.println("Column : " + column_char + " // Elevator : #" + elevator_no + "  Current Floor : " + this.elevator_floor);
            try {TimeUnit.SECONDS.sleep(1);} catch (InterruptedException e) {e.printStackTrace();}
            while (this.elevator_floor != RequestedFloor)
            {
                this.elevator_floor += 1;
                System.out.println("Column : " + column_char + " // Elevator : #" + elevator_no + "  Floor : " + this.elevator_floor);
                try {TimeUnit.SECONDS.sleep(1);} catch (InterruptedException e) {e.printStackTrace();}
            }

        }
        public void Move_down(int RequestedFloor, char column_char)
        {
            System.out.println("Column : " + column_char + " // Elevator : #" + elevator_no + "  Current Floor : " + this.elevator_floor);
            try {TimeUnit.SECONDS.sleep(1);} catch (InterruptedException e) {e.printStackTrace();}
            while (this.elevator_floor != RequestedFloor)
            {
                this.elevator_floor -= 1;
                System.out.println("Column : " + column_char + " // Elevator : #" + elevator_no + "  Floor : " + this.elevator_floor);
                try {TimeUnit.SECONDS.sleep(1);} catch (InterruptedException e) {e.printStackTrace();}
            }

        }
    }

    public static void main(String[] args) {
        //Battery.Scenario1();
        //Battery.Scenario2();
        //Battery.Scenario3();
        //Battery.Scenario4();
    }
}
