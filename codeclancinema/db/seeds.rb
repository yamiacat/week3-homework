require("pry-byebug")
require_relative("../models/customer.rb")
require_relative("../models/film.rb")
require_relative("../models/screening.rb")
require_relative("../models/ticket.rb")

Film.delete_all()
Ticket.delete_all()
Screening.delete_all()
Customer.delete_all()

film1 = Film.new({
'title' => 'Bladerunner',
'certificate' => '15'
})

film2 = Film.new({
'title' => 'Akira',
'certificate' => '15'
})

film3 = Film.new({
'title' => '2001: A Space Odyssey',
'certificate' => 'U'
})

film4 = Film.new({
'title' => 'Event Horizon',
'certificate' => '18'
})

film5 = Film.new({
'title' => 'Escape From New York',
'certificate' => '15'
})

film6 = Film.new({
'title' => 'Europa Report',
'certificate' => '12'
})

film1.save
film2.save
film3.save
film4.save
film5.save
film6.save

screening1 = Screening.new({
  'screening_date' => '29/04/2017',
  'screening_time' => '17.00',
  'screening_film' => film1.id,
  'price' => '800',
  'capacity' => '100'
  })

screening2 = Screening.new({
  'screening_date' => '29/04/2017',
  'screening_time' => '20.00',
  'screening_film' => film2.id,
  'price' => '1000',
  'capacity' => '100'
  })

screening3 = Screening.new({
  'screening_date' => '29/04/2017',
  'screening_time' => '23.00',
  'screening_film' => film5.id,
  'price' => '1000',
  'capacity' => '100'
  })

screening4 = Screening.new({
  'screening_date' => '30/04/2017',
  'screening_time' => '17.00',
  'screening_film' => film3.id,
  'price' => '800',
  'capacity' => '3'
  })

screening5 = Screening.new({
  'screening_date' => '30/04/2017',
  'screening_time' => '20.00',
  'screening_film' => film6.id,
  'price' => '1000',
  'capacity' => '100'
  })

screening6 = Screening.new({
  'screening_date' => '30/04/2017',
  'screening_time' => '23.00',
  'screening_film' => film4.id,
  'price' => '1000',
  'capacity' => '100'
  })

screening1.save
screening2.save
screening3.save
screening4.save
screening5.save
screening6.save


customer1 = Customer.new({
  'name' => 'Tetsuo',
  'funds' => 50_00,
  'age' => 17
  })

customer2 = Customer.new({
  'name' => 'Deckard',
  'funds' => 100_00,
  'age' => 36
  })

customer3 = Customer.new({
  'name' => 'Hal',
  'funds' => 15_00,
  'age' => 10
  })

customer1.save
customer2.save
customer3.save

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'screening_id' => screening2.id
  })

ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'screening_id' => screening1.id
  })

ticket3 = Ticket.new({
  'customer_id' => customer3.id,
  'screening_id' => screening4.id
  })

  ticket4 = Ticket.new({
    'customer_id' => customer2.id,
    'screening_id' => screening4.id
    })

  ticket5 = Ticket.new({
    'customer_id' => customer1.id,
    'screening_id' => screening4.id
    })


ticket1.save
ticket2.save
ticket3.save
ticket4.save
ticket5.save


binding.pry
nil
