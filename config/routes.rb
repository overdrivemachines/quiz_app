# == Route Map
#
#             Prefix Verb   URI Pattern                                      Controller#Action
#     quiz_questions GET    /quizzes/:quiz_id/questions(.:format)            questions#index
#                    POST   /quizzes/:quiz_id/questions(.:format)            questions#create
#  new_quiz_question GET    /quizzes/:quiz_id/questions/new(.:format)        questions#new
# edit_quiz_question GET    /quizzes/:quiz_id/questions/:id/edit(.:format)   questions#edit
#      quiz_question GET    /quizzes/:quiz_id/questions/:id(.:format)        questions#show
#                    PATCH  /quizzes/:quiz_id/questions/:id(.:format)        questions#update
#                    PUT    /quizzes/:quiz_id/questions/:id(.:format)        questions#update
#                    DELETE /quizzes/:quiz_id/questions/:id(.:format)        questions#destroy
#   quiz_submissions POST   /quizzes/:quiz_id/quiz_submissions(.:format)     quiz_submissions#create
#    quiz_submission GET    /quizzes/:quiz_id/quiz_submissions/:id(.:format) quiz_submissions#show
#            quizzes GET    /quizzes(.:format)                               quizzes#index
#                    POST   /quizzes(.:format)                               quizzes#create
#           new_quiz GET    /quizzes/new(.:format)                           quizzes#new
#          edit_quiz GET    /quizzes/:id/edit(.:format)                      quizzes#edit
#               quiz GET    /quizzes/:id(.:format)                           quizzes#show
#                    PATCH  /quizzes/:id(.:format)                           quizzes#update
#                    PUT    /quizzes/:id(.:format)                           quizzes#update
#                    DELETE /quizzes/:id(.:format)                           quizzes#destroy
#               root GET    /                                                quizzes#index

Rails.application.routes.draw do
  devise_for :users
  resources :quizzes do
    resources :questions
    resources :quiz_submissions, only: [:show, :create], as: "submissions"
  end
  root "quizzes#index"
end
