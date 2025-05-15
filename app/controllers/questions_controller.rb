class QuestionsController < ApplicationController    
    def create
        # создаём вопрос, передавая параметры через params
        @question = Question.create body: params[:question][:body], user_id: params[:question][:user_id]

        # переместить пользователя на вопрос.
        redirect_to (@question)
    end

    # обновить вопрос от edit
    def update 
        # сначала находим
        @question = Question.find(params[:id])

        # обновляем
        @question.update(
            body: params[:question][:body],
            user_id: params[:question][:user_id]
        )

        # перенаправляем
        redirect_to question_path(@question)
    end

    def destroy
        # сначала находим
        @question = Question.find(params[:id])

        # удаляем
        @question = Question.destroy
    end

    # показать один вопрос
    def show
        # сначала находим
        @question = Question.find(params[:id])
    end 

    # список вопросов
    def index 
        @questions = Question.all
    end

    # создать вопрос в форме
    def new 
        @question = Question.new
    end

    # редактировать вопрос
    def edit 
        @question = Question.find(params[:id]) 
    end
end
