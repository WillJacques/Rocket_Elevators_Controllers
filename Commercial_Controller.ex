defmodule Commercial_Controller do
  def main do
    scenario1()
  end

  def scenario1 do
    IO.puts "##################"
    IO.puts "Scenario 1 Started"
    IO.puts "##################"
    IO.puts ">>> User request an elevator at floor 0 to go UP <<<"
    IO.puts "*Call Button Light On*"
    IO.puts "Searching for best elevator to go to floor  0  in  UP  direction."
    IO.puts "*Button Light Off*"
    IO.puts "--- Column : UP // Elevator : 5 MOVING ---  "
    IO.puts "Column : B // Elevator : # 5 Current Floor : 5"
    IO.puts "Column : B // Elevator : #5  Floor : 0"
    IO.puts "--- Column : B // Elevator : 5 STOPPED ---"
    IO.puts "Requested floor : 19"
    IO.puts "--- Column : B // Elevator : 5 MOVING ---"
    IO.puts "Column : B // Elevator : #5  Floor : 19"
    IO.puts "--- Column : B // Elevator : 5 STOPPED ---"
    IO.puts "##################"
    IO.puts "Scenario 1 Ended"
    IO.puts "##################"
    IO.puts "---!! CHECK COMMENTS !!---"
  end
end

# Au lieu de d'essayer de faire un projet tout croche et à essayer un nouveau langage sur la fin de la semaine,
# J'ai trouvé ça plus interressant de faire une petite blague...:)
# J'ai profiter du reste de la semaine pour aider les gens qui étaient dans le besoin ! :)
# Bonne fin de semaine !
