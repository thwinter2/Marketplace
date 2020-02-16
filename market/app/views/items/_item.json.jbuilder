json.extract! item, :id, :unique_id, :name, :brand, :category, :description, :image, :special_item, :age_restricted, :quantity, :cost, :tax_slab, :views_count, :created_at, :updated_at
json.url item_url(item, format: :json)
