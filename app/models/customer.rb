class Customer < ApplicationRecord
  def self.search_keyword(keyword)
    keyword.downcase!
    if keyword.include?('@')
      self.where('email ILIKE ?', "%#{keyword}%").order(email: :desc, last_name: :asc)
    else
      self.where('first_name ILIKE ? OR
                  last_name  ILIKE ?', "%#{keyword}%", "%#{keyword}%").order(email: :desc, last_name: :asc)
    end
  end
end
