class User < ActiveRecord::Base 
    has_many :tasks

    include BCrypt 

    def password 
        @password ||= Password.new(password_hash)
    end

    def password=(new_pass)
        @password = Password.create(new_pass)
        self.password_hash = @password
    end
end