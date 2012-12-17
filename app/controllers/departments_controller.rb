class DepartmentsController < ApplicationController
  # GET /departments
  # GET /departments.json
  def index
    @company = Company.find(params[:company_id])
    @departments = @company.departments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @departments }
    end
  end

  def show
    @company = Company.find(params[:company_id])
    @department = Department.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @department }
    end
  end

  def new
    @company = Company.find(params[:company_id])
    @department = @company.departments.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @department }
    end
  end

  def edit
    @department = Department.find(params[:id])
  end

  def create
    @company = Company.find(params[:company_id])
    @department = @company.departments.new(params[:department])

    respond_to do |format|
      if @department.save
        format.html { redirect_to(company_departments_path, :notice => t("activerecord.notice.create", :model => @department.class.model_name.human)) }
        format.json { render json: @department, status: :created, location: @department }
      else
        format.html { render action: "new" }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @department = Department.find(params[:id])

    respond_to do |format|
      if @department.update_attributes(params[:department])
        format.html { redirect_to @department, notice: 'department was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy

    respond_to do |format|
      format.html { redirect_to departments_url }
      format.json { head :ok }
    end
  end
end