class QuestionsController < ApplicationController    
    # автоматизация
    before_action :set_question, only: %i[update show destroy edit] # использовать функцию set_question и вставить в функции update, show, destroy, edit её кусочек кода

    def create
        # создаём вопрос, с помощью функции в private под именем question_params
        question = Question.create(question_params)

        # переместить пользователя на вопрос.
        redirect_to (question)
    end

    # обновить вопрос от edit
    def update 
        # сначала находим

        # обновляем с помощью функции в private под именем question_params 
        @question.update(question_params)

        # перенаправляем
        redirect_to question_path(@question)
    end

    def destroy
        # удаляем
        @question.destroy

        # перенаправить на список вопросов
        redirect_to questions_path
    end

    # показать один вопрос
    def show
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
    end

    # вспомогательные функции только для контроллера
    private

    # параметры для изменения
    def question_params
        params.require(:question).permit(:body, :user_id) # в permit указываем какие параметры мы можем изменить
    end

    # функция для автоматизации (найти вопрос)
    def set_question
        @question = Question.find(params[:id])
    end
end