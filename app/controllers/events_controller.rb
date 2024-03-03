class EventsController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_user, only: [:edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: [:show]

    def index
        @events = Event.all
        @users = User.all
        # @groups = Group.all
    end

    def new
        @event = Event.new
        @events = Event.all
        @users = User.all
    end

    def create
        event = current_user.events.build(event_params)
        if event.save
            redirect_to user_path(current_user.id)
        else
            redirect_to :action => "new"
        end
    end

    def show
        @event = Event.find(params[:id])
        @events = Event.find_by(id: params[:id])
        # @user = User.find(current_user.id) 
        @users = User.all
        @comment = Comment.new
        @comment2 = Comment.find_by(event_id: params[:id])
        # @comment3 = Comment.find(params[:id])
        @comments = @event.comments
        @comments = Comment.where(event_id: @event)

        # if params[id: @comments.id].present?
            # @comment = Comment.find(params[:comment_id])
        #   else
            # @comment = Comment.new
        #   end

        @choices = Choice.all
        @choice = Choice.new

        # comment = current_user.comments.build(comment_params)
        # if comment.save
            # redirect_to :action => "show"
        # else
            # redirect_to :action => "show"
        # end
    end

    def edit
        @event = Event.find(params[:id])
        @users = User.all
    end

    def update
        event = Event.find(params[:id])
        if event.update(event_params)
            redirect_to :action => "show", :id => event.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        event = Event.find(params[:id])
        event.destroy
        redirect_to user_path(current_user.id)
    end

    private
    def event_params
        params.require(:event).permit(:id, :party_name, :date, :time, :restaurant_name, :fee, :memo, :group_id, :user_id, :url)
    end

    def group_params
        params.require(:group).permit(:name, :introduction)
    end

    def ensure_user
        @events = current_user.events
        @event = @events.find_by(id: params[:id])
        redirect_to new_event_path unless @event
    end

    def login_required
        redirect_to login_path unless current_user
    end

    def comment_params
        params.permit(:content, :attend, :fee_confirm, :participate, :name)
    end
end