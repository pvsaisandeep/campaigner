class CreateCampaignShortlists < ActiveRecord::Migration[6.0]
  def change
    create_table :campaign_shortlists do |t|
    	t.timestamps
    end
  end
end
