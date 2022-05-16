class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def new
  end

  def create
    school = School.new({
    school_name: params[:schools][:school_name],
    school_address: params[:schools][:school_address],
    active: params[:schools][:active]
    })

    school.save

    redirect_to '/schools'
  end

  def show
    @school = School.find(params[:id])
  end
end
