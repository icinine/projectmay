class DeptsController < ApplicationController
  before_action :set_dept, only: [:show, :edit, :update, :destroy]

  # GET /depts
  # GET /depts.json
  def index
    @depts = Dept.all
  end

  # GET /depts/1
  # GET /depts/1.json
  def show
  end

  # GET /depts/new
  def new
    @dept = Dept.new
  end

  # GET /depts/1/edit
  def edit
  end

  # POST /depts
  # POST /depts.json
  def create
    @dept = Dept.new(dept_params)

    respond_to do |format|
      if @dept.save
        format.html { redirect_to @dept, notice: 'Dept was successfully created.' }
        format.json { render :show, status: :created, location: @dept }
      else
        format.html { render :new }
        format.json { render json: @dept.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /depts/1
  # PATCH/PUT /depts/1.json
  def update
    respond_to do |format|
      if @dept.update(dept_params)
        format.html { redirect_to @dept, notice: 'Dept was successfully updated.' }
        format.json { render :show, status: :ok, location: @dept }
      else
        format.html { render :edit }
        format.json { render json: @dept.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /depts/1
  # DELETE /depts/1.json
  def destroy
    @dept.destroy
    respond_to do |format|
      format.html { redirect_to depts_url, notice: 'Dept was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dept
      @dept = Dept.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dept_params
      params.require(:dept).permit(:name)
    end
end
