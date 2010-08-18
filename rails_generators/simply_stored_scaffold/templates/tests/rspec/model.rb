require File.dirname(__FILE__) + '/../spec_helper'

describe <%= name.camelize %> do
  it "should be valid" do
    <%= name.camelize %>.new.should be_valid
  end
end
