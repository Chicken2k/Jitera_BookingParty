require 'swagger_helper'

RSpec.describe 'api/admins', type: :request do
  before do
    create(:admin)
  end

  # jitera-hook-for-rswag-example

  path '/api/admins/{id}' do
    delete 'Destroy admins' do
      tags 'admins'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          admins: {
            type: :object,
            properties: {
              email: {
                type: :string,
                example: 'string'
              }

            }
          }
        }
      }
      response '200', 'delete' do
        examples 'application/json' => {
          'message' => {}

        }

        let(:resource) { create(:admin) }

        let(:params) {}

        let(:id) { resource.id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/admins/{id}' do
    put 'Update admins' do
      tags 'admins'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          admins: {
            type: :object,
            properties: {
              name: {
                type: :string,
                example: 'string'
              },

              email: {
                type: :string,
                example: 'string'
              }

            }
          }
        }
      }
      response '200', 'update' do
        examples 'application/json' => {
          'admin' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'parties' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'nameparty' => 'string',

      'partystarttime' => 'datetime',

      'partylocation' => 'text',

      'numberofpeople' => 'integer',

      'isstatus' => 'boolean',

      'admin_id' => 'foreign_key'

    }
  ],

            'name' => 'string',

            'email' => 'string'

          },

          'error_object' => {}

        }

        let(:resource) { create(:admin) }

        let(:id) { resource.id }

        let(:params) { { id: id, admins: { id: id } } }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/admins/{id}' do
    get 'Show admins' do
      tags 'admins'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          admins: {
            type: :object,
            properties: {
              email: {
                type: :string,
                example: 'string'
              }

            }
          }
        }
      }
      response '200', 'show' do
        examples 'application/json' => {
          'admin' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'parties' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'nameparty' => 'string',

      'partystarttime' => 'datetime',

      'partylocation' => 'text',

      'numberofpeople' => 'integer',

      'isstatus' => 'boolean',

      'admin_id' => 'foreign_key'

    }
  ],

            'name' => 'string',

            'email' => 'string'

          },

          'message' => {}

        }

        let(:resource) { create(:admin) }

        let(:params) {}

        let(:id) { resource.id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '//api/admins' do
    post 'Create admins' do
      tags 'admins'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          admins: {
            type: :object,
            properties: {
              name: {
                type: :string,
                example: 'string'
              },

              email: {
                type: :string,
                example: 'string'
              }

            }
          }
        }
      }
      response '200', 'create' do
        examples 'application/json' => {
          'admin' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'parties' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'nameparty' => 'string',

      'partystarttime' => 'datetime',

      'partylocation' => 'text',

      'numberofpeople' => 'integer',

      'isstatus' => 'boolean',

      'admin_id' => 'foreign_key'

    }
  ],

            'name' => 'string',

            'email' => 'string'

          },

          'error_object' => {}

        }

        let(:resource) { build(:admin) }

        let(:params) { { admins: resource.attributes.to_hash } }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/admins' do
    get 'List admins' do
      tags 'admins'
      consumes 'application/json'
      parameter name: :params, in: :query, schema: {
        type: :object,
        properties: {
          pagination_page: {
            type: :pagination_page,
            example: 'pagination_page'
          },
          pagination_limit: {
            type: :pagination_limit,
            example: 'pagination_limit'
          },
          admins: {
            type: :object,
            properties: {
              name: {
                type: :string,
                example: 'string'
              },

              email: {
                type: :string,
                example: 'string'
              }

            }
          }
        }
      }
      response '200', 'index' do
        examples 'application/json' => {
          'total_pages' => 'integer',

          'admins' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'parties' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'nameparty' => 'string',

            'partystarttime' => 'datetime',

            'partylocation' => 'text',

            'numberofpeople' => 'integer',

            'isstatus' => 'boolean',

            'admin_id' => 'foreign_key'

          }
        ],

            'name' => 'string',

            'email' => 'string'

          }
        ],

          'message' => {}

        }

        let(:resource) { create(:admin) }

        let(:params) {}
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end
end
