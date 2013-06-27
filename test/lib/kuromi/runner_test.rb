require 'test_helper'

module Kuromi
  describe "running a binary" do
    subject { Runner.for('hostname')}

    it "runs" do
      Open3.expects(:popen3).with("hostname")
      subject.run
    end
  end

  describe "running a binary with a command" do
    subject { Runner.for('git').command('st') }

    it "runs" do
      Open3.expects(:popen3).with("git st")
      subject.run
    end
  end

  describe "running a binary with options" do
    let(:runner) { Runner.for('ps').with('-ef') }

    it "runs with a single option" do
      Open3.expects(:popen3).with("ps -ef")
      runner.run
    end

    it "runs with multiple options" do
      Open3.expects(:popen3).with("ps -ef foo")
      runner.and("foo").run
    end
  end

  describe "chaining all the things" do
    let(:runner) { Runner.for('git').
                     command('rebase').
                     with('--interactive').
                     and('origin/safe') }

    it "runs with everything" do
      Open3.expects(:popen3).with("git rebase --interactive origin/safe")
      runner.run
    end
  end
end
