class AddForeignkeysToModels < ActiveRecord::Migration[6.0]
  def change
  	add_reference :campaign_applications, :influencer, index: true, foreign_key: true
  	add_reference :campaign_applications, :campaign, index: true, foreign_key: true
  	add_reference :campaign_shortlists, :campaign, index: true, foreign_key: true
  	add_reference :influencers, :campaign_shortlist, index: true, foreign_key: true
  	add_reference :influnecer_social_accounts, :influencers, index: true, foreign_key: true
  	add_reference :campaign_briefs, :campaign_shortlist, index: true, foreign_key: true
  	add_reference :campaigns, :brand, index: true, foreign_key: true
  end
end
