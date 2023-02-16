class ReportsController < ApplicationController
    
  def dashboard
    if params[:search].present? 
      if params[:search][:report_type].present?
        @report_type = params[:search][:report_type]
      end
    end
  end
  
  def update_report
    if params[:search].present? 
      if params[:search][:report_type].present? && params[:search][:start_date].present? && params[:search][:end_date].present?
        @report_type = params[:search][:report_type]
        @start_date = params[:search][:start_date]
        @end_date = params[:search][:end_date]
        @appointments = Appointment.active.where(:date => @start_date.to_date.beginning_of_day..@end_date.to_date.end_of_day)
      end
    end
    
    render turbo_stream:
      turbo_stream.replace("appointment-reports",
                            partial: "reports/appointment_reports")
  end
  
  def download_appointments_report
      @start_date = params[:start_date]
      @end_date = params[:end_date]
      @appointments = Appointment.active.where(:date => @start_date.to_date.beginning_of_day..@end_date.to_date.end_of_day)

    respond_to do |format|
      format.html
      format.xlsx {
        render xlsx: "download_appointments_report", filename: "appointments-#{@start_date} to #{@end_date}.xlsx" 
      }
    end 
  end
    
end
