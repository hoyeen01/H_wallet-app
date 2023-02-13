class DebitCard < ApplicationRecord
    belongs_to :user

    def api_output
        JSON(self.to_json).except('authorization_code')
    end
end
