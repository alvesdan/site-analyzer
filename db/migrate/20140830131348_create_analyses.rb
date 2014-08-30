class CreateAnalyses < ActiveRecord::Migration
  def change
    create_table :analyses do |t|
      t.string :url
      t.string :shortened_url
      t.timestamps
    end

    add_index :analyses, :shortened_url, unique: true
  end
end
