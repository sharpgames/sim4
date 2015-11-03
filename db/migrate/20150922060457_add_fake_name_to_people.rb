class AddFakeNameToPeople < ActiveRecord::Migration
  def change
    add_column :people, :fake_name, :string
  end
end
