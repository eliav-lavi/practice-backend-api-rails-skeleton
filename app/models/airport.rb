class Airport < ApplicationRecord
  def as_json(options = nil)
    super.except('created_at', 'updated_at', 'id')
  end
end
