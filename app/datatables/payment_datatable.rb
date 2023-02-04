class PaymentDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  include ApplicationHelper
    
  def_delegators :@view, :user_path, :link_to, :appointment_path
  
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
      name:               { source: "Payment.appointment_id", cond: :like, searchable: true, orderable: true},
      appointment_number:          { source: "Payment.appointment_id", cond: :like, searchable: true, orderable: true },
      amount:         { source: "Payment.amount", cond: :like, searchable: true, orderable: true},
      procedure:         { source: "Payment.appointment_id", cond: :like, searchable: true, orderable: true},
      actions:        { source: "", searchable: false, orderable: false},
    }
  end

  def data
    records.map do |record|
        #custom actions
        
      actions = 
        '<button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
        <div class="dropdown-menu dropdown-menu-end">'
      
        actions += link_to("View Appointment", appointment_path(record.appointment), class: "dropdown-item")
        actions +=
        '</div>'
        
        appointment_number_html = link_to(record.appointment.appointment_number, appointment_path(record.appointment))
        
      {
        name:      record.appointment.name,
        appointment_number:     appointment_number_html.html_safe,
        amount:  record.amount,
        procedure: record.appointment.procedure.name,
        actions: actions.html_safe,
      }
    end
  end

  def get_raw_records
    Payment.all
  end

end