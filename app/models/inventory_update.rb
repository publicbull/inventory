class InventoryUpdate < ApplicationRecord
  belongs_to :product

  after_create :run_update

  def inventory_item_id
    product.shopify_datum.inventory_item_id
  end

  private
    def run_update
      ShopifyClient.adjust_inventory(inventory_item_id)
    end
end

# == Schema Information
#
# Table name: inventory_updates
#
#  id         :bigint(8)        not null, primary key
#  product_id :integer
#  adjustment :integer
#  prior_qty  :integer
#  vend_qty   :integer
#