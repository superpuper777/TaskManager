module TaskManager
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        version 'v1', using: :path
        format :json
        prefix :api


          # def logger
          #   API.logger
          # end

        # end
      end

    end
  end
end
