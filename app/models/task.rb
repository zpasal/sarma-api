class Task < ActiveRecord::Base
  belongs_to :user

  def as_json(options={})
    super(only: [:id, :title, :created_at])
  end  
end
