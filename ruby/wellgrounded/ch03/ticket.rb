class Ticket
  def initialize(venue, date)
    @venue = venue
    @date  = date
  end

  def venue
    @venue
  end

  def date
    @date
  end

  def price=(amount)
    @price = amount
  end

  def price
    @price
  end

  def Ticket.most_expensive(*tickets)
    tickets.max_by(&:price)
  end
end

th = Ticket.new("Town Hall", "11/12/13")
th.price = 34
cc = Ticket.new("Convention Center", "12/13/14")
cc.price = 64
puts "We've created two tickets."
puts "The first is for a #{th.venue} event on #{th.date} and costs #{th.price}."
puts "The second is for an event on #{cc.date} at #{cc.venue} and costs #{cc.price}."

expensive = Ticket.most_expensive(th, cc)
puts "The most expensive ticket is for #{expensive.venue}"
