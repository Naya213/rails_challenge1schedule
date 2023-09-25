class CreatePlan < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :title
      t.date :start_day
      t.date :finish_day
      t.boolean :all_day
      t.string :memo

      t.timestamps
    end
  end
end
