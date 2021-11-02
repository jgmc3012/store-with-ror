json.extract! user, :id, :email, :created_at, :updated_at, :birthdate
json.store do
    json.partial! 'v1/store/store', store: user.store
end
json.token do
    json.partial! 'v1/tokens/token', token: @token
end