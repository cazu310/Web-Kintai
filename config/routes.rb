Rails.application.routes.draw do
  root 'sessions#new'

  resources :employees
  resources :sessions, only: [:new, :create ,:destroy]
  resources :attendances, only: [:create]  # AttendancesControllerに関するルートを追加
  delete '/logout', to: 'sessions#destroy', as: :logout
  resources :employees do
    member do
      put 'update_attendance'  
      get 'salary_statement'  # 給与明細表示用のルート
    end
  end
end
