module TaskManager
 module Entities
  class Index < Grape::Entity
   expose :name
   expose :tasks
  end
 end
end
