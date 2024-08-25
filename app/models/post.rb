class Post < ApplicationRecord
  after_create :delete_post

  def delete_post
    DeletePostJob.set(wait: 20.seconds).perform_later(self.id)
  end
end
