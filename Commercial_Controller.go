package main

import "fmt"

//Battery contains all the object for the program
type Battery struct {
	batteryNo int
	columnList []Column
}

// createBattery creates the battery for the program
func createBattery(batteryNo int) Battery {
	b := Battery{
		batteryNo: batteryNo, 
		columnList: make([]Column,0),
	}
	b.columnList = b.createColumn()
	return b
}

//Column have elevators inside
type Column struct{
	Battery Battery
	id int
	nbElevators int
	lowFloor int
	highFloor int
	elevatorList []Elevator
}

//createColumn creates all Columns and put them in battery column list
func (b Battery) createColumn(){
	var column1 = Column{b, 1, -6, 0, 5, []Elevator{}}
	b.columnList = append(b.columnList, column1)
	var column2 = Column{b, 2, 0, 19, 5, []Elevator{}}
	b.columnList = append(b.columnList, column2)
	var column3 = Column{b, 3, 20, 39, 5, []Elevator{}}
	b.columnList = append(b.columnList, column3)
	var column4 = Column{b, 4, 40, 59, 5, []Elevator{}}
	b.columnList = append(b.columnList, column4)
}

//Elevator takes passenger to the floor level wanted added in floorList array
type Elevator struct{
	elevatorNo int
	status string
	elevatorFloor int
	elevatorDirection string
	floorList []int
}

//NewElevator create elevator and puts them into elevator list
func (c *Column) NewElevator(){
	for i := 1; i <= c.nbElevators; i++ {
		elevator := Elevator{i,"IDLE", 1, "IDLE", []int{}}
		c.elevatorList = append(c.elevatorList, elevator)
	}
}

func main() {
	fmt.Println("Hello World !")
	scenarioBattery := createBattery(1)
}       