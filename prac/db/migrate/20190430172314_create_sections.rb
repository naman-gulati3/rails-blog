class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :article, index: true, foreign_key: true
      t.text :body
    end
  end
end
