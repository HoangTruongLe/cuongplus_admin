class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :attn_if_any
      t.datetime :dob
      t.integer :gender, default: 0
      t.string :tax_file_number
      t.string :confirm_email
      t.string :email
      t.string :phone
      t.string :residental_address
      t.string :residental_suburb
      t.string :residental_state
      t.string :residental_postcode
      t.string :residental_country
      t.integer :postal, default: 1
      t.string :postal_address
      t.string :postal_suburb
      t.string :postal_state
      t.string :postal_postcode
      t.string :postal_country
      t.integer :preferred_contact_method, default: 1
      t.string :id_type
      t.string :number
      t.string :source

      t.timestamps
    end
  end
end
