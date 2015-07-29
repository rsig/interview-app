class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable, stretches: 8

  #-----------------------------------------------------------------------------
  # Relationships
  #-----------------------------------------------------------------------------

  # ...

  #-----------------------------------------------------------------------------
  # Validations
  #-----------------------------------------------------------------------------

  validates :email, :password, :authentication_token, presence: true

  #-----------------------------------------------------------------------------
  # Callbacks
  #-----------------------------------------------------------------------------

  before_validation :generate_authentication_token, on: :create

  #-----------------------------------------------------------------------------
  # Class Methods
  #-----------------------------------------------------------------------------

  def self.authenticate_token!(id, authentication_token)
    user = find(id)
    if Devise.secure_compare(user.authentication_token, authentication_token)
      user
    end
  end

  def self.sign_in(email, password)
    if user = self.find_for_database_authentication({email: email})
      if user.valid_for_authentication? { user.valid_password?(password) }
        user.session
      end
    end
  end

  #-----------------------------------------------------------------------------
  # Authentication
  #-----------------------------------------------------------------------------

  def authentication_token_atts
    {
      authentication_token: SecureRandom.urlsafe_base64(15).tr('lIO0', 'sxyz'),
    }
  end

  def session
    self.slice(:authentication_token, :id, :email)
  end

  private

  def generate_authentication_token
    assign_attributes authentication_token_atts
  end
end
