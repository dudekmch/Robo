class Order < ApplicationRecord
  include Statesman::Adapters::ActiveRecordQueries
  belongs_to :shipping_type, optional: true
  belongs_to :user, optional: true
  has_many :line_items
  has_many :order_transitions, autosave: false

  delegate :can_transition_to?, :transition_to!, :transition_to, :current_state,
           to: :state_machine

  def state_machine
    @state_machine ||= OrderStateMachine.new(self, transition_class: OrderTransition)
  end

  def self.transition_class
    OrderTransition
  end

  def self.initial_state
    OrderStateMachine.initial_state
  end

  def self.transition_name
    :transitions
  end

  def full_cost
    cost = line_items.map { |e| e.full_price }.sum
    if shipping_cost
      return cost + shipping_cost
    end 
    cost
  end
end
