class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user, null: false
      t.string :title

      t.timestamps
    end
  end
end
