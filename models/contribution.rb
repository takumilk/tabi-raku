ActiveRecord::Base.establish_connection
class Trip  < ActiveRecord::Base
 has_many :participents
 has_many :contents 
end

class Participent < ActiveRecord::Base
 belongs_to :trip
end

class Content < ActiveRecord::Base
 belongs_to :trip
end
