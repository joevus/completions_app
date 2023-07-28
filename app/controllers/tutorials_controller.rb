class TutorialsController < ApplicationController
  before_action :set_tutorial, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  
  def index
      @tutorials = Tutorial.all
  end
  
  def create
      @tutorial = Tutorial.new(tutorial_params)
  
      if @tutorial.save
      render json: @tutorial, status: :created
      else
      render json: @tutorial.errors, status: :unprocessable_entity
      end
  end
  
  def update
      if @tutorial.update(tutorial_params)
      render json: @tutorial
      else
      render json: @tutorial.errors, status: :unprocessable_entity
      end
  end
  
  def destroy
      @tutorial.destroy
      head :no_content
  end
  
  private
  
  def set_tutorial
      @tutorial = Tutorial.find(params[:id])
  end
  
  def tutorial_params
    params.require(:tutorial).permit(:name)
  end
end