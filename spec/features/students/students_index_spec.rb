require 'rails_helper'

RSpec.describe "When I visit students index" do
  it "I see a list of students with their count of professors" do
    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
  
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    agarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
  
    ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
    ProfessorStudent.create(student_id: harry.id, professor_id: agarid.id)
    ProfessorStudent.create(student_id: harry.id, professor_id: lupin.id)
    
    ProfessorStudent.create(student_id: malfoy.id, professor_id: lupin.id)
  
    visit '/students'

    # within "#student-#{harry.id}" do
      expect(page).to have_content("Harry Potter: 3")
      # end
      
      expect(page).to have_content("Draco Malfoy: 1")
  end
end