class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      	t.column :name, :string, :limit => 100, :null => false
        t.column :email, :string
        t.column :phone, :string
        t.column :about, :text
        t.column :website, :string
        t.timestamps
    end
  end
end
