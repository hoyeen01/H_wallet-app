class Api::WalletsController < ApiController
    before_action :authenticate
    before_action :find_or_create_wallet
    
    def show
        render json: @wallet.api_output, status: :ok
    end

    def find_or_create_wallet
        return @wallet = @user.wallet if @user.wallet.present?

        @user.create_wallet
        @wallet = @user.wallet
    end
end