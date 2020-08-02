class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
    	t.column :name, :string, :limit => 100, :null => false
    	t.column :about, :text
    	t.column :start_time, :datetime, :null => false
    	t.column :end_time, :datetime, :null => false
    	t.column :campaign_active, :boolean, :default => false
      	t.timestamps
    end
  end
end
