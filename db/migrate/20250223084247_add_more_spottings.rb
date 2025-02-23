class AddMoreSpottings < ActiveRecord::Migration[8.0]
  def change
    # Randomized coordinates within Aberdeen (varying slightly)
    coordinates = [
      ["57.1497", "-2.0943"],  # Central Aberdeen
      ["57.1635", "-2.1151"],  # North of City Center
      ["57.1865", "-2.1342"],  # Bridge of Don Area
      ["57.1380", "-2.1015"],  # Near Northfield
      ["57.1272", "-2.1208"],  # West of Aberdeen
      ["57.1518", "-2.1115"],  # Near Union Street
      ["57.1759", "-2.1043"],  # Near Altens
      ["57.1602", "-2.0859"],  # Near Garthdee
      ["57.1670", "-2.1117"],  # Close to Kingswells
      ["57.1407", "-2.1293"]   # Near Old Aberdeen
    ]

    # Updated list of animals with Chicken added
    animals = ['Bird', 'Deer', 'Dog', 'Fox', 'Rabbit', 'Squirrel', 'Badger', 'Chicken']

    # Generate random spottings for each animal and random location
    coordinates.each_with_index do |(lat, lon), index|
      animals.each do |animal|
        Spotting.create(
          user_id: 1,
          animal_name: animal,
          location: "#{lat}, #{lon}"
        )
      end
    end
  end
end
