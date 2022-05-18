class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def new
  end

  def create
    school = School.create(school_params)
    redirect_to '/schools'
  end

  def show
    @school = School.find(params[:id])
  end

  def edit
    @school_id = params[:id]
  end

  def update
    school = School.find(params[:id])
    school.update(school_params)
    redirect_to '/schools'
  end

  def destroy
    school = School.find(params[:id])
    school.destroy
    redirect_to '/schools'
  end

  private
    def school_params
      params.permit(:school_name, :school_address, :active)
    end
end
