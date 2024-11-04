# frozen_string_literal: true

module OrchestrateFlow
  # The Workflow class represents a basic state machine for defining workflows
  # with states, transitions, and event-driven actions. It allows developers
  # to manage complex workflows using defined states and triggers.
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
      unless valid_transition?(event)
        raise InvalidTransitionError, "Cannot transition from #{@state} using event #{event}"
      end

      execute_event_action(event)
      @state = self.class.transitions[event][:to]
    end

    # Accessors for states, transitions, and event actions
    class << self
      attr_reader :states
    end

    class << self
      attr_reader :transitions
    end

    class << self
      attr_reader :event_actions
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
      action&.call
    end

    # Custom error for invalid transitions
    class InvalidTransitionError < StandardError; end
  end
end
