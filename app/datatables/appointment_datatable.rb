class AppointmentDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  include ApplicationHelper
    
  def_delegators :@view, :user_path, :link_to, :appointment_path, :edit_appointment_path, :cancel_appointment_path
  
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
      created_at:               { source: "Appointment.created_at", cond: :like, searchable: true, orderable: true},
      appointment_number:       { source: "Appointment.appointment_number", cond: :like, searchable: true, orderable: true},
      first_name:               { source: "Appointment.first_name", cond: :like, searchable: true, orderable: true},
      last_name:         { source: "Appointment.last_name", cond: :like, searchable: true, orderable: true},
      date:          { source: "Appointment.date", cond: :like, searchable: true, orderable: true },
      time:        { source: "Appointment.time", cond: :like, searchable: true, orderable: true},
      procedure:        { source: "Appointment.procedure_id", cond: :like, searchable: true, orderable: true},
      user:        { source: "Appointment.user_id", cond: :like, searchable: true, orderable: true},
      actions:        { source: "", searchable: false, orderable: false},
    }
  end

  def data
    records.map do |record|
        #custom actions
        actions = 
        '<button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
        <div class="dropdown-menu dropdown-menu-end">'
      
        actions += link_to("View", appointment_path(record), class: "dropdown-item")
        actions += link_to("Edit", edit_appointment_path(record), class: "dropdown-item")
        if record.active?
          actions += link_to("Cancel", cancel_appointment_path(record), class: "dropdown-item")
        else
          actions += link_to("Reverse Cancellation", cancel_appointment_path(record), class: "dropdown-item")
        end
        
        actions +=
        '</div>'
        
      {
        created_at: format_date(record.created_at),
        appointment_number: record.appointment_number,
        first_name: record.first_name,
        last_name: record.last_name,
        date: format_date(record.date),
        time: format_time(record.time),
        procedure:  record.procedure.name,
        user:  record.user.name,
        actions: actions.html_safe,
      }
    end
  end

  def get_raw_records
    get_by_status(options[:status])
  end
  
  def get_by_status(status)
    if status.present?
      Appointment.where(status: Appointment.statuses[:cancelled])
    else
      Appointment.where(status: Appointment.statuses[:active])
    end
  end
  
end