class ProceduresController < ApplicationController
  
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_procedure, only: [:show, :edit, :update, :destroy, :show_timeslots]
  
  def index
    @procedures = Procedure.all
  end

  def show
  end

  def new
    @procedure = Procedure.new
  end
  
  def create 
    @procedure = Procedure.new(procedure_params)
    if @procedure.save
        flash[:notice] = "Procedure was created successfully."
        redirect_to procedures_path
    else
       render 'new' 
    end
  end
  
  def update
    if @procedure.update(procedure_params)
      flash[:notice] = "Procedure was created successfully."
      redirect_to procedure_path(@procedure)
    else
      render 'form', appointment: @procedure
    end   
  end

  def edit
  end
  
  def show_timeslots
    
  end
  
  def datatable
    respond_to do |format|
      format.html
      format.json { render json: ProcedureDatatable.new(params, view_context: view_context) }
    end
  end
  
  private
    
    def procedure_params
       params.require(:procedure).permit(:name, :procedure_type, :cost, :is_available, :booking_limit)
    end

    def set_procedure
        @procedure = Procedure.find(params[:id])
    end
end
