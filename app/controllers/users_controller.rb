class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  end
  
  def datatable
    respond_to do |format|
      format.html
      format.json { render json: UserDatatable.new(params, view_context: view_context) }
    end
  end
  
end
