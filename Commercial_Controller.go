package main

import "fmt"

//Battery contains all the object for the program
type Battery struct {
	batteryNo int
	columnList []Column
}

// createColumn creates the battery for the program
func (b *Battery) createColumn(batteryNo int) {
	b.columnList = append(b.columnList, Column{1,-6,0,5,[]Elevator{}})
	b.columnList[0].createElevator(5)
	b.columnList = append(b.columnList, Column{2,0,19,5,[]Elevator{}})
	b.columnList[1].createElevator(5)
	b.columnList = append(b.columnList, Column{3,20,39,5,[]Elevator{}})
	b.columnList[2].createElevator(5)
	b.columnList = append(b.columnList, Column{4,40,59,5,[]Elevator{}})
	b.columnList[3].createElevator(5)
}

//Column have elevators inside
type Column struct{
	id int
	nbElevators int
	lowFloor int
	highFloor int
	elevatorList []Elevator
}

//createElevator creates all Columns and put them in battery column list
func (c *Column) createElevator(numElevators int){
	for i := 0 ; i < numElevators ; i++ {
		c.elevatorList = append(c.elevatorList, Elevator{i,"IDLE",1,"IDLE",[]int{}})
	}
}

//Elevator takes passenger to the floor level wanted added in floorList array
type Elevator struct{
	elevatorNo int
	status string
	elevatorFloor int
	elevatorDirection string
	floorList []int
}

func main() {
	fmt.Println("Hello World !")
	battery := &Battery{1, []Column{}}
	battery.createColumn(1)
	fmt.Println("Battery1 id is", battery.batteryNo)
}       