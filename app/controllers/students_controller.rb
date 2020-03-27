class StudentsController < ApplicationController

  def index
    # @students = Student.all
    @students = Student.order(:name)
  end

end