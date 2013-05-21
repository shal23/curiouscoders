class TeamsController < ApplicationController

  def join
    @team = Team.find(params[:id])
    @user = User.find(params[:user])

    if not @user.is_member?(@team)
      @team.users << @user
      flash[:notice] = "You have been added to the team"
    else
      flash[:error] = "You are already in this team"
    end
    redirect_to @team
  end

  def leave
    @user = User.find(params[:user])
    @team = Team.find(params[:id])
    
    if @user.is_member?(@team)
      logger.info "Removing user from team #{@team.id}"
      @user.teams.delete(@team)
      flash[:notice] = "You have left the team"
    else
      flash[:error] = "You are not in this team"
    end
    redirect_to @team
  end

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teams }
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find(params[:id])
    authorize! :read, @team, :message => 'Not authorized to do this action.'

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/new
  # GET /teams/new.json
  def new
    @team = Team.new
    authorize! :manage, @team, :message => 'Not authorized to do this action.'
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/1/edit
  def edit
    @user = current_user #
    @team = Team.find(params[:id])
    
    if @team.has_creator?(@user)
      authorize! :edit, @team, :message => 'Not authorized to do this action.'
    else
      flash[:error] = "Only the team creator can edit team profile"
      redirect_to @team
    end
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(params[:team])

    @team.users << current_user
    @team.creator = current_user.id

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render json: @team, status: :created, location: @team }
      else
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teams/1
  # PUT /teams/1.json
  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @user = current_user
    @team = Team.find(params[:id])
    if @team.has_creator?(@user)
      authorize! :manage, @team, :message => 'Not authorized to do this action.'
      @team.destroy

      respond_to do |format|
        format.html { redirect_to teams_url }
        format.json { head :no_content }
      end
    else
      flash[:error] = "Only the team creator can delete the team"
      redirect_to @team
    end
  end
end
