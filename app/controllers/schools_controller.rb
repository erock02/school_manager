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

  private
    def school_params
      params.permit(:school_name, :school_address, :active)
    end
end
