class AddInfosToProductType < ActiveRecord::Migration[5.1]
  def change
    add_column :product_types, :provider, :string
    add_column :product_types, :os, :string
    add_column :product_types, :language, :string
    add_column :product_types, :screen_type, :string
    add_column :product_types, :color, :string
    add_column :product_types, :resolution, :string
    add_column :product_types, :screen_size, :string
    add_column :product_types, :font_camera, :string
    add_column :product_types, :back_camera, :string
    add_column :product_types, :flash, :string
    add_column :product_types, :video_mode, :string
    add_column :product_types, :video_call, :string
    add_column :product_types, :cpu, :string
    add_column :product_types, :ram, :string
    add_column :product_types, :chipset, :string
    add_column :product_types, :address_memory, :string
    add_column :product_types, :maximum_memory, :string
    add_column :product_types, :built_in_memory, :string
    add_column :product_types, :extra_memory, :string
    add_column :product_types, :weight, :string
    add_column :product_types, :size, :string
    add_column :product_types, :battery_capacity, :string
    add_column :product_types, :c3g, :string
    add_column :product_types, :c4g, :string
    add_column :product_types, :bluetooth, :string
    add_column :product_types, :gprs, :string
    add_column :product_types, :gps, :string
    add_column :product_types, :usb, :string
    add_column :product_types, :sim_card_port, :string
    add_column :product_types, :sim_card, :string
    add_column :product_types, :wifi, :string
    add_column :product_types, :video_player, :string
    add_column :product_types, :mp3_player, :string
    add_column :product_types, :fm_radio, :string
    add_column :product_types, :recoder, :string
  end
end
