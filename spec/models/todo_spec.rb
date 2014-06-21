require 'spec_helper'

describe Todo do
	describe "a valid to-do entry" do
		before { @todo = Todo.new(title: "New to-do entry.") }

		subject { @todo }
		it { should respond_to(:title) }

	  it "has a title" do
	    @todo.title.should == "New to-do entry."
	  end

	  it "has a valid title" do
	    @todo.should be_valid 
	  end

	  it "should not be completed" do
	    @todo.completed.should == false
	  end	  
	end

	describe "an invalid to-do entry" do
		before do
			title = ""
			(1..150).each {|i| title=title+(i.to_s) }
			@todo = Todo.new(title: "#{title}") 
		end

		it "has a too long of a title" do
	    @todo.should_not be_valid 
	  end
	end
end
