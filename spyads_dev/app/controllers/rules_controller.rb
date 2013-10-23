class RulesController < ApplicationController
  # GET /rules
  # GET /rules.json
  def index
    @ruleset = Ruleset.find_by_id(params[:ruleset_id])
    @rules = @ruleset.rules

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rules }
    end
  end

  # GET /rules/1
  # GET /rules/1.json
  def show
    @ruleset = Ruleset.find_by_id(params[:ruleset_id])
    @rule = @ruleset.rules.find_by_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rule }
    end
  end

  # GET /rulesets/1/rules/new
  # GET /rulesets/1/rules/new.json
  def new
    @ruleset = Ruleset.find(params[:ruleset_id])
    @rule = @ruleset.rules.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rule }
    end
  end

  # GET /rules/1/edit
  def edit
    @ruleset = Ruleset.find(params[:ruleset_id])
    @rule = @ruleset.rules.find(params[:id])
  end

  # POST /rules
  # POST /rules.json
  def create
    @ruleset = Ruleset.find(params[:ruleset_id])
    @rule = @ruleset.rules.build(params[:rule])

    respond_to do |format|
      if @rule.save
        format.html { redirect_to [@ruleset, @rule], notice: 'Rule was successfully created.' }
        format.json { render json: @rule, status: :created, location: @rule }
      else
        format.html { render action: "new" }
        format.json { render json: @rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rules/1
  # PUT /rules/1.json
  def update
    @ruleset = Ruleset.find(params[:ruleset_id])
    @rule = @ruleset.rules.find(params[:id])

    respond_to do |format|
      if @rule.update_attributes(params[:rule])
        format.html { redirect_to [@ruleset, @rule], notice: 'Rule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rules/1
  # DELETE /rules/1.json
  def destroy
    @ruleset = Ruleset.find(params[:ruleset_id])
    @rule = @ruleset.rules.find(params[:id])
    @rule.destroy

    respond_to do |format|
      format.html { redirect_to ruleset_rules_url(@ruleset) }
      format.json { head :no_content }
    end
  end
end
