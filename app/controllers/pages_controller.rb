class PagesController < ApplicationController
    
    skip_before_action :authenticate_user!
    
    def home
        
    end
    
  def reports
    if params[:search].present? 
      if params[:search][:report_type].present?
        @report_type = params[:search][:report_type]
      end
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
    
end
