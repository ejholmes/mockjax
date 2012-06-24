require 'spec_helper'

describe "Requests", :type => :request do
  before do
    mockjax url: '/api/foo', responseText: { message: 'bar' }
  end

  it "mocks the request" do
    visit '/foo'
    page.should have_content 'bar'
  end
end
