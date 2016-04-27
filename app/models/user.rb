class User < ActiveRecord::Base

    before_save :encrypt_password

    validates_presence_of :password_hash, :on => :signup
    validates_presence_of :email
    validates_format_of :email, {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Email address is invalid"}
    validates_uniqueness_of :email, {message: "Email address is already registered"}

    def encrypt_password
        if password_hash.present?
            self.password_salt = BCrypt::Engine.generate_salt
            self.password_hash = BCrypt::Engine.hash_secret(password_hash, password_salt)
        end
    end

    def self.authenticate(email, password)
        user = find_by_email(email)
        if user
            encrypted_password = BCrypt::Engine.hash_secret password, user.password_salt

            if user && (encrypted_password == user.password_hash)
                user
            else
                nil
            end
        else
            nil
        end
    end

end
