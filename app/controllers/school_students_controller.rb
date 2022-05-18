class SchoolStudentsController < ApplicationController
  def index
    @school = School.find(params[:school_id])
    if params[:sort_a] == 'true'
      @students = @school.students.order(:student_name)
    else
      @students = @school.students
    end
  end

  def new
    @school_id = params[:school_id]
  end

  def create
    @school = School.find(params[:school_id])
    @student = @school.students.create(school_students_params)
    redirect_to "/schools/#{@school.id}/students"
  end

  private
    def school_students_params
      params.permit(:student_name, :age, :frl)
    end
end
