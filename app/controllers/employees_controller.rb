class EmployeesController < ApplicationController
   
  # GET /company/employees
  # GET /employees.xml
  def index
    @company = Company.find(params[:company_id])
    @employees = @company.employees.search_significant_fields(params[:search])
begin
    CUSTOM_LOGGER.info(params[:search])
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "The object you tried to access does not exist"
    redirect_to :action => 'index'
end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @employees }
      format.js
    end
  end

  # GET /employees/1
  # GET /employees/1.xml
  def show
    @company = Company.find(params[:company_id])
    @employee = @company.employees.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employee }
    end
  end

  # GET /employees/new
  # GET /employees/new.xml
  def new
    @company = Company.find(params[:company_id])
    @employee = @company.employees.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employee }
    end
  end

  # GET /employees/1/edit
  def edit
    @company = Company.find(params[:company_id])
    @employee = @company.employees.find(params[:id])
  end

  # POST /employees
  # POST /employees.xml
  def create
    @company = Company.find(params[:company_id])
    @employee = @company.employees.new(params[:employee])

    respond_to do |format|
      if @employee.save
        format.html { redirect_to(company_employees_path, :notice => t("activerecord.notice.create", :model => @employee.class.model_name.human)) }
        format.xml  { render :xml => @employee, :status => :created, :location => @employee }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /employees/1
  # PUT /employees/1.xml
  def update
    @company = Company.find(params[:company_id])
    @employee = @company.employees.find(params[:id])

    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to(company_employee_path(@company, @employee), :notice => t("activerecord.notice.update", :model => @employee.class.model_name.human)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.xml
  def destroy
    @company = Company.find(params[:company_id])
    @employee = @company.employees.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to(company_employees_url) }
      format.xml  { head :ok }
    end
  end
  
end
