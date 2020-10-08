using System;
using System.Collections.Generic;
using System.Threading;

namespace Commercial_Controller
{
    class Program
    {
        public class Battery
        {
            public int battery_no;
            public List<Column> column_list;
            public Battery(int battery_no)
            {
                this.battery_no = battery_no;
                column_list = new List<Column>();
                Column column1 = new Column('A', -6, 0, 5);
                column_list.Add(column1);
                Column column2 = new Column('B', 0, 19, 5);
                column_list.Add(column2);
                Column column3 = new Column('C', 20, 39, 5);    
                column_list.Add(column3);
                Column column4 = new Column('D', 40, 59, 5);                
                column_list.Add(column4);
            }
            public static void Scenario1()
            {
                Battery Battery = new Battery(1);

                Battery.column_list[1].elevator_list[0].elevator_floor = 19;
                Battery.column_list[1].elevator_list[0].elevator_direction = "DOWN";
                Battery.column_list[1].elevator_list[0].status = "MOVING";
                Battery.column_list[1].elevator_list[0].floor_list.Add(4);

                Battery.column_list[1].elevator_list[1].elevator_floor = 2;
                Battery.column_list[1].elevator_list[1].elevator_direction = "UP";
                Battery.column_list[1].elevator_list[1].status = "MOVING";
                Battery.column_list[1].elevator_list[1].floor_list.Add(14);

                Battery.column_list[1].elevator_list[2].elevator_floor = 12;
                Battery.column_list[1].elevator_list[2].elevator_direction = "DOWN";
                Battery.column_list[1].elevator_list[2].status = "MOVING";
                Battery.column_list[1].elevator_list[2].floor_list.Add(0);

                Battery.column_list[1].elevator_list[3].elevator_floor = 14;
                Battery.column_list[1].elevator_list[3].elevator_direction = "DOWN";
                Battery.column_list[1].elevator_list[3].status = "MOVING";
                Battery.column_list[1].elevator_list[3].floor_list.Add(1);

                Battery.column_list[1].elevator_list[4].elevator_floor = 5;
                Battery.column_list[1].elevator_list[4].elevator_direction = "DOWN";
                Battery.column_list[1].elevator_list[4].status = "MOVING";
                Battery.column_list[1].elevator_list[4].floor_list.Add(0);
                Console.WriteLine("##################");
                Console.WriteLine("Scenario 1 Started");
                Console.WriteLine("##################");
                Console.WriteLine("Elevator B" + Battery.column_list[1].elevator_list[0].elevator_no + " is on floor " + Battery.column_list[1].elevator_list[0].elevator_floor + " going " + Battery.column_list[1].elevator_list[0].elevator_direction);
                Console.WriteLine("Elevator B" + Battery.column_list[1].elevator_list[1].elevator_no + " is on floor " + Battery.column_list[1].elevator_list[1].elevator_floor + " going " + Battery.column_list[1].elevator_list[1].elevator_direction); 
                Console.WriteLine("Elevator B" + Battery.column_list[1].elevator_list[2].elevator_no + " is on floor " + Battery.column_list[1].elevator_list[2].elevator_floor + " going " + Battery.column_list[1].elevator_list[2].elevator_direction); 
                Console.WriteLine("Elevator B" + Battery.column_list[1].elevator_list[3].elevator_no + " is on floor " + Battery.column_list[1].elevator_list[3].elevator_floor + " going " + Battery.column_list[1].elevator_list[3].elevator_direction); 
                Console.WriteLine("Elevator B" + Battery.column_list[1].elevator_list[4].elevator_no + " is on floor " + Battery.column_list[1].elevator_list[4].elevator_floor + " going " + Battery.column_list[1].elevator_list[4].elevator_direction);
                Console.WriteLine("##################");
                var reqElevator = Battery.column_list[1].RequestElevator(0, "UP", 'B');         // User call on floor with direction
                Battery.column_list[1].RequestFloor(reqElevator, 19, 'B');                      // User call inside elevator
                for (int i = 0 ; i < Battery.column_list[1].elevator_list.Count; i++ )
                {
                    Battery.column_list[1].elevator_list[i].operOtherElevator('B');
                }
                Console.WriteLine("##################");
                Console.WriteLine("Elevator B" + Battery.column_list[1].elevator_list[0].elevator_no + " is on floor " + Battery.column_list[1].elevator_list[0].elevator_floor + " is on " + Battery.column_list[1].elevator_list[0].elevator_direction);
                Console.WriteLine("Elevator B" + Battery.column_list[1].elevator_list[1].elevator_no + " is on floor " + Battery.column_list[1].elevator_list[1].elevator_floor + " is on " + Battery.column_list[1].elevator_list[1].elevator_direction); 
                Console.WriteLine("Elevator B" + Battery.column_list[1].elevator_list[2].elevator_no + " is on floor " + Battery.column_list[1].elevator_list[2].elevator_floor + " is on " + Battery.column_list[1].elevator_list[2].elevator_direction); 
                Console.WriteLine("Elevator B" + Battery.column_list[1].elevator_list[3].elevator_no + " is on floor " + Battery.column_list[1].elevator_list[3].elevator_floor + " is on " + Battery.column_list[1].elevator_list[3].elevator_direction); 
                Console.WriteLine("Elevator B" + Battery.column_list[1].elevator_list[4].elevator_no + " is on floor " + Battery.column_list[1].elevator_list[4].elevator_floor + " is on " + Battery.column_list[1].elevator_list[4].elevator_direction);
                Console.WriteLine("##################");
                Console.WriteLine("Scenario 1 Ended");
                Console.WriteLine("##################");
            }
            public static void Scenario2()
            {
                Battery Battery = new Battery(1);

                Battery.column_list[2].elevator_list[0].elevator_floor = 0;
                Battery.column_list[2].elevator_list[0].elevator_direction = "UP";
                Battery.column_list[2].elevator_list[0].status = "MOVING";
                Battery.column_list[2].elevator_list[0].floor_list.Add(20);

                Battery.column_list[2].elevator_list[1].elevator_floor = 22;
                Battery.column_list[2].elevator_list[1].elevator_direction = "UP";
                Battery.column_list[2].elevator_list[1].status = "MOVING";
                Battery.column_list[2].elevator_list[1].floor_list.Add(27);

                Battery.column_list[2].elevator_list[2].elevator_floor = 32;
                Battery.column_list[2].elevator_list[2].elevator_direction = "DOWN";
                Battery.column_list[2].elevator_list[2].status = "MOVING";
                Battery.column_list[2].elevator_list[2].floor_list.Add(0);

                Battery.column_list[2].elevator_list[3].elevator_floor = 39;
                Battery.column_list[2].elevator_list[3].elevator_direction = "DOWN";
                Battery.column_list[2].elevator_list[3].status = "MOVING";
                Battery.column_list[2].elevator_list[3].floor_list.Add(23);

                Battery.column_list[2].elevator_list[4].elevator_floor = 38;
                Battery.column_list[2].elevator_list[4].elevator_direction = "DOWN";
                Battery.column_list[2].elevator_list[4].status = "MOVING";
                Battery.column_list[2].elevator_list[4].floor_list.Add(0);
                Console.WriteLine("##################");
                Console.WriteLine("Scenario 2 Started");
                Console.WriteLine("##################");
                Console.WriteLine("Elevator C" + Battery.column_list[2].elevator_list[0].elevator_no + " is on floor " + Battery.column_list[2].elevator_list[0].elevator_floor + " going " + Battery.column_list[2].elevator_list[0].elevator_direction);
                Console.WriteLine("Elevator C" + Battery.column_list[2].elevator_list[1].elevator_no + " is on floor " + Battery.column_list[2].elevator_list[1].elevator_floor + " going " + Battery.column_list[2].elevator_list[1].elevator_direction); 
                Console.WriteLine("Elevator C" + Battery.column_list[2].elevator_list[2].elevator_no + " is on floor " + Battery.column_list[2].elevator_list[2].elevator_floor + " going " + Battery.column_list[2].elevator_list[2].elevator_direction); 
                Console.WriteLine("Elevator C" + Battery.column_list[2].elevator_list[3].elevator_no + " is on floor " + Battery.column_list[2].elevator_list[3].elevator_floor + " going " + Battery.column_list[2].elevator_list[3].elevator_direction); 
                Console.WriteLine("Elevator C" + Battery.column_list[2].elevator_list[4].elevator_no + " is on floor " + Battery.column_list[2].elevator_list[4].elevator_floor + " going " + Battery.column_list[2].elevator_list[4].elevator_direction);
                Console.WriteLine("##################");
                var reqElevator = Battery.column_list[2].RequestElevator(0, "UP", 'C');         // User call on floor with direction
                Battery.column_list[2].RequestFloor(reqElevator, 35, 'C');                      // User call inside elevator
                for (int i = 0 ; i < Battery.column_list[2].elevator_list.Count; i++ )
                {
                    Battery.column_list[2].elevator_list[i].operOtherElevator('C');
                }
                Console.WriteLine("##################");
                Console.WriteLine("Elevator C" + Battery.column_list[2].elevator_list[0].elevator_no + " is on floor " + Battery.column_list[2].elevator_list[0].elevator_floor + " is on " + Battery.column_list[2].elevator_list[0].elevator_direction);
                Console.WriteLine("Elevator C" + Battery.column_list[2].elevator_list[1].elevator_no + " is on floor " + Battery.column_list[2].elevator_list[1].elevator_floor + " is on " + Battery.column_list[2].elevator_list[1].elevator_direction); 
                Console.WriteLine("Elevator C" + Battery.column_list[2].elevator_list[2].elevator_no + " is on floor " + Battery.column_list[2].elevator_list[2].elevator_floor + " is on " + Battery.column_list[2].elevator_list[2].elevator_direction); 
                Console.WriteLine("Elevator C" + Battery.column_list[2].elevator_list[3].elevator_no + " is on floor " + Battery.column_list[2].elevator_list[3].elevator_floor + " is on " + Battery.column_list[2].elevator_list[3].elevator_direction); 
                Console.WriteLine("Elevator C" + Battery.column_list[2].elevator_list[4].elevator_no + " is on floor " + Battery.column_list[2].elevator_list[4].elevator_floor + " is on " + Battery.column_list[2].elevator_list[4].elevator_direction);
                Console.WriteLine("##################");
                Console.WriteLine("Scenario 2 Ended");
                Console.WriteLine("##################");
            }
            public static void Scenario3()
            {
                Battery Battery = new Battery(1);

                Battery.column_list[3].elevator_list[0].elevator_floor = 57;
                Battery.column_list[3].elevator_list[0].elevator_direction = "DOWN";
                Battery.column_list[3].elevator_list[0].status = "MOVING";
                Battery.column_list[3].elevator_list[0].floor_list.Add(0);

                Battery.column_list[3].elevator_list[1].elevator_floor = 49;
                Battery.column_list[3].elevator_list[1].elevator_direction = "UP";
                Battery.column_list[3].elevator_list[1].status = "MOVING";
                Battery.column_list[3].elevator_list[1].floor_list.Add(59);

                Battery.column_list[3].elevator_list[2].elevator_floor = 45;
                Battery.column_list[3].elevator_list[2].elevator_direction = "UP";
                Battery.column_list[2].elevator_list[2].status = "MOVING";
                Battery.column_list[3].elevator_list[2].floor_list.Add(57);

                Battery.column_list[3].elevator_list[3].elevator_floor = 0;
                Battery.column_list[3].elevator_list[3].elevator_direction = "UP";
                Battery.column_list[3].elevator_list[3].status = "MOVING";
                Battery.column_list[3].elevator_list[3].floor_list.Add(53);

                Battery.column_list[3].elevator_list[4].elevator_floor = 59;
                Battery.column_list[3].elevator_list[4].elevator_direction = "DOWN";
                Battery.column_list[3].elevator_list[4].status = "MOVING";
                Battery.column_list[3].elevator_list[4].floor_list.Add(0);
                Console.WriteLine("##################");
                Console.WriteLine("Scenario 3 Started");
                Console.WriteLine("##################");
                Console.WriteLine("Elevator D" + Battery.column_list[3].elevator_list[0].elevator_no + " is on floor " + Battery.column_list[3].elevator_list[0].elevator_floor + " going " + Battery.column_list[3].elevator_list[0].elevator_direction);
                Console.WriteLine("Elevator D" + Battery.column_list[3].elevator_list[1].elevator_no + " is on floor " + Battery.column_list[3].elevator_list[1].elevator_floor + " going " + Battery.column_list[3].elevator_list[1].elevator_direction); 
                Console.WriteLine("Elevator D" + Battery.column_list[3].elevator_list[2].elevator_no + " is on floor " + Battery.column_list[3].elevator_list[2].elevator_floor + " going " + Battery.column_list[3].elevator_list[2].elevator_direction); 
                Console.WriteLine("Elevator D" + Battery.column_list[3].elevator_list[3].elevator_no + " is on floor " + Battery.column_list[3].elevator_list[3].elevator_floor + " going " + Battery.column_list[3].elevator_list[3].elevator_direction); 
                Console.WriteLine("Elevator D" + Battery.column_list[3].elevator_list[4].elevator_no + " is on floor " + Battery.column_list[3].elevator_list[4].elevator_floor + " going " + Battery.column_list[3].elevator_list[4].elevator_direction);
                Console.WriteLine("##################");
                var reqElevator = Battery.column_list[3].RequestElevator(53, "DOWN", 'D');         // User call on floor with direction
                Battery.column_list[3].RequestFloor(reqElevator, 0, 'D');                      // User call inside elevator
                for (int i = 0 ; i < Battery.column_list[3].elevator_list.Count; i++ )
                {
                    Battery.column_list[3].elevator_list[i].operOtherElevator('D');
                }
                Console.WriteLine("##################");
                Console.WriteLine("Elevator D" + Battery.column_list[3].elevator_list[0].elevator_no + " is on floor " + Battery.column_list[3].elevator_list[0].elevator_floor + " is on " + Battery.column_list[3].elevator_list[0].elevator_direction);
                Console.WriteLine("Elevator D" + Battery.column_list[3].elevator_list[1].elevator_no + " is on floor " + Battery.column_list[3].elevator_list[1].elevator_floor + " is on " + Battery.column_list[3].elevator_list[1].elevator_direction); 
                Console.WriteLine("Elevator D" + Battery.column_list[3].elevator_list[2].elevator_no + " is on floor " + Battery.column_list[3].elevator_list[2].elevator_floor + " is on " + Battery.column_list[3].elevator_list[2].elevator_direction); 
                Console.WriteLine("Elevator D" + Battery.column_list[3].elevator_list[3].elevator_no + " is on floor " + Battery.column_list[3].elevator_list[3].elevator_floor + " is on " + Battery.column_list[3].elevator_list[3].elevator_direction); 
                Console.WriteLine("Elevator D" + Battery.column_list[3].elevator_list[4].elevator_no + " is on floor " + Battery.column_list[3].elevator_list[4].elevator_floor + " is on " + Battery.column_list[3].elevator_list[4].elevator_direction);
                Console.WriteLine("##################");
                Console.WriteLine("Scenario 3 Ended");
                Console.WriteLine("##################");
            }
            public static void Scenario4()
            {
                Battery Battery = new Battery(1);

                Battery.column_list[0].elevator_list[0].elevator_floor = -4;
                Battery.column_list[0].elevator_list[0].elevator_direction = "IDLE";
                Battery.column_list[0].elevator_list[0].status = "IDLE";

                Battery.column_list[0].elevator_list[1].elevator_floor = 0;
                Battery.column_list[0].elevator_list[1].elevator_direction = "IDLE";
                Battery.column_list[0].elevator_list[1].status = "IDLE";

                Battery.column_list[0].elevator_list[2].elevator_floor = -3;
                Battery.column_list[0].elevator_list[2].elevator_direction = "DOWN";
                Battery.column_list[0].elevator_list[2].status = "MOVING";
                Battery.column_list[0].elevator_list[2].floor_list.Add(-5);

                Battery.column_list[0].elevator_list[3].elevator_floor = -6;
                Battery.column_list[0].elevator_list[3].elevator_direction = "UP";
                Battery.column_list[0].elevator_list[3].status = "MOVING";
                Battery.column_list[0].elevator_list[3].floor_list.Add(0);

                Battery.column_list[0].elevator_list[4].elevator_floor = -1;
                Battery.column_list[0].elevator_list[4].elevator_direction = "DOWN";
                Battery.column_list[0].elevator_list[4].status = "MOVING";
                Battery.column_list[0].elevator_list[4].floor_list.Add(-6);
                Console.WriteLine("##################");
                Console.WriteLine("Scenario 4 Started");
                Console.WriteLine("##################");
                Console.WriteLine("Elevator A" + Battery.column_list[0].elevator_list[0].elevator_no + " is on floor " + Battery.column_list[0].elevator_list[0].elevator_floor + " going " + Battery.column_list[0].elevator_list[0].elevator_direction);
                Console.WriteLine("Elevator A" + Battery.column_list[0].elevator_list[1].elevator_no + " is on floor " + Battery.column_list[0].elevator_list[1].elevator_floor + " going " + Battery.column_list[0].elevator_list[1].elevator_direction); 
                Console.WriteLine("Elevator A" + Battery.column_list[0].elevator_list[2].elevator_no + " is on floor " + Battery.column_list[0].elevator_list[2].elevator_floor + " going " + Battery.column_list[0].elevator_list[2].elevator_direction); 
                Console.WriteLine("Elevator A" + Battery.column_list[0].elevator_list[3].elevator_no + " is on floor " + Battery.column_list[0].elevator_list[3].elevator_floor + " going " + Battery.column_list[0].elevator_list[3].elevator_direction); 
                Console.WriteLine("Elevator A" + Battery.column_list[0].elevator_list[4].elevator_no + " is on floor " + Battery.column_list[0].elevator_list[4].elevator_floor + " going " + Battery.column_list[0].elevator_list[4].elevator_direction);
                Console.WriteLine("##################");
                var reqElevator = Battery.column_list[0].RequestElevator(-3, "UP", 'A');         // User call on floor with direction
                Battery.column_list[0].RequestFloor(reqElevator, 0, 'A');                      // User call inside elevator
                for (int i = 0 ; i < Battery.column_list[0].elevator_list.Count; i++ )
                {
                    Battery.column_list[0].elevator_list[i].operOtherElevator('A');
                }
                Console.WriteLine("##################");
                Console.WriteLine("Elevator A" + Battery.column_list[0].elevator_list[0].elevator_no + " is on floor " + Battery.column_list[0].elevator_list[0].elevator_floor + " is on " + Battery.column_list[0].elevator_list[0].elevator_direction);
                Console.WriteLine("Elevator A" + Battery.column_list[0].elevator_list[1].elevator_no + " is on floor " + Battery.column_list[0].elevator_list[1].elevator_floor + " is on " + Battery.column_list[0].elevator_list[1].elevator_direction); 
                Console.WriteLine("Elevator A" + Battery.column_list[0].elevator_list[2].elevator_no + " is on floor " + Battery.column_list[0].elevator_list[2].elevator_floor + " is on " + Battery.column_list[0].elevator_list[2].elevator_direction); 
                Console.WriteLine("Elevator A" + Battery.column_list[0].elevator_list[3].elevator_no + " is on floor " + Battery.column_list[0].elevator_list[3].elevator_floor + " is on " + Battery.column_list[0].elevator_list[3].elevator_direction); 
                Console.WriteLine("Elevator A" + Battery.column_list[0].elevator_list[4].elevator_no + " is on floor " + Battery.column_list[0].elevator_list[4].elevator_floor + " is on " + Battery.column_list[0].elevator_list[4].elevator_direction);
                Console.WriteLine("##################");
                Console.WriteLine("Scenario 4 Ended");
                Console.WriteLine("##################");
            }
        }
        public class Column
        {
            public int column_char;
            public int nbElevators;
            public int lowFloor;
            public int highFloor;
            public List<Elevator> elevator_list;
            public Column(char column_char, int lowFloor, int highFloor, int nbElevators)
            {
                this.column_char = column_char;
                this.lowFloor = lowFloor;
                this.highFloor = highFloor;
                this.nbElevators = nbElevators;
                elevator_list = new List<Elevator>();
                for (int i = 1; i <= this.nbElevators; i++)
                {
                    Elevator elevator = new Elevator(i, "IDLE", 1, "IDLE");
                    elevator_list.Add(elevator);
                }
            }
            
            public Elevator RequestElevator(int FloorNumber, string Direction, char column_char)
            {
                Thread.Sleep(500);
                Console.WriteLine("####################################");
                Console.WriteLine(">>> User request an elevator at floor " + FloorNumber + " to go " + Direction + " <<<");
                Thread.Sleep(500);
                Console.WriteLine("*Call Button Light On*");

                Elevator request_elevator = this.find_Best_Elevator(FloorNumber, Direction);
                request_elevator.send_1request(FloorNumber, column_char);
                return request_elevator;
            }
            public void RequestFloor (Elevator request_elevator, int RequestedFloor, char column_char)
            {
                Thread.Sleep(200);
                Console.WriteLine("Requested floor : " + RequestedFloor);
                Thread.Sleep(200);
                Console.WriteLine("Call Button Light On");
                Thread.Sleep(200);
                request_elevator.send_2request(RequestedFloor, column_char);
            }
            public Elevator find_Best_Elevator(int FloorNumber, string Direction)
            {
                Console.WriteLine("Searching for best elevator to go to floor " + FloorNumber + " in " + Direction + " direction.");
                if (FloorNumber == this.lowFloor)
                {
                    Direction = "DOWN";
                } else if (FloorNumber == 0)
                {
                    Direction = "DOWN";
                } else if (FloorNumber == this.highFloor)
                    Direction = "UP";
                List<int> resultArray = new List<int>();
                List<int> scoreArray = new List<int>();
                int b_elevator;
                Elevator bestelevator;
                if (Direction == "UP")
                {
                    for (int i = 0 ; i < this.elevator_list.Count; i++ )
                    {
                        Elevator elevator_i = this.elevator_list[i];
                        if (((elevator_i.elevator_direction == "UP") && (elevator_i.elevator_floor <= FloorNumber)) || (elevator_i.elevator_floor == FloorNumber && FloorNumber == 0))
                        {
                            resultArray.Add(i);
                            int score = Math.Abs(elevator_i.elevator_floor - FloorNumber);
                            scoreArray.Add(score);
                        }
                    }
                    if (scoreArray.Count == 0)
                    {
                        for (int i = 0 ; i < this.elevator_list.Count; i++ )
                        {
                            Elevator elevator_i = this.elevator_list[i];
                            if (elevator_i.elevator_direction == "IDLE")
                            {
                                resultArray.Add(i);
                                int score = Math.Abs(elevator_i.elevator_floor - FloorNumber);
                                scoreArray.Add(score);
                            }
                        }
                    }
                    if (scoreArray.Count == 0)
                    {
                        for (int i = 0 ; i < this.elevator_list.Count; i++ )
                        {
                            Elevator elevator_i = this.elevator_list[i];
                            resultArray.Add(i);
                            int score = Math.Abs(elevator_i.elevator_floor - FloorNumber);
                            scoreArray.Add(score);
                            
                        }
                    }
                    int minimum = scoreArray[0];
                    int location = 0;
                    for (int i = 1; i < scoreArray.Count; i++)
                    {
                        if (scoreArray[i] < minimum)
                        {
                            minimum = scoreArray[i];
                            location = i;
                        }
                    }
                    b_elevator = resultArray[location];
                } else {
                    for (int i = 0 ; i < this.elevator_list.Count; i++ )
                    {
                        Elevator elevator_i = this.elevator_list[i];
                        if (((elevator_i.elevator_direction == "DOWN") && (elevator_i.elevator_floor >= FloorNumber)) || (elevator_i.elevator_floor == FloorNumber))
                        {
                            resultArray.Add(i);
                            int score = Math.Abs(elevator_i.elevator_floor - FloorNumber);
                            scoreArray.Add(score);
                        }
                    }
                    if (scoreArray.Count == 0)
                    {
                        for (int i = 0 ; i < this.elevator_list.Count; i++ )
                        {
                            Elevator elevator_i = this.elevator_list[i];
                            if (elevator_i.elevator_direction == "IDLE")
                            {
                                resultArray.Add(i);
                                int score = Math.Abs(elevator_i.elevator_floor - FloorNumber);
                                scoreArray.Add(score);
                            }
                        }
                    }
                    if (scoreArray.Count == 0)
                    {
                        for (int i = 0 ; i < this.elevator_list.Count; i++ )
                        {
                            Elevator elevator_i = this.elevator_list[i];
                            resultArray.Add(i);
                            int score = Math.Abs(elevator_i.elevator_floor - FloorNumber);
                            scoreArray.Add(score);
                            
                        }
                    }
                    int minimum = scoreArray[0];
                    int location = 0;
                    for (int i = 1; i < scoreArray.Count; i++)
                    {
                        if (scoreArray[i] < minimum)
                        {
                            minimum = scoreArray[i];
                            location = i;
                        }
                    }
                    b_elevator = resultArray[location];
                }
                bestelevator = this.elevator_list[b_elevator];
                return bestelevator;
            }
        }
        public class Elevator
        {
            public int elevator_no;
            public string status;
            public int elevator_floor;
            public string elevator_direction;
            public List<int> floor_list;
            public Elevator(int elevator_no, string status, int elevator_floor, string elevator_direction)
            {
                this.elevator_no = elevator_no;
                this.status = status;
                this.elevator_floor = elevator_floor;
                this.elevator_direction = elevator_direction;
                this.floor_list = new List<int>();                  //queue list filled by requested floor
            }
            public void send_1request(int RequestedFloor, char column_char)
            {
                floor_list.Add(RequestedFloor);
                if (RequestedFloor >= elevator_floor)
                {
                    floor_list.Sort((a, b) => a.CompareTo(b));
                }
                else if (RequestedFloor < elevator_floor)
                {
                    floor_list.Sort((a, b) => -1 * a.CompareTo(b));
                }
                int floorlistpop = floor_list[0];
                floor_list.RemoveAt(0);
                Operate_elevator(floorlistpop, column_char);
            }
            public void send_2request(int RequestedFloor, char column_char)
            {
                floor_list.Add(RequestedFloor);
                for (int i = 0 ; i < this.floor_list.Count; i++ )
                {
                    for (int j = 0 ; j < this.floor_list.Count; j++ )
                    {
                        if (floor_list[i] == floor_list[j] && i != j)
                        floor_list.RemoveAt(j);
                    }
                }
                while (floor_list.Count > 0)
                {
                    if (RequestedFloor >= elevator_floor)
                    {
                        floor_list.Sort((a, b) => a.CompareTo(b));
                    }
                    else if (RequestedFloor < elevator_floor)
                    {
                        floor_list.Sort((a, b) => -1 * a.CompareTo(b));
                    }
                    int floorlistpop = floor_list[0];
                    floor_list.RemoveAt(0);
                    Operate_elevator(floorlistpop, column_char);
                }
                this.elevator_direction = "IDLE";
            }
            public void operOtherElevator (char column_char)
            {
                while (floor_list.Count > 0)
                {
                    if (floor_list[0] >= elevator_floor)
                    {
                        floor_list.Sort((a, b) => a.CompareTo(b));
                    }
                    else if (floor_list[0] < elevator_floor)
                    {
                        floor_list.Sort((a, b) => -1 * a.CompareTo(b));
                    }
                    int floorlistpop = floor_list[0];
                    floor_list.RemoveAt(0);
                    Operate_elevator(floorlistpop, column_char);
                }
                this.elevator_direction = "IDLE";
            }
            public void Operate_elevator(int RequestedFloor, char column_char)
            {
                if (RequestedFloor == elevator_floor)
                {
                    opendoor();
                    this.status = "MOVING";
                }
                else if (RequestedFloor < this.elevator_floor)
                {
                    Thread.Sleep(500);
                    status = "MOVING";
                    Console.WriteLine("*Button Light Off*");
                    Console.WriteLine("--- Column : " + column_char + " // Elevator : " + this.elevator_no + " " + status + " ---");
                    this.elevator_direction = "DOWN";
                    Move_down(RequestedFloor, column_char);
                    this.status = "STOPPED";
                    Console.WriteLine("--- Column : " + column_char + " // Elevator : " + this.elevator_no + " " + status + " ---");
                    this.opendoor();
                }
                else if (RequestedFloor > this.elevator_floor)
                {
                    Thread.Sleep(500);
                    this.status = "MOVING";
                    Console.WriteLine("*Button Light Off*");
                    Console.WriteLine("--- Column : " + column_char + " // Elevator : " + this.elevator_no + " " + status + " ---");
                    this.elevator_direction = "UP";
                    this.Move_up(RequestedFloor, column_char);
                    this.status = "STOPPED";
                    Console.WriteLine("--- Column : " + column_char + " // Elevator : " + this.elevator_no + " " + status + " ---");
                    this.opendoor();
                }

            }
            public void opendoor()
            {
                Thread.Sleep(500);
                Console.WriteLine("Open Doors");
                Console.WriteLine("---Opening Doors---");
                Thread.Sleep(500);
                Console.WriteLine("*Button Light Off*");
                Console.WriteLine("User enters/exits the elevator");
                Thread.Sleep(500);
                Console.WriteLine("---Closing Doors---");
                Thread.Sleep(500);
                Console.WriteLine("Closed Doors");
                Thread.Sleep(500);
            }
            public void Move_up(int RequestedFloor, char column_char)
            {
                Console.WriteLine("Column : " + column_char + " // Elevator : #" + elevator_no + "  Current Floor : " + this.elevator_floor);
                Thread.Sleep(500);
                while (this.elevator_floor != RequestedFloor)
                {
                    this.elevator_floor += 1;
                    Console.WriteLine("Column : " + column_char + " // Elevator : #" + elevator_no + "  Floor : " + this.elevator_floor);
                    Thread.Sleep(500);
                }

            }
            public void Move_down(int RequestedFloor, char column_char)
            {
                Console.WriteLine("Column : " + column_char + " // Elevator : #" + elevator_no + "  Current Floor : " + this.elevator_floor);
                Thread.Sleep(500);
                while (this.elevator_floor != RequestedFloor)
                {
                    this.elevator_floor -= 1;
                    Console.WriteLine("Column : " + column_char + " // Elevator : #" + elevator_no + "  Floor : " + this.elevator_floor);
                    Thread.Sleep(500);
                }

            }
        }
        static void Main(string[] args)
        {
            //Battery.Scenario1();
            //Battery.Scenario2();
            //Battery.Scenario3();
            //Battery.Scenario4();
        }
    }
}