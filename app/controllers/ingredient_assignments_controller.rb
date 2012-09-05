class IngredientAssignmentsController < ApplicationController
  # GET /ingredient_assignments
  # GET /ingredient_assignments.json
  def index
    @ingredient_assignments = IngredientAssignment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ingredient_assignments }
    end
  end

  # GET /ingredient_assignments/1
  # GET /ingredient_assignments/1.json
  def show
    @ingredient_assignment = IngredientAssignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ingredient_assignment }
    end
  end

  # GET /ingredient_assignments/new
  # GET /ingredient_assignments/new.json
  def new
    @ingredient_assignment = IngredientAssignment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ingredient_assignment }
    end
  end

  # GET /ingredient_assignments/1/edit
  def edit
    @ingredient_assignment = IngredientAssignment.find(params[:id])
  end

  # POST /ingredient_assignments
  # POST /ingredient_assignments.json
  def create
    @ingredient_assignment = IngredientAssignment.new(params[:ingredient_assignment])

    respond_to do |format|
      if @ingredient_assignment.save
        format.html { redirect_to @ingredient_assignment, notice: 'Ingredient assignment was successfully created.' }
        format.json { render json: @ingredient_assignment, status: :created, location: @ingredient_assignment }
      else
        format.html { render action: "new" }
        format.json { render json: @ingredient_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ingredient_assignments/1
  # PUT /ingredient_assignments/1.json
  def update
    @ingredient_assignment = IngredientAssignment.find(params[:id])

    respond_to do |format|
      if @ingredient_assignment.update_attributes(params[:ingredient_assignment])
        format.html { redirect_to @ingredient_assignment, notice: 'Ingredient assignment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ingredient_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredient_assignments/1
  # DELETE /ingredient_assignments/1.json
  def destroy
    @ingredient_assignment = IngredientAssignment.find(params[:id])
    @ingredient_assignment.destroy

    respond_to do |format|
      format.html { redirect_to ingredient_assignments_url }
      format.json { head :ok }
    end
  end
end
