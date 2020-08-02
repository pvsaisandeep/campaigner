class CampaignShortlist < ApplicationRecord
	has_one :campaign_brief
	has_many :influencers
end
