require 'swagger_helper'

RSpec.describe 'api/parties', type: :request do
  before do
    create(:party)
  end

  # jitera-hook-for-rswag-example

  path '/api/parties/{id}' do
    delete 'Destroy parties' do
      tags 'parties'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          parties: {
            type: :object,
            properties: {
              partylocation: {
                type: :text,
                example: 'text'
              }

            }
          }
        }
      }
      response '200', 'delete' do
        examples 'application/json' => {
          'message' => {}

        }

        let(:resource) { create(:party) }

        let(:params) {}

        let(:id) { resource.id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/parties/{id}' do
    put 'Update parties' do
      tags 'parties'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          parties: {
            type: :object,
            properties: {
              nameparty: {
                type: :string,
                example: 'string'
              },

              partystarttime: {
                type: :datetime,
                example: 'datetime'
              },

              partylocation: {
                type: :text,
                example: 'text'
              },

              numberofpeople: {
                type: :integer,
                example: 'integer'
              },

              isstatus: {
                type: :enum_type,
                example: 'enum_type'
              },

              admin_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },

              describe: {
                type: :text,
                example: 'text'
              }

            }
          }
        }
      }
      response '200', 'update' do
        examples 'application/json' => {
          'party' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'nameparty' => 'text',

            'partystarttime' => 'datetime',

            'partylocation' => 'text',

            'numberofpeople' => 'integer',

            'isstatus' => 'boolean',

            'partybookings' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'user_id' => 'foreign_key',

      'party_id' => 'foreign_key'

    }
  ],

            'admin' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime'

            },

            'admin_id' => 'foreign_key',

            'describe' => 'text'

          },

          'error_object' => {}

        }

        let(:resource) { create(:party) }

        let(:id) { resource.id }

        let(:params) { { id: id, parties: { id: id } } }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/parties/{id}' do
    get 'Show parties' do
      tags 'parties'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          parties: {
            type: :object,
            properties: {
              partylocation: {
                type: :text,
                example: 'text'
              }

            }
          }
        }
      }
      response '200', 'show' do
        examples 'application/json' => {
          'party' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'nameparty' => 'text',

            'partystarttime' => 'datetime',

            'partylocation' => 'text',

            'numberofpeople' => 'integer',

            'isstatus' => 'boolean',

            'partybookings' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'user_id' => 'foreign_key',

      'party_id' => 'foreign_key'

    }
  ],

            'admin' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime'

            },

            'admin_id' => 'foreign_key',

            'describe' => 'text'

          },

          'message' => {}

        }

        let(:resource) { create(:party) }

        let(:params) {}

        let(:id) { resource.id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '//api/parties' do
    post 'Create parties' do
      tags 'parties'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          parties: {
            type: :object,
            properties: {
              nameparty: {
                type: :string,
                example: 'string'
              },

              partystarttime: {
                type: :datetime,
                example: 'datetime'
              },

              partylocation: {
                type: :text,
                example: 'text'
              },

              numberofpeople: {
                type: :integer,
                example: 'integer'
              },

              isstatus: {
                type: :enum_type,
                example: 'enum_type'
              },

              admin_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },

              describe: {
                type: :text,
                example: 'text'
              }

            }
          }
        }
      }
      response '200', 'create' do
        examples 'application/json' => {
          'party' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'nameparty' => 'text',

            'partystarttime' => 'datetime',

            'partylocation' => 'text',

            'numberofpeople' => 'integer',

            'isstatus' => 'boolean',

            'partybookings' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'user_id' => 'foreign_key',

      'party_id' => 'foreign_key'

    }
  ],

            'admin' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime'

            },

            'admin_id' => 'foreign_key',

            'describe' => 'text'

          },

          'error_object' => {}

        }

        let(:resource) { build(:party) }

        let(:params) { { parties: resource.attributes.to_hash } }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/parties' do
    get 'List parties' do
      tags 'parties'
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
          parties: {
            type: :object,
            properties: {
              nameparty: {
                type: :string,
                example: 'string'
              },

              partystarttime: {
                type: :datetime,
                example: 'datetime'
              },

              partylocation: {
                type: :text,
                example: 'text'
              },

              numberofpeople: {
                type: :integer,
                example: 'integer'
              },

              isstatus: {
                type: :enum_type,
                example: 'enum_type'
              },

              admin_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },

              describe: {
                type: :text,
                example: 'text'
              }

            }
          }
        }
      }
      response '200', 'index' do
        examples 'application/json' => {
          'total_pages' => 'integer',

          'parties' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'nameparty' => 'text',

            'partystarttime' => 'datetime',

            'partylocation' => 'text',

            'numberofpeople' => 'integer',

            'isstatus' => 'boolean',

            'partybookings' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'user_id' => 'foreign_key',

            'party_id' => 'foreign_key'

          }
        ],

            'admin' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime'

            },

            'admin_id' => 'foreign_key',

            'describe' => 'text'

          }
        ],

          'message' => {}

        }

        let(:resource) { create(:party) }

        let(:params) {}
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end
end
