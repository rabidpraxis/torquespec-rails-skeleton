require 'spec_helper'

describe "basic test with heredoc" do

  deploy <<-DD_END.gsub(/^ {4}/,'')
    application:
      root: #{File.dirname(__FILE__)}/..
      env: development
  DD_END

  it "should work" do
    visit "/"
    page.should have_content('it worked')
    page.find("#success")[:class].should == 'basic'
  end

end
