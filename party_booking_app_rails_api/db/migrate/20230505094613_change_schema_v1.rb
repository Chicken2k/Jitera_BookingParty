class ChangeSchemaV1 < ActiveRecord::Migration[6.0]
  def change
  
  
    create_table :parties do |t|
      t.string :nameparty, default: '', null: false
      t.datetime :partystarttime, null: false
      t.text :describe
      t.integer :isstatus, default: 0
      t.integer :numberofpeople
      t.text :partylocation, null: false
      t.timestamps null: false
    end
  
    create_table :partybookings do |t|
      t.timestamps null: false
    end
  
    create_table :users do |t|
      t.datetime :last_sign_in_at
      t.string :confirmation_token
      t.string :username, default: '', null: false
      t.string :last_sign_in_ip
      t.datetime :confirmation_sent_at
      t.integer :sign_in_count, default: 0, null: false
      t.string :encrypted_password, default: '', null: false
      t.string :reset_password_token
      t.string :unlock_token
      t.string :name, default: '', null: false
      t.string :password_confirmation
      t.integer :failed_attempts, default: 0, null: false
      t.boolean :isactive
      t.datetime :confirmed_at
      t.datetime :reset_password_sent_at
      t.datetime :current_sign_in_at
      t.datetime :remember_created_at
      t.string :unconfirmed_email
      t.datetime :dateofbirth
      t.string :email, default: '', null: false
      t.text :password, null: false
      t.datetime :locked_at
      t.string :current_sign_in_ip
      t.timestamps null: false
    end
  
    create_table :admins do |t|
      t.string :unconfirmed_email
      t.string :password_confirmation
      t.datetime :confirmation_sent_at
      t.string :password
      t.datetime :current_sign_in_at
      t.string :encrypted_password, default: '', null: false
      t.integer :failed_attempts, default: 0, null: false
      t.datetime :last_sign_in_at
      t.integer :sign_in_count, default: 0, null: false
      t.string :email, default: '', null: false
      t.string :reset_password_token
      t.datetime :remember_created_at
      t.string :confirmation_token
      t.datetime :reset_password_sent_at
      t.string :unlock_token
      t.string :current_sign_in_ip
      t.string :name, default: '', null: false
      t.datetime :confirmed_at
      t.string :last_sign_in_ip
      t.datetime :locked_at
      t.timestamps null: false
    end
  
    add_reference :partybookings, :party, foreign_key: true
  
    add_reference :partybookings, :user, foreign_key: true
  
    add_reference :parties, :admin, foreign_key: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token, unique: true
    add_index :users, :unlock_token, unique: true
    add_index :users, :unconfirmed_email, unique: true
    add_index :users, :email, unique: true
    add_index :admins, :unconfirmed_email, unique: true
    add_index :admins, :email, unique: true
    add_index :admins, :reset_password_token, unique: true
    add_index :admins, :confirmation_token, unique: true
    add_index :admins, :unlock_token, unique: true
  end
end
