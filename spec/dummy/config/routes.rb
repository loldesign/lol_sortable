Dummy::Application.routes.draw do
  mount LolSortable::Engine => '/'

  get 'projects' => 'projects#index'
  get 'profiles' => 'profiles#index'
end
