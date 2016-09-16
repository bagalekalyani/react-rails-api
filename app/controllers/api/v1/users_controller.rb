module Api
  module V1
    class UsersController < ApplicationController
      include Swagger::Blocks

      swagger_path '/users/signup' do
        operation :post do
          key :description, 'Creates a new user'
          key :operationId, 'signup'
          key :produces, [
            'application/json'
          ]
          key :tags, [
            'post'
          ]
          parameter do
            key :name, "user[first_name]"
            key :in, :formData
            key :description, 'First Name of User'
            key :type, :string
            key :required, true
          end
          parameter do
            key :name, "user[last_name]"
            key :in, :formData
            key :description, 'Last Name of User'
            key :type, :string
            key :required, true
          end
          parameter do
            key :name, "user[email]"
            key :in, :formData
            key :description, 'Email of User'
            key :type, :string
            key :required, true
          end
          parameter do
            key :name, "user[address]"
            key :in, :formData
            key :description, 'Address of User'
            key :type, :string
            key :required, true
          end
          parameter do
            key :name, "user[phone_number]"
            key :in, :formData
            key :description, 'Phone Number of User'
            key :type, :string
            key :required, true
          end
          parameter do
            key :name, "user[password_hash]"
            key :in, :formData
            key :description, 'Password Hash of User'
            key :type, :string
            key :required, true
          end

          response 201 do
            key :description, 'signup response'
          end
          response :default do
            key :description, 'unexpected error'
          end
        end
      end

      swagger_path '/users/login' do
        operation :post do
          key :description, 'Logs in a user'
          key :operationId, 'login'
          key :produces, [
            'application/json'
          ]
          key :tags, [
            'post'
          ]
          parameter do
            key :name, "user[email]"
            key :in, :formData
            key :description, 'Email of User'
            key :type, :string
            key :required, true
          end
          parameter do
            key :name, "user[password_hash]"
            key :in, :formData
            key :description, 'Password Hash of User'
            key :type, :string
            key :required, true
          end

          response 200 do
            key :description, 'Login response'
          end
          response :default do
            key :description, 'unexpected error'
          end
        end
      end

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
