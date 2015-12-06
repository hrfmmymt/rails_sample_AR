require 'active_record'
require 'logger'

ActiveRecord::Base.establish_connection(
  'adapter' => 'sqlite3',
  'database' => './blog.db'
)

# ActiveRecord::Base.logger = Logger.new(STDOUT)

class Post < ActiveRecord::Base
  # scope :top3, order('created_at').limit(3)
  # validates :title, :presence => true
  # validates :body, :length => { :minimum => 5 }
  has_many :comments, :dependent => :destroy
end

class Comment < ActiveRecord::Base
  belongs_to :post
end

p Post.all
p Comment.all

Post.find(1).destroy

p Post.all
p Comment.all


# post = Post.find(1)
# post.comments.each do |comment|
#   p comment.body
# end

# post = Post.find(1)

# post.title = '(new)title1'
# post.save

# post.update_attribute(:title, '(new2)title1')
# post.update_attributes(:title => 'nnn', :body => 'hhh')

# Post.where(:id => 1..2).update_all(:title => 'nnn', :body => 'hhh')

# p Post.all

# Post.where(:title => 'title5').first_or_create

# Post.where(:title => 'title6').first_or_create do |p|
#   p.body = 'hello6'
# end

# p Post.all

# post = Post.new(:title => 'title1', :body => 'hello1')

=begin
post = Post.new
post.title = 'title2'
post.body = 'hello2'
=end

=begin
post = Post.new do |p|
  p.title = 'title3'
  p.body = 'hello3'
end

post.save
=end

# Post.create(:title => 'title4', :body => 'hello')

# p Post.all
# p Post.first
# p Post.last.title
# p Post.find(3)
# p Post.find_by_title('title2')
# p Post.find_by_title_and_id('title2', '3')

# p Post.all

# p Post.where(:title => 'title1', :id => 1)
# p Post.where('title = ? and id = ?', 'title1', 1)
# p Post.where('title = :title and id = :id', {:title => 'title1', :id => 1})

# p Post.where('id > ?', 2)
# p Post.where('body like ?', 'hello%')

# p Post.where(:id => 1..3)
# p Post.where(:id => [1, 3])

# p Post.order('id desc').limit(3)

# p Post.top3

# delete: record fast
# destroy: object slow

# Post.where(:id => 1..2).delete_all
# Post.find(3).destroy

# p Post.all

# post = Post.new(:body => '123')
# post.save!

# if !post.save
#   p post.errors.messages
# end

# p Post.all

