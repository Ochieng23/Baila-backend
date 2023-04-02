class User < ApplicationRecord
    has_secure_password


    def generate_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
        save(validate: false)
      end
    
      # Set the remember token for the user and store it in a cookie
      def set_remember_token
        generate_remember_token
        cookies.permanent[:remember_token] = remember_token
      end
    
      # Clear the remember token for the user and remove it from the cookie
      def clear_remember_token
        update_attribute(:remember_token, nil)
        cookies.delete(:remember_token)
      end
end
