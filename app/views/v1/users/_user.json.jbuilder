json.extract! user, :id, :email, :created_at, :updated_at, :birthdate
json.store do
    json.partial! 'v1/store/store', store: user.store
end
