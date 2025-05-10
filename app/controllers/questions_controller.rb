class QuestionsController < ApplicationController
    def create
        # создаём вопрос, передавая параметры через params
        Question.create body: params[:question][:body], user_id: params[:question][:user_id]

        # переместить пользователя на главный сайт. Слеш - это и есть главная страница.
        redirect_to '/'
    end

    def update 
        # сначала находим
        @question = Question.find(params[:id])

        # обновляем
        @question = Question.update(
            body: params[:question][:body],
            user_id: params[:question][:user_id]
        )
    end

    def destroy
        # сначала находим
        @question = Question.find(params[:id])

        # удаляем
        @question = Question.destroy
    end

    def show
        # сначала находим
        @question = Question.find(params[:id])
    end 

    def index 
        @questions = Question.all
    end
end
