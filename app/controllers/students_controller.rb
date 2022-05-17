class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
  end

  def create
    student = Student.create(student_params)
    redirect_to '/students'
  end

  def show
    @student = Student.find(params[:id])
  end

  private
    def student_params
      params.permit(:student_name, :age, :frl)
    end
end
