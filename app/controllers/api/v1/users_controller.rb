module Api
    module V1
        class UsersController < ApplicationController

            def signup
                user = User.new(user_params)
                user.save
                render json: user
            end


            def login
                if(user_params[:first_name] == 'Kalyani')
                    user = User.find_by(first_name: 'Kalyani')
                    render json: user
                else
                    payload = {
                        message: "Bad Credentials",
                        status: 400
                    }
                    render :json => payload, :status => :bad_request
                end
            end


            private

                def user_params
                    params.require(:user).permit(:first_name, :last_name, :email, :address, :phone_number)
                end

        end
    end
end
