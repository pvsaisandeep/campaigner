class Campaign < ApplicationRecord
	belongs_to :brand
	has_many :campaign_shortlists
	has_many :campaign_applications
end
