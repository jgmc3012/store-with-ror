Rails.application.routes.draw do
  get 'home/grettings'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '(:locale)', locale: /en|es/ do
    
  end
end
