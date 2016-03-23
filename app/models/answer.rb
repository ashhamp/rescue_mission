class Answer < ActiveRecord::Base
  belongs_to :question

  validates :description, presence: true, length: { minimum: 50 }
  validates :question, presence: true

  def markdown
    
  end
end
