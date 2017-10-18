class Site < ActiveRecord::Base
  has_one :site_fund
  has_many :site_proceeds
  validates :first_name, presence: true, length: {minimum:2, maximum: 50}
  validates :last_name, presence: true, length: {minimum:2, maximum: 50}
  validates :address1, presence: true
  validates :city, presence: true
  validates_format_of :city, with: ->(client) {/\A[a-zA-Z ]*\z/i}
  validates :state, presence: true
  validates :zip, presence: true, length: {is:5}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_acceptance_of :terms_of_service, acceptance: true
  include Humanizer
  attr_accessor :bypass_humanizer
  require_human_on :create, unless: :bypass_humanizer
  include ActionView::Helpers::NumberHelper
  before_save :run_formatters

  private
  def run_formatters
    self.first_name = self.first_name.titleize
    self.last_name = self.last_name.titleize
    self.phone = number_to_phone(self.phone, area_code: true)
    self.address1 = self.address1.titleize
    self.city = self.city.titleize
    self.state = self.state.upcase
  end
  
  
end
