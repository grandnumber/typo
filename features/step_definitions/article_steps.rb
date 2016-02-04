Given /the following (.*?) exist:$/ do |type, table|
  table.hashes.each do |element|
    if    type == "users"    then User.create!(element)
    elsif type == "articles" then Article.create!(element)
    elsif type == "comments" then Comment.create!(element)
    end
  end
end


Given /the articles with ids "(\d+)" and "(\d+)" were merged$/ do |id1, id2|
  $article = Article.find_by_id(id1)
  $article.merge_with(id2)
end


Then /^the article "(.*?)" should have body "(.*?)"$/ do |title, body|
  Article.find_by_title(title).body.should eq body
end

Then /^the comment "(.*?)" should belong to "(.*?)"$/ do |comment, article_title|
   a_id = Article.find_by_title(article_title).id
  Comment.find_by_body(comment).article_id.should eq a_id
end




Then /author should be "(.*?)" or "(.*?)"$/ do |author1,author2|
  assertion= (($article.author == author1) or ($article.author == author2))
  assert assertion
end

Then /I should see "(.*?)" or "(.*?)"$/ do |title1,title2|
  assertion= (($article.title == title1) or ($article.title == title2))
  assert assertion
end