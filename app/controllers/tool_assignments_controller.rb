class ToolAssignmentsController < ApplicationController
  # GET /tool_assignments
  # GET /tool_assignments.json
  def index
    @tool_assignments = ToolAssignment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tool_assignments }
    end
  end

  # GET /tool_assignments/1
  # GET /tool_assignments/1.json
  def show
    @tool_assignment = ToolAssignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tool_assignment }
    end
  end

  # GET /tool_assignments/new
  # GET /tool_assignments/new.json
  def new
    @tool_assignment = ToolAssignment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tool_assignment }
    end
  end

  # GET /tool_assignments/1/edit
  def edit
    @tool_assignment = ToolAssignment.find(params[:id])
  end

  # POST /tool_assignments
  # POST /tool_assignments.json
  def create
    @tool_assignment = ToolAssignment.new(params[:tool_assignment])

    respond_to do |format|
      if @tool_assignment.save
        format.html { redirect_to @tool_assignment, notice: 'Tool assignment was successfully created.' }
        format.json { render json: @tool_assignment, status: :created, location: @tool_assignment }
      else
        format.html { render action: "new" }
        format.json { render json: @tool_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tool_assignments/1
  # PUT /tool_assignments/1.json
  def update
    @tool_assignment = ToolAssignment.find(params[:id])

    respond_to do |format|
      if @tool_assignment.update_attributes(params[:tool_assignment])
        format.html { redirect_to @tool_assignment, notice: 'Tool assignment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @tool_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tool_assignments/1
  # DELETE /tool_assignments/1.json
  def destroy
    @tool_assignment = ToolAssignment.find(params[:id])
    @tool_assignment.destroy

    respond_to do |format|
      format.html { redirect_to tool_assignments_url }
      format.json { head :ok }
    end
  end
end
