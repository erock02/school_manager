class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
  end

  def create
    student = Student.new({
    student_name: params[:students][:student_name],
    school_id: params[:students][:school_id],
    age: params[:students][:age]
    })

    student.save

    redirect_to '/students'
  end

  def show
    @student = Student.find(params[:id])
  end
end
