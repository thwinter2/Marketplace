json.extract! purchase_history, :id, :created_at, :updated_at
json.url purchase_history_url(purchase_history, format: :json)
