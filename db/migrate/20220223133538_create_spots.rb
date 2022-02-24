class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string     :name                , null: false
      t.integer    :score               , null: false
      t.text       :text                , null: false
      t.integer    :genre_id            , null: false
      t.integer    :time_required_id    , null: false
      t.integer    :situation_id        , null: false
      t.integer    :direction_id        , null: false
      t.references :user                , null:false, foreign_key:true
      t.timestamps
    end
  end
end
