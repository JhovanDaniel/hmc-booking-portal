class TimeslotsController < ApplicationController
  # before_action :order_time_array, only: [:update]
  before_action :set_timeslot, only: [:update, :remove_time]
  
  def new
    @timeslot = Timeslot.new
  end
  
  def create 
    @timeslot = Timeslot.new(timeslot_params)
    
    time_slot_to_sting = "#{params[:timeslot]["start_time(4i)"]}:#{params[:timeslot]["start_time(5i)"]}"
    
    @timeslot.time.append(time_slot_to_sting)  
  
    if @timeslot.save
        flash[:notice] = "Timeslot was created successfully."
        redirect_to show_timeslots_procedure_path(@timeslot.procedure)
    else
       render 'new' 
    end
  end
  
  def update
    time_slot_to_sting = "#{params[:timeslot]["start_time(4i)"]}:#{params[:timeslot]["start_time(5i)"]}"
    @timeslot.time.append(time_slot_to_sting)  
  
    if @timeslot.update(timeslot_params)
        flash[:notice] = "Timeslot update created successfully."
        redirect_to show_timeslots_procedure_path(@timeslot.procedure)
    end
  end
  
    
  def show
    @timeslots = Timeslot.all
  end
  
  def remove_time
    time = params[:time_param]
    @timeslot.time.delete(time)
    if @timeslot.save
      flash[:notice] = "Timeslot was updated successfully."
      redirect_to show_timeslots_procedure_path(@timeslot.procedure)
    end
  end
  
  
private
    
    def timeslot_params
       params.require(:timeslot).permit(:day, :procedure_id, :start_time, time: [])
    end

    def set_timeslot
        @timeslot = Timeslot.find(params[:id])
    end
end
