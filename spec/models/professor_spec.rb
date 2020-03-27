require 'rails_helper'

RSpec.describe Professor, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :specialty}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:students).through(:professor_students)}
  end

  describe 'instance methods' do
    it '.avg_age' do

    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    harry = Student.create(name: "Harry Potter" , age: 10 , house: "Gryffindor" )
    malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    longbottom = Student.create(name: "Neville Longbottom" , age: 14 , house: "Gryffindor" )
    
    ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
    ProfessorStudent.create(student_id: malfoy.id, professor_id: snape.id)
    ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)

    expect(snape.avg_age).to eq(12)
    end
  end
end
