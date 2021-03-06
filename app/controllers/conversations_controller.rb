class ConversationsController < ApplicationController
  
  def complete # This is a toggle
    @conversation = Conversation.find(params[:id])
    @team = Team.find(params[:team])
    
    unless @conversation.is_done?
      @conversation.update_attributes(:done => true)
      flash[:notice] = "The conversation has been marked complete"
    else
      @conversation.update_attributes(:done => false)
      flash[:notice] = "The conversation has been marked in progress"
    end
    redirect_to @team
  end

  # GET /conversations
  # GET /conversations.json
  def index
    @conversations = Conversation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @conversations }
    end
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
    @conversation = Conversation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @conversation }
    end
  end

  # GET /conversations/new
  # GET /conversations/new.json
  def new
    unless current_user.teams.empty?
      @conversation = Conversation.new
      @conversation.tutorial_id = params[:tutorial]
      @conversation.team = current_user.teams.last

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @conversation }
      end
    else
      flash[:error] = "You'll need to join or create a team first!"
      redirect_to teams_path
    end 
  end

  # GET /conversations/1/edit
  def edit
    @conversation = Conversation.find(params[:id])
  end

  # POST /conversations
  # POST /conversations.json
  def create
    @conversation = Conversation.new(params[:conversation])

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to @conversation, notice: 'Conversation was successfully created.' }
        format.json { render json: @conversation, status: :created, location: @conversation }
      else
        format.html { render action: "new" }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /conversations/1
  # PUT /conversations/1.json
  def update
    @conversation = Conversation.find(params[:id])

    respond_to do |format|
      if @conversation.update_attributes(params[:conversation])
        format.html { redirect_to @conversation, notice: 'Conversation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversations/1
  # DELETE /conversations/1.json
  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy

    respond_to do |format|
      format.html { redirect_to tutorials_url }
      format.json { head :no_content }
    end
  end
end
