class UserDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  include ApplicationHelper
    
  def_delegators :@view, :user_path, :link_to
  
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
      first_name:               { source: "User.first_name", cond: :like, searchable: true, orderable: true},
      last_name:         { source: "User.last_name", cond: :like, searchable: true, orderable: true},
      email:          { source: "User.email", cond: :like, searchable: true, orderable: true },
      role:        { source: "User.role", cond: :like, searchable: true, orderable: true},
      actions:        { source: "", searchable: false, orderable: false},
    }
  end

  def data
    records.map do |record|
        #custom actions
        actions = '<button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown" aria-expanded="false">Actions</button>'
        actions +='<div class="dropdown-menu dropdown-menu-end" style="">'
        actions += '</div>'
        
      {
        first_name:      record.first_name,
        last_name: record.last_name,
        email:  record.email,
        role:  record.role,
        actions: actions.html_safe,
      }
    end
  end

  def get_raw_records
    User.all
  end

end