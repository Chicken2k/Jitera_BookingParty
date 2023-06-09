# frozen_string_literal: true

require 'swagger_helper'

describe 'Verify reset password request API' do
  path '/api/admins_verify_reset_password_requests' do
    post 'Verify reset password request' do
      tags 'Verify reset password request'
      consumes 'application/json'

      parameter name: :owner_fields, in: :body, schema: {
        type: :object,
        properties: {
          reset_token: { type: :string, example: 'dummy_reset_token' },
          password: { type: :string, example: 'EhCe/kYwIUu4+z3Teg==' },
          password_confirmation: { type: :string, example: 'oUcSvDXuqpHpoYEq+A==' }
        }
      }

      response '200', 'request sent' do
        let(:admin) { Admin.find_by(email: 'admin@jitera.com') || create(:admin, email: 'admin@jitera.com') }
        let(:token) { admin.generate_reset_password_token }

        examples 'application/json' => {
          success: true
        }

        let(:owner_fields) do
          {
            reset_token: token,
            password: '2iKTKbsmrocL4tjjxQ==',
            password_confirmation: 'tVK0kv5AChOh4kdvvA=='
          }
        end

        run_test! do |response|
          expect(response.status).to be(200)
        end
      end
    end
  end
end
