class ActsAsTaggableOn::Tag < ApplicationRecord

  # ...

  def self.ransackable_associations(auth_object = nil)
    ["taggings"]
  end

  # ...

end