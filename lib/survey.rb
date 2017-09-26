class Survey < ActiveRecord::Base
  has_many(:questions)
  before_save(:cap_first_letter)

  private

  def cap_first_letter
    self.title=(title.split(' ').map {|x| x.capitalize}.join(' '))
  end
end
