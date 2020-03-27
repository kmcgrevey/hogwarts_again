require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:professors).through(:professor_students)}
  end

  describe 'instance methods' do
    it '.prof_count' do

    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    agarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
    
    ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
    ProfessorStudent.create(student_id: harry.id, professor_id: agarid.id)

      expect(harry.prof_count).to eq(2)
    end
  end

end
