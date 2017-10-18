class Review < ActiveRecord::Base
  belongs_to :provider
  belongs_to :client
  validates :rating, numericality: {only_integer: true},
                     inclusion: {in: 1..5}
end
