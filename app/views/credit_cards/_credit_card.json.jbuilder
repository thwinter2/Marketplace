json.extract! credit_card, :id, :user_id, :card_name, :card_num, :card_experation, :card_cvv, :created_at, :updated_at
json.url credit_card_url(credit_card, format: :json)
