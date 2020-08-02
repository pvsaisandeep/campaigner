class CreateCampaignBriefs < ActiveRecord::Migration[6.0]
  def change
    create_table :campaign_briefs do |t|

      t.timestamps
    end
  end
end
