require 'spec_helper'

describe EmployeesController do
  
  describe "GET index" do  
    it "should login with basic HTTP authentication" do
        request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("elenco:stayokay")
        get 'index', :locale => 'nl'
        response.should be_success
    end
  end

end
