class Api::BankAccountsController < ApiController
    before_action :authenticate
  
    def verify
      paystack_response = PaystackService::Utility.resolve_account_number(**account_params)
      account_name = paystack_response['data']['account_name']
      recipient_response = PaystackService::Utility.transfer_recipient(account_name: account_name, **account_params)
      return render head(:ok)
    end
  
    def account_params
      {
        account_number: params.require(:account_number),
        bank_code: params.require(:bank_code)
      }
    end
end
  