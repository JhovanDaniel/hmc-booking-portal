class ResultsController < ApplicationController
    before_action :set_result, only: [:show, :edit, :update]
    
    def new
        @result = Result.new
    end
    
    def create
        @result = Result.new(result_params)
        if @result.save
            flash[:notice] = "Result was saved successfully."
            redirect_to appointments_path
        else
           render 'new' 
        end
    end
    
    def update
      if @result.update(result_params)
        flash[:notice] = "Result was updates successfully."
        redirect_to appointment_path(@result.appointment)
      else
        render 'edit', result: @result
      end    
    end
    
    def edit
        
    end
    
    private
    
    def result_params
       params.require(:result).permit(:appointment_id, :result_date, :result_outcome, :comments)
    end

    def set_result
        @result = Result.find(params[:id])
    end
end
