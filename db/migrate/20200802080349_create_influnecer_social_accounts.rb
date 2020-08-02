class CreateInflunecerSocialAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :influnecer_social_accounts do |t|
    	t.column :platform, :string, :null => false
    	t.column :link, :string
    	t.timestamps
    end
  end
end
