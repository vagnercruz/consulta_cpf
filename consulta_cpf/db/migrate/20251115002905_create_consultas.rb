class CreateConsultas < ActiveRecord::Migration[8.1]
  def change
    create_table :consultas do |t|
      t.string :cpf
      t.boolean :valido
      t.datetime :data

      t.timestamps
    end
  end
end
