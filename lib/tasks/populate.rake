namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [FoodItem, TimeSlot].each(&:delete_all)
    
    #FoodItemTimeSlot.populate 100 do |food_time|
      # category.name = Populator.words(1..3).titleize
      # FoodItem.populate 10..100 do |fooditem|
      #   fooditem.id = food_time.food_item_id
      #   fooditem.name = Populator.words(1..5).titleize
      #   fooditem.description = Populator.sentences(2..10)
      #   fooditem.price = [4.99, 19.95, 100]
      #   fooditem.chef = Populator.words(1..5).titleize
      #   fooditem.rating = [3,4,2,4,5,1,3,3]
      #   fooditem.created_at = 2.years.ago..Time.now
      # end

      # TimeSlot.populate 10..100 do |time_s|
      #   #time_s.id = food_time.time_slot_id
      #   time_s.from = Faker::Time.between(DateTime.now - 10, DateTime.now)
      #   time_s.to = Faker::Time.forward(5, :morning)
        FoodItem.populate 10..100 do |fooditem|
          #fooditem.id = food_time.food_item_id
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
    #end
    
    # FoodItemTimeSlot.populate 100 do |food_time|
    #   person.name    = Faker::Name.name
    #   person.company = Faker::Company.name
    #   person.email   = Faker::Internet.email
    #   person.phone   = Faker::PhoneNumber.phone_number
    #   person.street  = Faker::Address.street_address
    #   person.city    = Faker::Address.city
    #   person.state   = Faker::Address.us_state_abbr
    #   person.zip     = Faker::Address.zip_code
    # end
  end
end