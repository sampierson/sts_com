require 'spec_helper'

describe HomeController do
  describe "#index" do
    it "should render the index template" do
      get :index
      response.should be_ok
      response.should render_template('index')
    end
  end
end