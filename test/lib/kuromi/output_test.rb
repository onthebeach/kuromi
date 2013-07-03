require 'test_helper'

module Kuromi
  describe "Runner Output" do
    it "is returned from a Runner object" do
      Open3.expects(:popen3).yields(stub,
                                    stub(read: nil),
                                    stub(read: nil),
                                    stub(value: 0))

      output = Runner.for('ps').run
      output.must_be_instance_of Runner::Output
    end
  end

  describe "An Output object" do
    let(:stdout){ stub }
    let(:stderr){ stub }
    let(:stdin){ stub }

    subject{ Runner.for('hostname').run }

    it "puts the stdout stream in the output object" do
      stdout.expects(:read).returns('hitomi')
      stderr.stubs(:read)
      Open3.expects(:popen3).yields(stdin, stdout, stderr, stub(:value => 0))

      subject.stdout.must_equal 'hitomi'
    end

    it "puts the exit code in the output object" do
      stdout.stubs(:read)
      stderr.stubs(:read)
      Open3.expects(:popen3).yields(stdin, stdout, stderr, stub(:value => 0))

      subject.code.must_equal 0
    end

    it "puts the stderr stream in the output object" do
      stdout.stubs(:read)
      stderr.expects(:read).returns('ERR: Panic')
      Open3.expects(:popen3).yields(stdin, stdout, stderr, stub(:value => 1))

      subject.stderr.must_equal 'ERR: Panic'
    end
  end

end
