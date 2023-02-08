class Timeslot < ApplicationRecord
  belongs_to :procedure
    
  enum day: [:Sunday, :Monday, :Tuesday, :Wednesday, :Thursday, :Friday, :Saturday]
  
  attr_accessor :start_time
  
    
  def order_time_array(direction)
    if direction == "ASC"
      self.sort
    elsif direction == "DESC"
      self.sort {|a,b| b <=> a}
    else
      raise "Invalid direction. Specify either ASC or DESC."    
    end
  end
end
