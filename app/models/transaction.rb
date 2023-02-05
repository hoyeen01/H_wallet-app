# == Schema Information
#
# Table name: transactions
#
#  id               :bigint           not null, primary key
#  amount           :float            not null
#  txn_type         :integer          not null
#  status           :integer          not null
#  source_id        :bigint           not null
#  source_type      :string           not null
#  destination_id   :bigint           not null
#  destination_type :string           not null
#  txn_ref          :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Transaction < ApplicationRecord
    belongs_to :source, polymorphic: true
    belongs_to :destination, polymorphic: true

    validates :source_id, :source_type, presence: true
    #validates :destination, :destination_type, presence: true
    validates :txn_ref, presence: true
    validates :txn_ref, uniqueness: true

    before_validation :check_txn_ref

    delegate :user, to: :source

    enum txn_type: {
        type_credit: 0,
        type_debit: 1
    }

    enum status: {
        pending: 0,
        success: 1,
        cancelled: 2,
    }

    def check_txn_ref
        return if txn_ref.present?

        loop do
            ref = SecureRandom.hex(10)
            next if Transaction.find_by(txn_ref: ref).any?

            break self.txn_ref = ref
        end
    end
   #{
    #card: {
        #cvv:"123",
        #number:"5060666666666666666",
        #expiry_month:"02",
        #expiry_year:"24"
      #}
    #}
end
