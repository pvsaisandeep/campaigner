Rails.application.routes.draw do
  #brand routes
  post '/brand/new', to: 'brand#new_brand'
  patch '/brand/update', to: 'brand#update_brand'
  get '/brand/all', to: 'brand#brand_list'
  delete '/brand/delete/:id', to: 'brand#delete_brand'


  #influencer roots
  post '/influencer/new', to: 'influencer#new_influencer'
  patch '/influencer/update', to: 'influencer#update_influencer'
  get '/influencer/all', to: 'influencer#influencer_list'
  delete '/influencer/delete/:id', to: 'influencer#delete_influencer'
end
