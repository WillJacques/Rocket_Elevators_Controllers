
package main

import (
	"fmt"
	"time"
	"sort"
)

func positive(n int) int {
    if n < 0 {
        n *= -1
    }
    return n
}

func remove(slice []int, s int) []int {
    return append(slice[:s], slice[s+1:]...)
}

//Battery contains all the object for the program
type Battery struct {
	batteryNo int
	nbColumns int
	columnList []Column
}

// createColumn creates the battery for the program
func (b *Battery) createColumn() {
	b.columnList = append(b.columnList, Column{"A", -6, 0, 5, []Elevator{}})
	b.columnList = append(b.columnList, Column{"B", 0, 19, 5, []Elevator{}})
	b.columnList = append(b.columnList, Column{"C", 20, 39, 5, []Elevator{}})
	b.columnList = append(b.columnList, Column{"D", 40, 59, 5, []Elevator{}})
	for i := 0 ; i < b.nbColumns ; i++ {
		b.columnList[i].createElevator()
	}
}

func (b *Battery) scenario1() {
	b.createColumn()
	b.columnList[1].elevatorList[0].elevatorFloor = 19
	b.columnList[1].elevatorList[0].elevatorDirection = "DOWN"
	b.columnList[1].elevatorList[0].status = "MOVING"
	b.columnList[1].elevatorList[0].floorList = append(b.columnList[1].elevatorList[0].floorList, 4)

	b.columnList[1].elevatorList[1].elevatorFloor = 2
	b.columnList[1].elevatorList[1].elevatorDirection = "UP"
	b.columnList[1].elevatorList[1].status = "MOVING"
	b.columnList[1].elevatorList[1].floorList = append(b.columnList[1].elevatorList[1].floorList, 14)

	b.columnList[1].elevatorList[2].elevatorFloor = 12
	b.columnList[1].elevatorList[2].elevatorDirection = "DOWN"
	b.columnList[1].elevatorList[2].status = "MOVING"
	b.columnList[1].elevatorList[2].floorList = append(b.columnList[1].elevatorList[2].floorList, 0)

	b.columnList[1].elevatorList[3].elevatorFloor = 14
	b.columnList[1].elevatorList[3].elevatorDirection = "DOWN"
	b.columnList[1].elevatorList[3].status = "MOVING"
	b.columnList[1].elevatorList[3].floorList = append(b.columnList[1].elevatorList[3].floorList, 1)

	b.columnList[1].elevatorList[4].elevatorFloor = 5
	b.columnList[1].elevatorList[4].elevatorDirection = "DOWN"
	b.columnList[1].elevatorList[4].status = "MOVING"
	b.columnList[1].elevatorList[4].floorList = append(b.columnList[1].elevatorList[4].floorList, 0)
	fmt.Println("##################")
	fmt.Println("Scenario 1 Started")
	fmt.Println("##################")
	fmt.Println("Elevator B",b.columnList[1].elevatorList[0].elevatorNo,"is on floor",b.columnList[1].elevatorList[0].elevatorFloor," going ",b.columnList[1].elevatorList[0].elevatorDirection)
	fmt.Println("Elevator B",b.columnList[1].elevatorList[1].elevatorNo,"is on floor",b.columnList[1].elevatorList[1].elevatorFloor," going ",b.columnList[1].elevatorList[1].elevatorDirection)
	fmt.Println("Elevator B",b.columnList[1].elevatorList[2].elevatorNo,"is on floor",b.columnList[1].elevatorList[2].elevatorFloor," going ",b.columnList[1].elevatorList[2].elevatorDirection)
	fmt.Println("Elevator B",b.columnList[1].elevatorList[3].elevatorNo,"is on floor",b.columnList[1].elevatorList[3].elevatorFloor," going ",b.columnList[1].elevatorList[3].elevatorDirection)
	fmt.Println("Elevator B",b.columnList[1].elevatorList[4].elevatorNo,"is on floor",b.columnList[1].elevatorList[4].elevatorFloor," going ",b.columnList[1].elevatorList[4].elevatorDirection)
	fmt.Println("##################");
	var reqElevator Elevator = b.columnList[1].requestElevator(0, "UP", "B")         // User call on floor with direction
	b.columnList[1].requestFloor(reqElevator, 19, "B")                      // User call inside elevator
	for i := 0 ; i < len(b.columnList[1].elevatorList) ; i++ {
		b.columnList[1].elevatorList[i].operOtherElevator("B")
	}
	fmt.Println("##################");
	fmt.Println("Elevator B",b.columnList[1].elevatorList[0].elevatorNo," is on floor ",b.columnList[1].elevatorList[0].elevatorFloor," is on ",b.columnList[1].elevatorList[0].elevatorDirection)
	fmt.Println("Elevator B",b.columnList[1].elevatorList[1].elevatorNo," is on floor ",b.columnList[1].elevatorList[1].elevatorFloor," is on ",b.columnList[1].elevatorList[1].elevatorDirection)
	fmt.Println("Elevator B",b.columnList[1].elevatorList[2].elevatorNo," is on floor ",b.columnList[1].elevatorList[2].elevatorFloor," is on ",b.columnList[1].elevatorList[2].elevatorDirection)
	fmt.Println("Elevator B",b.columnList[1].elevatorList[3].elevatorNo," is on floor ",b.columnList[1].elevatorList[3].elevatorFloor," is on ",b.columnList[1].elevatorList[3].elevatorDirection)
	fmt.Println("Elevator B",b.columnList[1].elevatorList[4].elevatorNo," is on floor ",b.columnList[1].elevatorList[4].elevatorFloor," is on ",b.columnList[1].elevatorList[4].elevatorDirection)
	fmt.Println("##################");
	fmt.Println("Scenario 1 Ended");
	fmt.Println("##################");
}

func (b *Battery) scenario2() {
	b.createColumn()
	b.columnList[2].elevatorList[0].elevatorFloor = 0
	b.columnList[2].elevatorList[0].elevatorDirection = "UP"
	b.columnList[2].elevatorList[0].status = "MOVING"
	b.columnList[2].elevatorList[0].floorList = append(b.columnList[2].elevatorList[0].floorList, 20)

	b.columnList[2].elevatorList[1].elevatorFloor = 22
	b.columnList[2].elevatorList[1].elevatorDirection = "UP"
	b.columnList[2].elevatorList[1].status = "MOVING"
	b.columnList[2].elevatorList[1].floorList = append(b.columnList[2].elevatorList[1].floorList, 27)

	b.columnList[2].elevatorList[2].elevatorFloor = 32
	b.columnList[2].elevatorList[2].elevatorDirection = "DOWN"
	b.columnList[2].elevatorList[2].status = "MOVING"
	b.columnList[2].elevatorList[2].floorList = append(b.columnList[2].elevatorList[2].floorList, 0)

	b.columnList[2].elevatorList[3].elevatorFloor = 39
	b.columnList[2].elevatorList[3].elevatorDirection = "DOWN"
	b.columnList[2].elevatorList[3].status = "MOVING"
	b.columnList[2].elevatorList[3].floorList = append(b.columnList[2].elevatorList[3].floorList, 23)

	b.columnList[2].elevatorList[4].elevatorFloor = 38
	b.columnList[2].elevatorList[4].elevatorDirection = "DOWN"
	b.columnList[2].elevatorList[4].status = "MOVING"
	b.columnList[2].elevatorList[4].floorList = append(b.columnList[2].elevatorList[4].floorList, 0)
	fmt.Println("##################")
	fmt.Println("Scenario 2 Started")
	fmt.Println("##################")
	fmt.Println("Elevator C",b.columnList[2].elevatorList[0].elevatorNo,"is on floor",b.columnList[2].elevatorList[0].elevatorFloor," going ",b.columnList[2].elevatorList[0].elevatorDirection)
	fmt.Println("Elevator C",b.columnList[2].elevatorList[1].elevatorNo,"is on floor",b.columnList[2].elevatorList[1].elevatorFloor," going ",b.columnList[2].elevatorList[1].elevatorDirection)
	fmt.Println("Elevator C",b.columnList[2].elevatorList[2].elevatorNo,"is on floor",b.columnList[2].elevatorList[2].elevatorFloor," going ",b.columnList[2].elevatorList[2].elevatorDirection)
	fmt.Println("Elevator C",b.columnList[2].elevatorList[3].elevatorNo,"is on floor",b.columnList[2].elevatorList[3].elevatorFloor," going ",b.columnList[2].elevatorList[3].elevatorDirection)
	fmt.Println("Elevator C",b.columnList[2].elevatorList[4].elevatorNo,"is on floor",b.columnList[2].elevatorList[4].elevatorFloor," going ",b.columnList[2].elevatorList[4].elevatorDirection)
	fmt.Println("##################");
	var reqElevator Elevator = b.columnList[2].requestElevator(0, "UP", "C")         // User call on floor with direction
	b.columnList[2].requestFloor(reqElevator, 35, "C")                      // User call inside elevator
	for i := 0 ; i < len(b.columnList[2].elevatorList) ; i++ {
		b.columnList[2].elevatorList[i].operOtherElevator("C")
	}
	fmt.Println("##################");
	fmt.Println("Elevator C",b.columnList[2].elevatorList[0].elevatorNo," is on floor ",b.columnList[2].elevatorList[0].elevatorFloor," is on ",b.columnList[2].elevatorList[0].elevatorDirection)
	fmt.Println("Elevator C",b.columnList[2].elevatorList[1].elevatorNo," is on floor ",b.columnList[2].elevatorList[1].elevatorFloor," is on ",b.columnList[2].elevatorList[1].elevatorDirection)
	fmt.Println("Elevator C",b.columnList[2].elevatorList[2].elevatorNo," is on floor ",b.columnList[2].elevatorList[2].elevatorFloor," is on ",b.columnList[2].elevatorList[2].elevatorDirection)
	fmt.Println("Elevator C",b.columnList[2].elevatorList[3].elevatorNo," is on floor ",b.columnList[2].elevatorList[3].elevatorFloor," is on ",b.columnList[2].elevatorList[3].elevatorDirection)
	fmt.Println("Elevator C",b.columnList[2].elevatorList[4].elevatorNo," is on floor ",b.columnList[2].elevatorList[4].elevatorFloor," is on ",b.columnList[2].elevatorList[4].elevatorDirection)
	fmt.Println("##################");
	fmt.Println("Scenario 2 Ended");
	fmt.Println("##################");
}

func (b *Battery) scenario3() {
	b.createColumn()
	b.columnList[3].elevatorList[0].elevatorFloor = 57
	b.columnList[3].elevatorList[0].elevatorDirection = "DOWN"
	b.columnList[3].elevatorList[0].status = "MOVING"
	b.columnList[3].elevatorList[0].floorList = append(b.columnList[3].elevatorList[0].floorList, 0)

	b.columnList[3].elevatorList[1].elevatorFloor = 49
	b.columnList[3].elevatorList[1].elevatorDirection = "UP"
	b.columnList[3].elevatorList[1].status = "MOVING"
	b.columnList[3].elevatorList[1].floorList = append(b.columnList[3].elevatorList[1].floorList, 59)

	b.columnList[3].elevatorList[2].elevatorFloor = 45
	b.columnList[3].elevatorList[2].elevatorDirection = "UP"
	b.columnList[3].elevatorList[2].status = "MOVING"
	b.columnList[3].elevatorList[2].floorList = append(b.columnList[3].elevatorList[2].floorList, 57)

	b.columnList[3].elevatorList[3].elevatorFloor = 0
	b.columnList[3].elevatorList[3].elevatorDirection = "UP"
	b.columnList[3].elevatorList[3].status = "MOVING"
	b.columnList[3].elevatorList[3].floorList = append(b.columnList[3].elevatorList[3].floorList, 53)

	b.columnList[3].elevatorList[4].elevatorFloor = 59
	b.columnList[3].elevatorList[4].elevatorDirection = "DOWN"
	b.columnList[3].elevatorList[4].status = "MOVING"
	b.columnList[3].elevatorList[4].floorList = append(b.columnList[3].elevatorList[4].floorList, 0)
	fmt.Println("##################")
	fmt.Println("Scenario 3 Started")
	fmt.Println("##################")
	fmt.Println("Elevator D",b.columnList[3].elevatorList[0].elevatorNo,"is on floor",b.columnList[3].elevatorList[0].elevatorFloor," going ",b.columnList[3].elevatorList[0].elevatorDirection)
	fmt.Println("Elevator D",b.columnList[3].elevatorList[1].elevatorNo,"is on floor",b.columnList[3].elevatorList[1].elevatorFloor," going ",b.columnList[3].elevatorList[1].elevatorDirection)
	fmt.Println("Elevator D",b.columnList[3].elevatorList[2].elevatorNo,"is on floor",b.columnList[3].elevatorList[2].elevatorFloor," going ",b.columnList[3].elevatorList[2].elevatorDirection)
	fmt.Println("Elevator D",b.columnList[3].elevatorList[3].elevatorNo,"is on floor",b.columnList[3].elevatorList[3].elevatorFloor," going ",b.columnList[3].elevatorList[3].elevatorDirection)
	fmt.Println("Elevator D",b.columnList[3].elevatorList[4].elevatorNo,"is on floor",b.columnList[3].elevatorList[4].elevatorFloor," going ",b.columnList[3].elevatorList[4].elevatorDirection)
	fmt.Println("##################");
	var reqElevator Elevator = b.columnList[3].requestElevator(53, "DOWN", "D")         // User call on floor with direction
	b.columnList[3].requestFloor(reqElevator, 0, "D")                      // User call inside elevator
	for i := 0 ; i < len(b.columnList[3].elevatorList) ; i++ {
		b.columnList[3].elevatorList[i].operOtherElevator("D")
	}
	fmt.Println("##################");
	fmt.Println("Elevator D",b.columnList[3].elevatorList[0].elevatorNo," is on floor ",b.columnList[3].elevatorList[0].elevatorFloor," is on ",b.columnList[3].elevatorList[0].elevatorDirection)
	fmt.Println("Elevator D",b.columnList[3].elevatorList[1].elevatorNo," is on floor ",b.columnList[3].elevatorList[1].elevatorFloor," is on ",b.columnList[3].elevatorList[1].elevatorDirection)
	fmt.Println("Elevator D",b.columnList[3].elevatorList[2].elevatorNo," is on floor ",b.columnList[3].elevatorList[2].elevatorFloor," is on ",b.columnList[3].elevatorList[2].elevatorDirection)
	fmt.Println("Elevator D",b.columnList[3].elevatorList[3].elevatorNo," is on floor ",b.columnList[3].elevatorList[3].elevatorFloor," is on ",b.columnList[3].elevatorList[3].elevatorDirection)
	fmt.Println("Elevator D",b.columnList[3].elevatorList[4].elevatorNo," is on floor ",b.columnList[3].elevatorList[4].elevatorFloor," is on ",b.columnList[3].elevatorList[4].elevatorDirection)
	fmt.Println("##################");
	fmt.Println("Scenario 3 Ended");
	fmt.Println("##################");
}

func (b *Battery) scenario4() {
	b.createColumn()
	b.columnList[0].elevatorList[0].elevatorFloor = -4
	b.columnList[0].elevatorList[0].elevatorDirection = "IDLE"
	b.columnList[0].elevatorList[0].status = "IDLE"

	b.columnList[0].elevatorList[1].elevatorFloor = 0
	b.columnList[0].elevatorList[1].elevatorDirection = "IDLE"
	b.columnList[0].elevatorList[1].status = "IDLE"

	b.columnList[0].elevatorList[2].elevatorFloor = -3
	b.columnList[0].elevatorList[2].elevatorDirection = "DOWN"
	b.columnList[0].elevatorList[2].status = "MOVING"
	b.columnList[0].elevatorList[2].floorList = append(b.columnList[0].elevatorList[2].floorList, -5)

	b.columnList[0].elevatorList[3].elevatorFloor = -6
	b.columnList[0].elevatorList[3].elevatorDirection = "UP"
	b.columnList[0].elevatorList[3].status = "MOVING"
	b.columnList[0].elevatorList[3].floorList = append(b.columnList[0].elevatorList[3].floorList, 0)

	b.columnList[0].elevatorList[4].elevatorFloor = -1
	b.columnList[0].elevatorList[4].elevatorDirection = "DOWN"
	b.columnList[0].elevatorList[4].status = "MOVING"
	b.columnList[0].elevatorList[4].floorList = append(b.columnList[0].elevatorList[4].floorList, -6)
	fmt.Println("##################")
	fmt.Println("Scenario 4 Started")
	fmt.Println("##################")
	fmt.Println("Elevator A",b.columnList[0].elevatorList[0].elevatorNo,"is on floor",b.columnList[0].elevatorList[0].elevatorFloor," going ",b.columnList[0].elevatorList[0].elevatorDirection)
	fmt.Println("Elevator A",b.columnList[0].elevatorList[1].elevatorNo,"is on floor",b.columnList[0].elevatorList[1].elevatorFloor," going ",b.columnList[0].elevatorList[1].elevatorDirection)
	fmt.Println("Elevator A",b.columnList[0].elevatorList[2].elevatorNo,"is on floor",b.columnList[0].elevatorList[2].elevatorFloor," going ",b.columnList[0].elevatorList[2].elevatorDirection)
	fmt.Println("Elevator A",b.columnList[0].elevatorList[3].elevatorNo,"is on floor",b.columnList[0].elevatorList[3].elevatorFloor," going ",b.columnList[0].elevatorList[3].elevatorDirection)
	fmt.Println("Elevator A",b.columnList[0].elevatorList[4].elevatorNo,"is on floor",b.columnList[0].elevatorList[4].elevatorFloor," going ",b.columnList[0].elevatorList[4].elevatorDirection)
	fmt.Println("##################");
	var reqElevator Elevator = b.columnList[0].requestElevator(-3, "UP", "A")         // User call on floor with direction
	b.columnList[0].requestFloor(reqElevator, 0, "A")                      // User call inside elevator
	for i := 0 ; i < len(b.columnList[0].elevatorList) ; i++ {
		b.columnList[0].elevatorList[i].operOtherElevator("A")
	}
	fmt.Println("##################");
	fmt.Println("Elevator A",b.columnList[0].elevatorList[0].elevatorNo," is on floor ",b.columnList[0].elevatorList[0].elevatorFloor," is on ",b.columnList[0].elevatorList[0].elevatorDirection)
	fmt.Println("Elevator A",b.columnList[0].elevatorList[1].elevatorNo," is on floor ",b.columnList[0].elevatorList[1].elevatorFloor," is on ",b.columnList[0].elevatorList[1].elevatorDirection)
	fmt.Println("Elevator A",b.columnList[0].elevatorList[2].elevatorNo," is on floor ",b.columnList[0].elevatorList[2].elevatorFloor," is on ",b.columnList[0].elevatorList[2].elevatorDirection)
	fmt.Println("Elevator A",b.columnList[0].elevatorList[3].elevatorNo," is on floor ",b.columnList[0].elevatorList[3].elevatorFloor," is on ",b.columnList[0].elevatorList[3].elevatorDirection)
	fmt.Println("Elevator A",b.columnList[0].elevatorList[4].elevatorNo," is on floor ",b.columnList[0].elevatorList[4].elevatorFloor," is on ",b.columnList[0].elevatorList[4].elevatorDirection)
	fmt.Println("##################");
	fmt.Println("Scenario 4 Ended");
	fmt.Println("##################");
}

//Column have elevators inside
type Column struct{
	id string
	lowFloor int
	highFloor int
	nbElevators int
	elevatorList []Elevator
}

//createElevator creates all Columns and put them in battery column list
func (c *Column) createElevator(){
	for i := 1 ; i <= c.nbElevators ; i++ {
		c.elevatorList = append(c.elevatorList, Elevator{i,"IDLE",1,"IDLE",[]int{}})
	}
}

func (c *Column) requestElevator(floorNumber int, direction string, columnChar string) Elevator {
	time.Sleep(500 * time.Millisecond)
	fmt.Println("####################################")
	fmt.Println(">>> User request an elevator at floor",floorNumber,"to go",direction,"<<<")
	time.Sleep(500 * time.Millisecond)
	fmt.Println("*Call Button Light On*")
	var requestElevator Elevator = c.findBestElevator(floorNumber, direction)
	requestElevator.send1Request(floorNumber, direction)
	return requestElevator
}

func (c *Column) requestFloor(requestElevator Elevator, requestedFloor int, columnChar string){
	time.Sleep(500 * time.Millisecond)
	fmt.Println("Requested floor :",requestedFloor)
	time.Sleep(500 * time.Millisecond)
	fmt.Println("Call Button Light On")
	time.Sleep(500 * time.Millisecond)
	requestElevator.send2Request(requestedFloor, columnChar)
}

func (c *Column) findBestElevator(floorNumber int, direction string) Elevator{
	fmt.Println("Searching for best elevator to go to floor ",floorNumber," in ",direction," direction.")
	if floorNumber == c.lowFloor{
		direction = "DOWN"
	} else if floorNumber == 0{
		direction = "DOWN"
	} else if floorNumber == c.highFloor{
		direction = "UP";
	}
	var resultArray []int
	var scoreArray []int
	var bElevator int
	var bestelevator Elevator
	if direction == "UP"{
		for i := 0 ; i < len(c.elevatorList) ; i++ {
			var elevatorI = c.elevatorList[i]
			if (elevatorI.elevatorDirection == "UP" && elevatorI.elevatorFloor <= floorNumber) || (elevatorI.elevatorFloor == floorNumber && floorNumber == 0){
				resultArray = append(resultArray, i)
				var score int = positive(elevatorI.elevatorFloor - floorNumber)
				scoreArray = append(scoreArray, score)
			}
		}
		if len(scoreArray) == 0 {
			for i := 0 ; i < len(c.elevatorList) ; i++ {
				var elevatorI = c.elevatorList[i]
				if elevatorI.elevatorDirection == "IDLE"{
					resultArray = append(resultArray, i)
					var score int = positive(elevatorI.elevatorFloor - floorNumber)
					scoreArray = append(scoreArray, score)
				}
			}
		}
		if len(scoreArray) == 0 {
			for i := 0 ; i < len(c.elevatorList) ; i++ {
				var elevatorI = c.elevatorList[i]
				resultArray = append(resultArray, i)
				var score int = positive(elevatorI.elevatorFloor - floorNumber)
				scoreArray = append(scoreArray, score)
			}
		}
		var minimum int = scoreArray[0]
		var location int = 0
		for i := 0 ; i < len(scoreArray) ; i++{
			if scoreArray[i] < minimum{
				minimum = scoreArray[i]
				location = i
			}
		}
		bElevator = resultArray[location]	
	} else {
		for i := 0 ; i < len(c.elevatorList) ; i++ {
			var elevatorI = c.elevatorList[i]
			if (elevatorI.elevatorDirection == "DOWN" && elevatorI.elevatorFloor >= floorNumber) || (elevatorI.elevatorFloor == floorNumber && floorNumber == 0){
				resultArray = append(resultArray, i)
				var score int = positive(elevatorI.elevatorFloor - floorNumber)
				scoreArray = append(scoreArray, score)
			}
		}
		if len(scoreArray) == 0 {
			for i := 0 ; i < len(c.elevatorList) ; i++ {
				var elevatorI = c.elevatorList[i]
				if elevatorI.elevatorDirection == "IDLE"{
					resultArray = append(resultArray, i)
					var score int = positive(elevatorI.elevatorFloor - floorNumber)
					scoreArray = append(scoreArray, score)
				}
			}
		}
		if len(scoreArray) == 0 {
			for i := 0 ; i < len(c.elevatorList) ; i++ {
				var elevatorI = c.elevatorList[i]
				resultArray = append(resultArray, i)
				var score int = positive(elevatorI.elevatorFloor - floorNumber)
				scoreArray = append(scoreArray, score)
			}
		}
		var minimum int = scoreArray[0]
		var location int = 0
		for i := 0 ; i < len(scoreArray) ; i++{
			if scoreArray[i] < minimum{
				minimum = scoreArray[i]
				location = i
			}
		}
		bElevator = resultArray[location]
	}
	bestelevator = c.elevatorList[bElevator]
    return bestelevator
}

//Elevator takes passenger to the floor level wanted added in floorList array
type Elevator struct{
	elevatorNo int
	status string
	elevatorFloor int
	elevatorDirection string
	floorList []int
}

func (e *Elevator) send1Request(requestedFloor int, columnChar string){
	e.floorList = append(e.floorList, requestedFloor)
	if requestedFloor >= e.elevatorFloor{
		sort.Ints(e.floorList)
	} else if requestedFloor < e.elevatorFloor{
		sort.Sort(sort.Reverse(sort.IntSlice(e.floorList)))
	}
	var floorlistpop int = e.floorList[0]
	e.floorList = remove(e.floorList, 0)
	e.operateElevator(floorlistpop, columnChar)
}

func (e *Elevator) send2Request(requestedFloor int, columnChar string){
	e.floorList = append (e.floorList, requestedFloor)
	for i := 0 ; i < len(e.floorList) ; i++ {
		for j := 0 ; j < len(e.floorList) ; j++ {
			if e.floorList[i] == e.floorList[j] && i != j{
				e.floorList = remove(e.floorList, i)
			}
		}
	}
	for len(e.floorList) > 0{
		if requestedFloor >= e.elevatorFloor{
			sort.Ints(e.floorList)
		} else if requestedFloor < e.elevatorFloor{
			sort.Sort(sort.Reverse(sort.IntSlice(e.floorList)))
		}
		var floorlistpop int = e.floorList[0]
		e.floorList = remove(e.floorList, 0)
		e.operateElevator(floorlistpop, columnChar)
	}
	e.elevatorDirection = "IDLE"
}

func (e *Elevator) operOtherElevator(columnChar string){
	for len(e.floorList) > 0{
		if e.floorList[0] >= e.elevatorFloor{
			sort.Ints(e.floorList)
		} else if e.floorList[0] < e.elevatorFloor{
			sort.Sort(sort.Reverse(sort.IntSlice(e.floorList)))
		}
		var floorlistpop int = e.floorList[0]
		e.floorList = remove(e.floorList, 0)
		e.operateElevator(floorlistpop, columnChar)
	}
	e.elevatorDirection = "IDLE"
}

func (e *Elevator) operateElevator(requestedFloor int, columnChar string){
	if requestedFloor == e.elevatorFloor{
		e.openDoor()
		e.status = "MOVING"
		e.floorList = remove(e.floorList, 0)
	} else if requestedFloor < e.elevatorFloor{
		time.Sleep(500 * time.Millisecond)
		e.status = "MOVING"
		fmt.Println("*Button Light Off*")
		fmt.Println("--- Column :",columnChar,"// Elevator :",e.elevatorNo,e.status,"---")
		e.elevatorDirection = "DOWN"
		e.moveDown(requestedFloor, columnChar)
		e.status = "STOPPED"
		fmt.Println("--- Column :",columnChar,"// Elevator :",e.elevatorNo,e.status,"---")
		e.openDoor()
	} else if requestedFloor > e.elevatorFloor{
		time.Sleep(500 * time.Millisecond)
		e.status = "MOVING"
		fmt.Println("*Button Light Off*")
		fmt.Println("--- Column :",columnChar,"// Elevator :",e.elevatorNo,e.status,"---")
		e.elevatorDirection = "UP"
		e.moveUp(requestedFloor, columnChar)
		e.status = "STOPPED"
		fmt.Println("--- Column :",columnChar,"// Elevator :",e.elevatorNo,e.status,"---")
		e.openDoor()
	}
}

func (e *Elevator) openDoor(){
	time.Sleep(500 * time.Millisecond)
	fmt.Println("Open Doors")
	fmt.Println("---Opening Doors---")
	time.Sleep(500 * time.Millisecond)
	time.Sleep(500);
	fmt.Println("*Button Light Off*");
	fmt.Println("User enters/exits the elevator");
	time.Sleep(500);
	fmt.Println("---Closing Doors---");
	time.Sleep(500);
	fmt.Println("Closed Doors");
	time.Sleep(500);
}

func (e *Elevator) moveUp(requestedFloor int, columnChar string){
	fmt.Println("Column :",columnChar,"// Elevator : #",e.elevatorNo,"Current Floor :",e.elevatorFloor)
	time.Sleep(500 * time.Millisecond)
	for e.elevatorFloor != requestedFloor{
		e.elevatorFloor ++
		fmt.Println("Column :",columnChar,"// Elevator : #",e.elevatorNo,"Floor :",e.elevatorFloor)
		time.Sleep(500 * time.Millisecond)
	}
}

func (e *Elevator) moveDown(requestedFloor int, columnChar string){
	fmt.Println("Column :",columnChar,"// Elevator : #",e.elevatorNo,"Current Floor :",e.elevatorFloor)
	time.Sleep(500 * time.Millisecond)
	for e.elevatorFloor != requestedFloor{
		e.elevatorFloor --
		fmt.Println("Column :",columnChar,"// Elevator : #",e.elevatorNo,"Floor :",e.elevatorFloor)
		time.Sleep(500 * time.Millisecond)
	}
}


func main() {
	b := Battery{1, 4, []Column{}}
	//b.scenario1()
	//b.scenario2()
	//b.scenario3()
	//b.scenario4()
}       
