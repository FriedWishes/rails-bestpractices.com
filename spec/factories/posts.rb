Factory.define :post do |p|
  p.sequence(:title) {|n| "Post #{n}" }
  p.body "subject\n=======\ntitle\n-----"
  p.association :user
end

Factory.define :code_post, :parent => :post do |p|
  p.sequence(:title) {|n| "Code Post #{n}" }
  p.body "subject\n=======\ntitle\n-----\n    def test\n      puts 'test'\n    end"
  p.association :user
end
