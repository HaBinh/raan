json.articles do 
  json.array! @articles, partial: 'articles/article', as: :article
end