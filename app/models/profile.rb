class Profile < ApplicationRecord
  validates_presence_of %i[client_type]
  belongs_to :user

  enum client_type_value: %i[client gym_owner trainner]

  after_initialize :set_default_type, if: :new_record?

  private

  def set_default_type
    self.client_type ||= :client
  end
end
