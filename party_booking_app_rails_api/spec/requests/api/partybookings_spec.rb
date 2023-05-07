require 'swagger_helper'

RSpec.describe 'api/partybookings', type: :request do
  before do
    create(:partybooking)
  end

  # jitera-hook-for-rswag-example

  path '/api/partybookings/{id}' do
    delete 'Destroy partybookings' do
      tags 'partybookings'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
        }
      }
      response '200', 'delete' do
        examples 'application/json' => {
          'message' => {}

        }

        let(:resource) { create(:partybooking) }

        let(:params) {}

        let(:id) { resource.id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/partybookings/{id}' do
    put 'Update partybookings' do
      tags 'partybookings'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          partybookings: {
            type: :object,
            properties: {
              user_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },

              party_id: {
                type: :foreign_key,
                example: 'foreign_key'
              }

            }
          }
        }
      }
      response '200', 'update' do
        examples 'application/json' => {
          'partybooking' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'user' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime'

            },

            'user_id' => 'foreign_key',

            'party' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime',

              'nameparty' => 'string',

              'partystarttime' => 'datetime',

              'partylocation' => 'text',

              'numberofpeople' => 'integer',

              'isstatus' => 'boolean'

            },

            'party_id' => 'foreign_key'

          },

          'error_object' => {}

        }

        let(:resource) { create(:partybooking) }

        let(:id) { resource.id }

        let(:params) { { id: id, partybookings: { id: id } } }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/partybookings/{id}' do
    get 'Show partybookings' do
      tags 'partybookings'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
        }
      }
      response '200', 'show' do
        examples 'application/json' => {
          'partybooking' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'user' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime'

            },

            'user_id' => 'foreign_key',

            'party' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime',

              'nameparty' => 'string',

              'partystarttime' => 'datetime',

              'partylocation' => 'text',

              'numberofpeople' => 'integer',

              'isstatus' => 'boolean'

            },

            'party_id' => 'foreign_key'

          },

          'message' => {}

        }

        let(:resource) { create(:partybooking) }

        let(:params) {}

        let(:id) { resource.id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '//api/partybookings' do
    post 'Create partybookings' do
      tags 'partybookings'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          partybookings: {
            type: :object,
            properties: {
              user_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },

              party_id: {
                type: :foreign_key,
                example: 'foreign_key'
              }

            }
          }
        }
      }
      response '200', 'create' do
        examples 'application/json' => {
          'partybooking' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'user' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime'

            },

            'user_id' => 'foreign_key',

            'party' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime',

              'nameparty' => 'string',

              'partystarttime' => 'datetime',

              'partylocation' => 'text',

              'numberofpeople' => 'integer',

              'isstatus' => 'boolean'

            },

            'party_id' => 'foreign_key'

          },

          'error_object' => {}

        }

        let(:resource) { build(:partybooking) }

        let(:params) { { partybookings: resource.attributes.to_hash } }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/partybookings' do
    get 'List partybookings' do
      tags 'partybookings'
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
          partybookings: {
            type: :object,
            properties: {
              user_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },

              party_id: {
                type: :foreign_key,
                example: 'foreign_key'
              }

            }
          }
        }
      }
      response '200', 'index' do
        examples 'application/json' => {
          'total_pages' => 'integer',

          'partybookings' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'user' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime'

            },

            'user_id' => 'foreign_key',

            'party' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime',

              'nameparty' => 'string',

              'partystarttime' => 'datetime',

              'partylocation' => 'text',

              'numberofpeople' => 'integer',

              'isstatus' => 'boolean'

            },

            'party_id' => 'foreign_key'

          }
        ],

          'message' => {}

        }

        let(:resource) { create(:partybooking) }

        let(:params) {}
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end
end
