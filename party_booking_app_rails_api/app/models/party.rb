class Party < ApplicationRecord
  include ConstantValidatable

  # jitera-anchor-dont-touch: relations

  has_many :partybookings, dependent: :destroy

  belongs_to :admin

  # jitera-anchor-dont-touch: enum
  enum isstatus: %w[Public Draft Close Private], _suffix: true

  # jitera-anchor-dont-touch: file

  # jitera-anchor-dont-touch: validation

  validates :nameparty, length: { maximum: 255, message: I18n.t('errors.messages.too_long') }

  validates :nameparty, presence: { message: I18n.t('errors.messages.blank') }

  validates :partystarttime, presence: { message: I18n.t('errors.messages.blank') }

  validates :partylocation, length: { maximum: 255, message: I18n.t('errors.messages.too_long') }

  validates :partylocation, presence: { message: I18n.t('errors.messages.blank') }

  validates :numberofpeople,
            numericality: { greater_than: -2_147_483_648.0, message: I18n.t('errors.messages.greater_than') }

  validates :numberofpeople, numericality: { less_than: 2_147_483_647.0, message: I18n.t('errors.messages.less_than') }

  validates :describe, length: { maximum: 65_535, message: I18n.t('errors.messages.too_long') }

  accepts_nested_attributes_for :partybookings

  def self.associations
    [:partybookings]
  end

  # jitera-anchor-dont-touch: reset_password

  class << self
  end
end
