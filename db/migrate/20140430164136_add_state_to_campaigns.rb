class AddStateToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :state, :string
    # Campaign.reset_column_information
    # Campaign.update_all(state: :draft)
    add_index :campaigns, :state
  end
end
