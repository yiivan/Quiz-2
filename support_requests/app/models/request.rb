class Request < ActiveRecord::Base
  def self.search(search, id)
   if search
     where(["name ILIKE :term OR email ILIKE :term OR department ILIKE :term OR message ILIKE :term", {term: "%#{search}%"}])
   else
    scoped
   end
  end

end
