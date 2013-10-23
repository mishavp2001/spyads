class RulesetsController < ApplicationController
  # GET /rulesets
  # GET /rulesets.json
  def index
    @rulesets = Ruleset.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rulesets }
    end
  end

  # GET /rulesets/1
  # GET /rulesets/1.json
  def show
    @ruleset = Ruleset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ruleset }
    end
  end

  # GET /rulesets/new
  # GET /rulesets/new.json
  def new
    @ruleset = Ruleset.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ruleset }
    end
  end

  # GET /rulesets/1/edit
  def edit
    @ruleset = Ruleset.find(params[:id])
  end

  # POST /rulesets
  # POST /rulesets.json
  def create
    @ruleset = Ruleset.new(params[:ruleset])

    respond_to do |format|
      if @ruleset.save
        format.html { redirect_to @ruleset, notice: 'Ruleset was successfully created.' }
        format.json { render json: @ruleset, status: :created, location: @ruleset }
      else
        format.html { render action: "new" }
        format.json { render json: @ruleset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rulesets/1
  # PUT /rulesets/1.json
  def update
    @ruleset = Ruleset.find(params[:id])

    respond_to do |format|
      if @ruleset.update_attributes(params[:ruleset])
        format.html { redirect_to @ruleset, notice: 'Ruleset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ruleset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rulesets/1
  # DELETE /rulesets/1.json
  def destroy
    @ruleset = Ruleset.find(params[:id])
    @ruleset.destroy

    respond_to do |format|
      format.html { redirect_to rulesets_url }
      format.json { head :no_content }
    end
  end
end
