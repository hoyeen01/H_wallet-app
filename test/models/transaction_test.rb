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
require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
