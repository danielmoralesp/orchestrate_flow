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

    # Execute a transition event
    def trigger(event)
      if valid_transition?(event)
        execute_event_action(event)
        @state = self.class.transitions[event][:to]
      else
        raise InvalidTransitionError, "Cannot transition from #{@state} using event #{event}"
      end
    end

    # Accessors for states, transitions, and event actions
    def self.states
      @states
    end

    def self.transitions
      @transitions
    end

    def self.event_actions
      @event_actions
    end

    private

    # Validate if a transition is allowed
    def valid_transition?(event)
      transition = self.class.transitions[event]
      transition && transition[:from] == @state
    end

    # Execute an event action if defined
    def execute_event_action(event)
      action = self.class.event_actions[event]
      action.call if action
    end

    # Custom error for invalid transitions
    class InvalidTransitionError < StandardError; end
  end
end