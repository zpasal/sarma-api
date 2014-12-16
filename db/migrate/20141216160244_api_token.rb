class ApiToken < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string  :api_token
    end
  end
end
