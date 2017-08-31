namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [FoodItem, TimeSlot, DeliveryBoy, OrderStatus].each(&:delete_all)
  
        FoodItem.populate 10..100 do |fooditem|
          fooditem.name = Populator.words(1..5).titleize
          fooditem.description = Populator.sentences(2..10)
          fooditem.status = [true,false]
          fooditem.price = [4.99, 19.95, 100]
          fooditem.chef = Populator.words(1..5).titleize
          fooditem.rating = [3,4,2,4,5,1,3,3]
          fooditem.created_at = 2.years.ago..Time.now
          TimeSlot.populate 10..100 do |time_s|
            time_s.food_item_id = fooditem.id
            time_s.from = Faker::Time.between(DateTime.now, DateTime.now + 10)
            time_s.to = [Faker::Time.forward(10, :morning), Faker::Time.forward(10, :afternoon), Faker::Time.forward(10, :evening), Faker::Time.forward(10, :morning)]          
          end
        end

        # OrderStatus.delete_all
        OrderStatus.create! id: 1, name: "In Progress"
        OrderStatus.create! id: 2, name: "Placed"
        OrderStatus.create! id: 3, name: "Shipped"
        OrderStatus.create! id: 4, name: "Cancelled"

        DeliveryBoy.create! id: 1, name: "Ramensh", contact: "9765431567"
        DeliveryBoy.create! id: 2, name: "Suresh", contact: "9765433237"
        DeliveryBoy.create! id: 3, name: "Deepak", contact: "9245431567"
        DeliveryBoy.create! id: 4, name: "Mohan", contact: "9709431567"

  end
end


