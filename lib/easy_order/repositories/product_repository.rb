class ProductRepository
  include Lotus::Repository

  def self.search(query)
    q = "Select p.* From products as p, sub_categories as s, categories as c WHERE (c.name LIKE '%#{query}%' OR s.name LIKE '%#{query}%' OR p.title LIKE '%#{query}%' OR p.description LIKE '%#{query}%') AND (p.sub_category_id = s.id AND s.category_id = c.id);"

    fetch(q).map { |product| product }
  end
end