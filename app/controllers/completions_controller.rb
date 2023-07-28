class CompletionsController < ApplicationController
    before_action :set_completion, only: [:update, :destroy]
    before_action :authenticate_user!, only: [:index, :delete, :update]
    
    def index
        @completions = Completion.all
    end
    
    def create
        @completion = Completion.new(completion_params)
    
        if @completion.save
        render json: @completion, status: :created
        else
        render json: @completion.errors, status: :unprocessable_entity
        end
    end
    
    def update
        if @completion.update(completion_params)
        render json: @completion
        else
        render json: @completion.errors, status: :unprocessable_entity
        end
    end
    
    def destroy
        @completion.destroy
        head :no_content
    end
    
    private
    
    def set_completion
        @completion = Completion.find(params[:id])
    end
    
    def completion_params
      params.require(:completion).permit(:first_name, :last_name, :uid, :tutorial_id)
    end
end
