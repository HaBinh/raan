json.users @users.each do |user| 
<<<<<<< HEAD
    json.extract! user, :email, :name, :role
=======
    json.extract! user, :id, :email, :name, :role
>>>>>>> user-management
end