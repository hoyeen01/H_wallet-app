class Api::SessionsController < ApiController
    def create
        user = User.find_by(email: session_params[:email])
            return render json: { message: 'User with email does not exist'}if user.nil?

            user = user.authenticate(session_params[:password])
            if user.present?
                user.generate_token
                return render json: { message: 'login succesful', data: user }
            else
                render json: { message: 'Password is invalid'}
            end
    end

    def session_params 
        {
            email: params.require(:email),
            password: params.require(:password)
        }
    end
end