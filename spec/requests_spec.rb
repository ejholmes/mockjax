require 'spec_helper'

describe "Requests", :type => :feature do
  describe "mockjax helper" do
    before do
      mockjax url: '/api/foo', responseText: { message: 'bar' }
    end

    it "mocks the request" do
      visit '/foo'
      page.should have_content 'bar'
    end
  end

  describe "stub_ajax helper" do
    before do
      stub_ajax url: '/api/foo', responseText: { message: 'bar' }
    end

    it "mocks the request" do
      visit '/foo'
      page.should have_content 'bar'
    end
  end
end
