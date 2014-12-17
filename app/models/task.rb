class Task < ActiveRecord::Base
  belongs_to :user

  # DO NOT USER TO_JSON
  def as_json(options={})
    super(only: [:id, :title])
  end  
end
