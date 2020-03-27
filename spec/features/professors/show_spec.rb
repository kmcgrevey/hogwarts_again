require 'rails_helper'

RSpec.describe "When I visit professor show page" do
  it "I see a list of student names they have" do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")

    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
  
    snape.students << harry
    snape.students << malfoy
    snape.students << longbottom
    
    
    visit "/professors/#{snape.id}"

    expect(page).to have_content(snape.name)
    expect(page).to have_content(harry.name)
    expect(page).to have_content(malfoy.name)
    expect(page).to have_content(longbottom.name)
  
  end

  it "I see the average age of all their students" do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
    
    ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
    ProfessorStudent.create(student_id: malfoy.id, professor_id: snape.id)
    ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)

    visit "/professors/#{snape.id}"
  
    expect(page).to have_content("Average Age: 11.3")

  end
end


# As a visitor, 
# When I visit '/professors/:id'
# I see the average age of all students
#  for that professor.
# (e.g. "Average Age: 14.5")