Rails.application.routes.draw do
  post 'sortable' => 'sortable#prioritize', as: :sortable
end
