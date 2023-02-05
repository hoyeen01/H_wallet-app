class Wallet < ApplicationRecord
    belongs_to :user

    validates :status, presence: true
    before_validation :check_status

    has_many :debit_transactions, as: :source, class_name: :Transaction
    has_many :credit_transactions, as: :destination, class_name: :Transaction

    def transactions
        Transaction.where(source: self)
                   .or(Transaction.where(destination: self))
                   .order(updated_at: :desc)
    end

    enum status: {
        status_active: 0,
        status_inactive: 1,
    }

    def api_output
        JSON(self.to_json).merge({recent_transactions: []})
    end

    def check_status
        return if self.status.present?

        self.status = :status_active
    end
end
