class Influencer < ApplicationRecord
	has_many :influencer_social_accounts
	has_many :campaign_applications
end
