class ProcedureDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  include ApplicationHelper
    
  def_delegators :@view, :user_path, :link_to, :procedure_path, :edit_procedure_path
  
  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
      name:               { source: "Procedure.name", cond: :like, searchable: true, orderable: true},
      procedure_type:          { source: "Procedure.procedure_type", cond: :like, searchable: true, orderable: true },
      cost:         { source: "Procedure.cost", cond: :like, searchable: true, orderable: true},
      is_available:         { source: "Procedure.is_available", cond: :like, searchable: true, orderable: true},
      actions:        { source: "", searchable: false, orderable: false},
    }
  end

  def data
    records.map do |record|
        #custom actions
        
      actions = 
        '<button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
        <div class="dropdown-menu dropdown-menu-end">'
      
        actions += link_to("View", procedure_path(record), class: "dropdown-item")
        actions += link_to("Edit", edit_procedure_path(record), class: "dropdown-item")
        
        actions +=
        '</div>'
        
        if record.is_available == true
          available_html = '<span class="badge badge-sm bg-success">Available</span>'
        else
          available_html = '<span class="badge badge-sm bg-danger">Unvailable</span>'
        end
        
      {
        name:      record.name,
        procedure_type:  record.procedure_type,
        cost: record.cost,
        is_available: available_html.html_safe,
        actions: actions.html_safe,
      }
    end
  end

  def get_raw_records
    Procedure.all
  end

end