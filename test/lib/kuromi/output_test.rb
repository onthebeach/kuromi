require 'test_helper'

module Kuromi
  describe "Runner Output" do
    it "is returned from a Runner object" do
      Open3.expects(:popen3).yields(nil, nil, nil, stub(:value => 0))

      output = Runner.for('ps').run
      output.must_be_instance_of Runner::Output
    end
  end
end
