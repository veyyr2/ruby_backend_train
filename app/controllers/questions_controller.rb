class QuestionsController < ApplicationController    
    # автоматизация
    before_action :set_question, only: %i[update show destroy edit] # использовать функцию set_question и вставить в функции update, show, destroy, edit её кусочек кода

    def create
        # создаём вопрос, с помощью функции в private под именем question_params
        question = Question.create(question_params)

        # переместить пользователя на вопрос. В notice используется flash, чтобы уведомить пользователя.
        redirect_to question_path(question), notice: 'Вы успешно создали вопрос!'
    end

    # обновить вопрос от edit
    def update 
        # обновляем с помощью функции в private под именем question_params 
        @question.update(question_params)

        # перенаправляем. В notice используется flash, чтобы уведомить пользователя.
        redirect_to question_path(@question), notice: 'Вы успешно обновили вопрос!'
    end

    def destroy
        # удаляем
        @question.destroy

        # перенаправить на список вопросов. В notice используется flash, чтобы уведомить пользователя.
        redirect_to questions_path, notice: 'Вы удалили вопрос.'
    end

    # показать один вопрос
    def show
    end 

    # список вопросов
    def index 
        @questions = Question.all
        @question = Question.new
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