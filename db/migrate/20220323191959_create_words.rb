class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.string :value
      t.string :language

      t.timestamps
    end
  end
end
