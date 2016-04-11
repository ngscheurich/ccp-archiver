class Story < ActiveRecord::Base
  module States
    NEW = 1
    PROCESSING = 2
    DONE = 3
    ERROR = 4
  end
end
