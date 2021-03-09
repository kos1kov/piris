class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :surname
      t.string :name
      t.string :secondname
      t.date :borndate
      t.boolean :sex
      t.string :passportserial
      t.string :passportnum
      t.string :issuebody
      t.date :dateissue
      t.string :identnum
      t.string :bornissue
      t.string :factcity
      t.string :factadress
      t.string :homephone
      t.string :phone
      t.string :email
      t.string :regaddress
      t.string :materialstatus
      t.string :citizenship
      t.string :disability
      t.boolean :pensioner
      t.integer :monthincome

      t.timestamps
    end
  end
end
