# frozen_string_literal: true

require "orchestrate_flow/workflow"

# Define a simple workflow class for testing
class TestWorkflow < OrchestrateFlow::Workflow
  state :pending
  state :in_progress
  state :completed
  state :failed

  transition event: :start, from: :pending, to: :in_progress
  transition event: :complete, from: :in_progress, to: :completed
  transition event: :fail, from: :in_progress, to: :failed

  on :start do
    puts "Starting workflow..."
  end

  on :complete do
    puts "Workflow completed succesfully!"
  end

  on :fail do
    puts "Workflow failed"
  end
end

RSpec.describe TestWorkflow do
  describe "initial state" do
    it "sets the initial state to :pending" do
      workflow = TestWorkflow.new
      expect(workflow.state).to eq(:pending)
    end
  end

  describe "state transitions" do
    it "transitions from :pending to :in_progress on :start event" do
      workflow = TestWorkflow.new
      workflow.trigger(:start)
      expect(workflow.state).to eq(:in_progress)
    end

    it "transitions from :in_progress to :completed on :complete event" do
      workflow = TestWorkflow.new
      workflow.trigger(:start)
      workflow.trigger(:complete)
      expect(workflow.state).to eq(:completed)
    end

    it "transitions from :in_progress to :failed on :fail event" do
      workflow = TestWorkflow.new
      workflow.trigger(:start)
      workflow.trigger(:fail)
      expect(workflow.state).to eq(:failed)
    end
  end

  describe "event actions" do
    it "executes the action associated with the :start event" do
      workflow = TestWorkflow.new
      expect { workflow.trigger(:start) }.to output("Starting workflow...\n").to_stdout
    end

    it "executes the action associated with the :complete event" do
      workflow = TestWorkflow.new
      workflow.trigger(:start)
      expect { workflow.trigger(:complete) }.to output("Workflow completed succesfully!\n").to_stdout
    end

    it "executes the action associated with the :fail event" do
      workflow = TestWorkflow.new
      workflow.trigger(:start)
      expect { workflow.trigger(:fail) }.to output("Workflow failed\n").to_stdout
    end
  end

  describe "invalid trasitions" do
    it "raises an error when an invalid transition is triggered" do
      workflow = TestWorkflow.new
      expect do
        workflow.trigger(:complete)
      end.to raise_error(OrchestrateFlow::Workflow::InvalidTransitionError,
                         "Cannot transition from pending using event complete")
    end
  end
end
