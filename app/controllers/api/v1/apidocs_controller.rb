module Api
  module V1
    class ApidocsController < ApplicationController

      include Swagger::Blocks

      swagger_root do
        key :swagger, '2.0'
        info do
          key :version, '1.0.0'
          key :title, 'Rails API App Documentation'
          key :description, 'A sample API app' \
                            'also demonstrate features in the swagger-2.0 specification'
          contact do
            key :name, 'Kalyani Bagale'
            key :email, 'bagale.kalyani@gmail.com'
          end
          license do
            key :name, 'MIT'
          end
        end

        security_definition :bearer do
          key :type, :apiKey
          key :name, :Authorization
          key :in, :header
        end

        tag do
          key :name, 'user'
          key :description, 'Users operations'
          externalDocs do
            key :description, 'Find more info here'
            key :url, 'https://swagger.io'
          end
        end
        key :basePath, '/api/v1/'
        key :consumes, ['application/json']
        key :produces, ['application/json']
      end

      # A list of all classes that have swagger_* declarations.
      SWAGGERED_CLASSES = [
        UsersController,
        self,
      ].freeze

      def index
        render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
      end

    end
  end
end
