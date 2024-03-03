class CommentsController < ApplicationController

    def create
        event = Event.find(params[:event_id])

        comment = event.comments.build(comment_params) #buildを使い、contentとevent_idの二つを同時に代入
        # comment.user_id = current_user.id
        if comment.save
            flash[:success] = "コメントしました"
            redirect_back(fallback_location: root_path) #直前のページにリダイレクト
        else
            flash[:success] = "コメントできませんでした"
            redirect_back(fallback_location: root_path) #直前のページにリダイレクト
        end
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        comment = Comment.find(params[:id])
        if comment.update(comment_params)
            redirect_to event_path(id: comment.event_id)
        else
            redirect_to users_show_path
        end

        # respond_to do |format|
            # if @comment.update(comment_params)
                # format.html { redirect_to request.referer, notice: 'comment was successfully updated.' }
                # format.json { render :events_show, status: :ok, location: @comment }
            # else
                # format.html { render :edit }
                # format.json { render json: @comment.errors, status: :unprocessable_entity }
            # end
        # end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        redirect_back(fallback_location: root_path)
    end

    private
    def comment_params
        params.require(:comment).permit(:content, :attend, :fee_confirm, :participate, :name, :event_id)
    end

    def ensure_user
        @events = current_user.events
        @event = @events.find_by(id: params[:id])
        redirect_to new_event_path unless @event
    end

    def login_required
        redirect_to login_path unless current_user
    end
    
end