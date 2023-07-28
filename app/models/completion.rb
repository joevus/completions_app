class Completion < ApplicationRecord
    belongs_to :tutorial
    before_create :assign_defaults

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :uid, presence: true

private

  def assign_defaults
    self.completion_time = Time.now
  end
end
