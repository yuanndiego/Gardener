


get '/todo' do
    
    @dummy_data = [{ 
        :id => 1,
        :plant_name => "apple tree", 
        :task => "prune",
        :due_date => "20"
        },
        { 
        :id => 2,
        :plant_name => "peach tree", 
        :task => "prune",
        :due_date => "23"
        },
        { 
        :id => 3,
        :plant_name => "plum tree", 
        :task => "prune",
        :due_date => "18"
    }]

    erb :to_do

end
