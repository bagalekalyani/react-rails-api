module Api
    module V1
        class UsersController < ApplicationController

            def signup
                user = User.new(user_params)
                if user.save
                    payload = {
                        id: user.id,
                        first_name: user.first_name,
                        email: user.email,
                        status: 201
                    }
                    render json: payload, status: :created
                else
                    payload = {
                        message: user.errors.messages[:email][0],
                        status: 409
                    }
                    render json: payload, status: :conflict
                end
            end


            def login
                user = User.authenticate(user_params[:email], user_params[:password_hash])
                if user
                    payload = {
                        id: user.id,
                        first_name: user.first_name,
                        email: user.email,
                        status: 200
                    }
                    render json: payload, status: :ok
                else
                    payload = {
                        message: "Bad Credentials",
                        status: 400
                    }
                    render json: payload, status: :bad_request
                end
            end


            private
                def user_params
                    params.require(:user).permit(:first_name, :last_name, :email, :address, :phone_number, :password_hash)
                end

        end
    end
end
