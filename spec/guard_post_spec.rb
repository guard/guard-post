require 'spec_helper'

def update_post(file)
  "UPDATED"
end

describe Guard::Post do
  context ":watch" do
    before do
      @subject = Guard::Post.new([], :update => :update_post)
    end
    
    it "should accept options" do
      @subject.options[:update].should == :update_post
      @subject.update_file("some/path.md").should == "UPDATED"
    end
  end
end
