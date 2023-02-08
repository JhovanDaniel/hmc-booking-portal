module ApplicationHelper
  
  def format_date(date)
    date.strftime("%b %-d, %Y")
  end 
  
  def format_date2(date)
    date.strftime("%A, %b %-d, %Y")
  end
  
  def format_time(time)
    time.strftime("%l:%M %p")
  end
  
  def format_date_time(date)
    date.strftime("%b %-d, %Y - %l:%M %p")
  end
  
  def link_to_add_weights(name)
    link_to name, '#', class: "add_weight_fields", :"data-field" => "<input class='text optional' type='text'  name='yourmodelname[weights][]' id='yourmodelname_'>"
  end
  
end
