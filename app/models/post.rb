class Post < ActiveRecord::Base
    belongs_to :topic
    has_many :comments
end
