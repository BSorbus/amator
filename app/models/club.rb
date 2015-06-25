class Club < ActiveRecord::Base

  def fullname
    "#{number}, #{call_sign}"
  end

end
