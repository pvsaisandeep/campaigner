class CreateCampaignApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :campaign_applications do |t|
    	t.timestamps
    end
  end
end
