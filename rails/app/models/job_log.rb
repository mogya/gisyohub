# frozen_string_literal: true

class JobLog < ApplicationRecord
  attr_writer :variables
  before_validation :set_variables

  def variables
    @variables ||=
      JSON.parse(variable_json, object_class: HashWithIndifferentAccess) ||
      HashWithIndifferentAccess.new
  end

  def set_variables
    self.variable_json = @variables.to_json
  end

  def finish(at = Time.zone.now)
    self.finished_at = at
    save
  end
end
