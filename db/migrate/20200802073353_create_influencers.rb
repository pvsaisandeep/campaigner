class CreateInfluencers < ActiveRecord::Migration[6.0]
  def change
    create_table :influencers do |t|
    	t.column :first_name, :string, :null => false
    	t.column :last_name, :string, :null => false
    	t.column :middle_name, :string
    	t.column :email, :string
    	t.column :phone, :string
    	t.column :gender, :string
    	t.column :dob, :date
    	t.column :bio, :text
    	t.column :location, :text
        t.timestamps
    end
  end
end
