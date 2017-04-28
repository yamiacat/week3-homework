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
