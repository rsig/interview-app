Rails.application.routes.draw do

  mount API => '/api'
  root 'api#root'
end
