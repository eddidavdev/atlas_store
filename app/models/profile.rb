class Profile < ApplicationRecord
  belongs_to :user

  enum client_type_value: %i[client gym_owner trainner]

  private

  def set_default_type
    self.client_type ||= :client
  end
end
