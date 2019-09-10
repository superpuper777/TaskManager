module TaskManager
 module Entities
  class Task < Grape::Entity
   expose :name
   expose :status
   expose :priority
  end
 end
end
