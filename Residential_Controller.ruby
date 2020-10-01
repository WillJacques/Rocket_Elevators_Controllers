# -------------------------------------------------------------------------------------------------------

# SCENARIO CHOICES ARE AT THE END OF THE PROGRAM, YOU ONLY HAVE TO UNCOMMENT THE WANTED ONE ! THANK YOU !

# Don't wait for the output in VS, you have to run it in the terminal...

# -------------------------------------------------------------------------------------------------------

class Column
  attr_accessor :nb_of_floor, :nb_of_elevator, :elevator_list
  def initialize(nb_of_floor, nb_of_elevator)
    @nb_of_floor = nb_of_floor
    @nb_of_elevator = nb_of_elevator
    @elevator_list = []
    create_elevators
    # puts "#{@elevator_list[0].status}"
  end

  def create_elevators
    @nb_of_elevator.times do |i|
      @elevator_list.append(Elevator.new(i, 'IDLE', 1, 'IDLE'))
    end
  end

  # Request elevator function with find best elevator

  def request_elevator(floor_number, direction)
    sleep(1)
    puts(">>> User request an elevator at floor #{floor_number} to go #{direction} <<<")
    sleep(1)
    puts('*Call Button Light On*')
    sleep(1)

    request_elevator = find_best_elevator(floor_number, direction)
    request_elevator.send_request(floor_number)
    request_elevator
  end

  # Request floor inside elevator

  def request_floor(elevator_object, requested_floor)
    sleep(1)
    puts(">>> User wants to go to floor #{requested_floor} <<<")
    sleep(1)
    puts('*Request Button Light On*')
    sleep(1)
    elevator_object.send_request(requested_floor)
  end

  # Best elevator Function

  def find_best_elevator(floor_number, direction)
    puts("Searching for best elevator to go to floor #{floor_number} in #{direction} direction.")
    if floor_number == 10
      direction = 'UP'
    end
    if floor_number == 1
      direction = 'DOWN'
    end
    if direction == 'UP'
      result_array = []
      score_array = []
      b_elevator = nil
      elevator_list.length.times do |i|
        elevator_i = elevator_list[i]
        if elevator_i.elevator_direction == 'UP' && elevator_i.elevator_floor < floor_number
          result_array.append(i)
          score = elevator_i.elevator_floor - floor_number
          score_array.append(score.abs)
        end
      end

      if score_array == []
        elevator_list.length.times do |i|
          elevator_i = elevator_list[i]
            if elevator_i.elevator_direction == 'IDLE'
              result_array.append(i)
              score = elevator_i.elevator_floor - floor_number
              score_array.append(score.abs)
            end
        end
      end

      if score_array == []
        elevator_list.length.times do |i|
          elevator_i = elevator_list[i]
          result_array.append(i)
          score = elevator_i.elevator_floor - floor_number
          score_array.append(score.abs)
        end
      end

      if result_array.length > 0
        minimum = score_array[0]
        location = 0
        score_array.length.times do |i|
          if score_array[i] < minimum
            minimum = score_array[i]
            location = i
          end
        end
        b_elevator = result_array[location]
      end
      best_elevator = elevator_list[b_elevator]
      best_elevator
    else # IF DIRECTION IS DOWN
      result_array = []
      score_array = []
      b_elevator = nil
      elevator_list.length.times do |i|
        elevator_i = elevator_list[i]
        if elevator_i.elevator_direction == 'DOWN' && elevator_i.elevator_floor > floor_number
          result_array.append(i)
          score = elevator_i.elevator_floor - floor_number
          score_array.append(score.abs)
        end
      end

      if score_array == []
        elevator_list.length.times do |i|
          elevator_i = elevator_list[i]
            if elevator_i.elevator_direction == 'IDLE'
              result_array.append(i)
              score = elevator_i.elevator_floor - floor_number
              score_array.append(score.abs)
            end
        end
      end

      if score_array == []
        elevator_list.length.times do |i|
          elevator_i = elevator_list[i]
          result_array.append(i)
          score = elevator_i.elevator_floor - floor_number
          score_array.append(score.abs)
        end
      end

      if score_array.length > 0
        minimum = score_array[0]
        location = 0
        score_array.length.times do |i|
          if score_array[i] < minimum
            minimum = score_array[i]
            location = i
          end
        end
        b_elevator = result_array[location]
      end
      best_elevator = elevator_list[b_elevator]
    end
    best_elevator
  end
end

class Elevator
  attr_accessor :elevator_no, :status, :elevator_floor, :elevator_direction, :floor_list, :letter, :elevator_letter
  def initialize (elevator_no, status, elevator_floor, elevator_direction)
    @elevator_no = elevator_no
    @letter = 97 + elevator_no
    @elevator_letter = letter.chr
    @status = status
    @elevator_floor = elevator_floor
    @elevator_direction = elevator_direction
    @floor_list = []
  end

  # Send Request then operate

  def send_request requested_floor
    floor_list.append(requested_floor)
    compute_list
    operate_elevator(requested_floor)
  end

  # Sort list if the elevator is going 'UP' or 'DOWN'

  def compute_list
    if elevator_direction == 'UP'
      floor_list.sort
    elsif elevator_direction == 'DOWN'
      floor_list.sort
      floor_list.reverse
    end
    floor_list
  end

  # System operation

  def operate_elevator(requested_floor)
    while floor_list.length > 0
      if requested_floor == elevator_floor
        open_door
        @status = 'moving'
        floor_list.pop
      elsif requested_floor < elevator_floor
        @status = 'moving'
        puts("---Elevator #{elevator_letter.capitalize} #{status}---")
        @elevator_direction = 'DOWN'
        move_down(requested_floor)
        @status = 'stopped'
        puts("---Elevator #{elevator_letter.capitalize} #{status}---")
        open_door
        floor_list.pop
      elsif requested_floor > elevator_floor
        @status = 'moving'
        puts("---Elevator #{elevator_letter.capitalize} #{status}---")
        @elevator_direction = 'UP'
        move_up(requested_floor)
        @status = 'stopped'
        puts("---Elevator #{elevator_letter.capitalize} #{status}---")
        open_door
        floor_list.pop
      end
    end
    @elevator_direction = 'IDLE'
  end

  # OPEN DOORS FUNCTION

  def open_door
    sleep(1)
    puts('Open Doors')
    puts('---Opening Doors---')
    sleep(1)
    puts('*Button Light Off*')
    puts('User enters/exits the elevator')
    sleep(1)
    puts('---Closing Doors---')
    sleep(1)
    close_door
  end

  # CLOSE DOORS FUNCTION

  def close_door
    puts('Closed Doors')
    sleep(1)
  end

  # MOVE THE ELEVATOR UP FUNCTION

  def move_up(requested_floor)
    puts("Floor : #{elevator_floor}")
    sleep(1)
    while elevator_floor != requested_floor
      @elevator_floor += 1
      puts("Floor : #{elevator_floor}")
      sleep(1)
    end
  end

  # MOVE THE ELEVATOR DOWN FUNCTION

  def move_down(requested_floor)
    puts("Floor : #{elevator_floor}")
    sleep(1)
    while elevator_floor != requested_floor
      @elevator_floor -= 1
      puts("Floor : #{elevator_floor}")
      sleep(1)
    end
  end
end

def test_elevator1
  column = Column.new(10, 2)

  puts '##### Scenario 1 Started ! #####'

  column.elevator_list[0].elevator_floor = 2 # set elevator 1 floor
  column.elevator_list[1].elevator_floor = 6 # set elevator 2 floor

  called_elevator = column.request_elevator(3, 'UP') # User call on floor with direction
  column.request_floor(called_elevator, 7) # User call inside elevator

  puts '##### Scenario 1 Ended ! #####'
end

def test_elevator2
  column = Column.new(10, 2)

  puts '##### Scenario 2 Started ! #####'
  
  column.elevator_list[0].elevator_floor = 10 # set elevator 1 floor  
  column.elevator_list[1].elevator_floor = 3 # set elevator 2 floor

  called_elevator = column.request_elevator(1, 'UP') # User call on floor with direction
  column.request_floor(called_elevator, 6) # User call inside elevator
  called_elevator = column.request_elevator(3, 'UP') # User call on floor with direction
  column.request_floor(called_elevator, 5) # User call inside elevator
  called_elevator = column.request_elevator(9, 'DOWN') # User call on floor with direction
  column.request_floor(called_elevator, 2) # User call inside elevator

  puts '##### Scenario 2 Ended ! #####'
end

def test_elevator3
  column = Column.new(10, 2)

  puts '##### Scenario 3 Started ! #####'

  column.elevator_list[0].elevator_floor = 10       # set elevator 1 floor
  column.elevator_list[1].elevator_floor = 6        # set elevator 2 floor
  column.elevator_list[1].elevator_direction = 'UP' # set elevator 2 direction

  called_elevator = column.request_elevator(3, 'DOWN')    # User call on floor with direction  
  column.request_floor(called_elevator, 2)                # User call inside elevator
  called_elevator = column.request_elevator(10, 'DOWN')   # User call on floor with direction
  column.request_floor(called_elevator, 3)                # User call inside elevator

  puts '##### Scenario 3 Ended ! #####'
end

# SCENARIOS

# UNCOMMENT, RUN and RELAX watching CONSOLE :)

test_elevator1
# test_elevator2
# test_elevator3

# HAVE A NICE DAY !