json.users @users.each do |user| 
    json.extract! user, :email, :name, :role
end