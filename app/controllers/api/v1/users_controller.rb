module Api
    module V1
        class UsersController < ApplicationController

            def signup
                @user = User.new(user_params)
                render json: @user
            end


            private

                def user_params
                    params.require(:user).permit(:first_name, :last_name)
                end

        end
    end
end
