class ChoicesController < ApplicationController
    def new
        @choice = Choice.new
        @choices = Choice.all
    end

    def create
        @choice = Choice.new(choice_params)
        if @choice.save
            flash[:success] = "追加しました"
            redirect_back(fallback_location: root_path) #直前のページにリダイレクト
        else
            flash[:success] = "追加できませんでした"
            redirect_back(fallback_location: root_path) #直前のページにリダイレクト
        end
    end

    private
    def choice_params
        params.require(:choice).permit(:category)
    end
end
