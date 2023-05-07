# rubocop:disable Style/ClassAndModuleChildren
class AdminsService::Index
  attr_accessor :params, :records, :query

  def initialize(params, _current_user = nil)
    @params = params

    @records = Admin

    @query = records
  end

  def execute
    admins_name_start_with_like

    admins_email_start_with_like

    order
    paginate

    records
  end

  def admins_name_start_with_like
    return if params.dig(:admins, :name).blank?

    where_clause = query.where('admins.name like ?', "%#{params.dig(:admins, :name)}")

    @records = where_clause
  end

  def admins_email_start_with_like
    return if params.dig(:admins, :email).blank?

    where_clause = query.where('admins.email like ?', "%#{params.dig(:admins, :email)}")

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
    @records = records.order('admins.created_at desc')
  end

  def paginate
    @records = records.page(params[:pagination_page] || 1).per(params[:pagination_limit] || 20)
  end
end
# rubocop:enable Style/ClassAndModuleChildren
