# rubocop:disable Style/ClassAndModuleChildren
class PartybookingsService::Index
  attr_accessor :params, :records, :query

  def initialize(params, _current_user = nil)
    @params = params

    @records = Partybooking

    @query = records
  end

  def execute
    partybookings_user_id_equal

    partybookings_party_id_equal

    order
    paginate

    records
  end

  def partybookings_user_id_equal
    return if params.dig(:partybookings, :user_id).blank?

    where_clause = query.where(partybookings: { user_id: params.dig(:partybookings, :user_id).to_s })

    @records = where_clause
  end

  def partybookings_party_id_equal
    return if params.dig(:partybookings, :party_id).blank?

    where_clause = query.where(partybookings: { party_id: params.dig(:partybookings, :party_id).to_s })

    # Notes - The reason for doing this is as below
    # If suppose there is OR condition, and previous 1 filter is nil, params, not present?
    # in such case there will be records.or(second_condition)
    # OR will return all records and break logic
    # ideally if previous condition nil it should retrun with current second condition and not perform OR
    @records = if records.is_a?(Class)
                 where_clause
               else
                 records.or(query)
               end
  end

  def order
    @records = records.order('partybookings.created_at desc')
  end

  def paginate
    @records = records.page(params[:pagination_page] || 1).per(params[:pagination_limit] || 20)
  end
end
# rubocop:enable Style/ClassAndModuleChildren
