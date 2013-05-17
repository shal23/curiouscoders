class TutorialsController < ApplicationController
  # GET /tutorials
  # GET /tutorials.json
  def index
   @tutorials = Tutorial.all
      # @tutorial = @user.tutorials.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tutorials }
    end
  end

  # GET /tutorials/1
  # GET /tutorials/1.json
  def show
   # @tutorial = Tutorial.find(params[:id])
      @tutorial = Tutorial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tutorial }
    end
  end

  # GET /tutorials/new
  # GET /tutorials/new.json
  def new
    @tutorial = Tutorial.new
      #@tutorial = @user.tutorials.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tutorial }
    end
  end

  # GET /tutorials/1/edit
  def edit
    @tutorial = Tutorial.find(params[:id])
  end

  # POST /tutorials
  # POST /tutorials.json
  def create
    @tutorial = Tutorial.new(params[:tutorial])
    #@tutorial = @user.tutorials.build(params[:tutorial])
    @tutorial.user = current_user

    respond_to do |format|
      if @tutorial.save
        format.html { redirect_to @tutorial, notice: 'Tutorial was successfully created.' }
        format.json { render json: @tutorial, status: :created, location: @tutorial }
      else
        format.html { render action: "new" }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tutorials/1
  # PUT /tutorials/1.json
  def update
    @tutorial = Tutorial.find(params[:id])

    respond_to do |format|
      if @tutorial.update_attributes(params[:tutorial])
        format.html { redirect_to @tutorial, notice: 'Tutorial was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  def tagged
    if params[:tag].present? 
      @tutorials = Tutorial.tagged_with(params[:tag])
    else 
      @tutorials = Tutorial.tutorialall
  end  
end

  # DELETE /tutorials/1
  # DELETE /tutorials/1.json
  def destroy
    @tutorial = Tutorial.find(params[:id]) 
    #authorize! :destroy, @user, :message => 'Not authorized as an administrator'
    #tutorial = tutorials.find(params[:id])
    @tutorial.destroy

    respond_to do |format|
      format.html { redirect_to tutorials_url }
      format.json { head :no_content }
    end
  end

end