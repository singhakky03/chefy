namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [FoodItem, TimeSlot, DeliveryBoy, OrderStatus, Locality, OrderStatus].each(&:delete_all)

    OrderStatus.create! id: 10, name: "In Progress"
    OrderStatus.create! id: 20, name: "Placed"
    OrderStatus.create! id: 30, name: "Shipped"
    OrderStatus.create! id: 40, name: "Cancelled"

    Locality.create! id: 11, pincode: "400060", name: "Jogeshwari East"
    Locality.create! id: 22, pincode: "400069", name: "Andheri East"
    Locality.create! id: 33, pincode: "400063", name: "Goregoan East"
    Locality.create! id: 44, pincode: "400097", name: "Malad East"

    DeliveryBoy.create! id: 12, name: "Ramensh", contact: "9765431567"
    DeliveryBoy.create! id: 22, name: "Suresh", contact: "9765433237"
    DeliveryBoy.create! id: 32, name: "Deepak", contact: "9245431567"
    DeliveryBoy.create! id: 42, name: "Mohan", contact: "9709431567"

    TimeSlot.create! id: 13, slot: "morning", from: TimeSlot::TIME_SLOT[:morning][:from], to: TimeSlot::TIME_SLOT[:morning][:to]
    TimeSlot.create! id: 23, slot: "afternoon", from: TimeSlot::TIME_SLOT[:afternoon][:from], to: TimeSlot::TIME_SLOT[:afternoon][:to]
    TimeSlot.create! id: 31, slot: "evening", from: TimeSlot::TIME_SLOT[:evening][:from], to: TimeSlot::TIME_SLOT[:evening][:to]
    TimeSlot.create! id: 43, slot: "night", from: TimeSlot::TIME_SLOT[:night][:from], to: TimeSlot::TIME_SLOT[:night][:to]
      
    Locality.populate 1..3 do |locality| 
      TimeSlot.populate 1..3 do |time_s|
        FoodItem.populate 10..100 do |fooditem|
          fooditem.time_slot_id = [1,2,3,4] 
          fooditem.locality_id = [1,2,3,4]
          fooditem.name = Populator.words(1..5).titleize
          fooditem.description = Populator.sentences(2..10)
          fooditem.status = [true,false]
          fooditem.price = [4.99, 19.95, 100]
          fooditem.chef = Populator.words(1..5).titleize
          fooditem.rating = [4,2,4,5,1,3]
          fooditem.created_at = 2.years.ago..Time.now
        end
      end
    end


    #TimeSlot.where(to: nil).delete_all
    #Locality.where(pincode: nil).delete_all
  end
end


