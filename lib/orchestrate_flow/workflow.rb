module OrchestrateFlow
  class Workflow
    attr_reader :state

    def initialize
      @state = :pending
      @transitions = {}
      @event_actions = {}
    end

    # Define a new state
    def self.state(name)
      @states ||= []
      @states << name
      define_method("#{name}?") { @state == name }
    end

    # Define a transition between states
    def self.transition(event:, from:, to:)
      @transitions ||= {}
      @transitions[event] = { from: from, to: to }
    end

    # Define actions to trigger on events
    def self.on(event, &action)
      @event_actions ||= {}
      @event_actions[event] = action
    end
  end
end