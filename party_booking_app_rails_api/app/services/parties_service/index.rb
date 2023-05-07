# rubocop:disable Style/ClassAndModuleChildren
class PartiesService::Index
  attr_accessor :params, :records, :query

  def initialize(params, _current_user = nil)
    @params = params

    @records = Party

    @query = records
  end

  def execute
    parties_nameparty_start_with_like

    parties_partystarttime_equal

    parties_partylocation_start_with_like

    parties_numberofpeople_equal

    parties_isstatus_equal

    parties_admin_id_equal

    parties_describe_start_with_like

    order
    paginate

    records
  end

  def parties_nameparty_start_with_like
    return if params.dig(:parties, :nameparty).blank?

    where_clause = query.where('parties.nameparty like ?', "%#{params.dig(:parties, :nameparty)}")

    @records = where_clause
  end

  def parties_partystarttime_equal
    return if params.dig(:parties, :partystarttime).blank?

    where_clause = query.where(parties: { partystarttime: params.dig(:parties, :partystarttime).to_s })

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

  def parties_partylocation_start_with_like
    return if params.dig(:parties, :partylocation).blank?

    where_clause = query.where('parties.partylocation like ?', "%#{params.dig(:parties, :partylocation)}")

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

  def parties_numberofpeople_equal
    return if params.dig(:parties, :numberofpeople).blank?

    where_clause = query.where(parties: { numberofpeople: params.dig(:parties, :numberofpeople).to_s })

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

  def parties_isstatus_equal
    return if params.dig(:parties, :isstatus).blank?

    where_clause = query.where(parties: { isstatus: params.dig(:parties, :isstatus).to_s })

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

  def parties_admin_id_equal
    return if params.dig(:parties, :admin_id).blank?

    where_clause = query.where(parties: { admin_id: params.dig(:parties, :admin_id).to_s })

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

  def parties_describe_start_with_like
    return if params.dig(:parties, :describe).blank?

    where_clause = query.where('parties.describe like ?', "%#{params.dig(:parties, :describe)}")

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
    @records = records.order('parties.created_at desc')
  end

  def paginate
    @records = records.page(params[:pagination_page] || 1).per(params[:pagination_limit] || 20)
  end
end
# rubocop:enable Style/ClassAndModuleChildren
