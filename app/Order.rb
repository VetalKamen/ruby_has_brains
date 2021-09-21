class Order

  attr_reader :items, :placed_at, :time_on_sending_email

  include ItemContainer

  def initialize
    @items = []
  end

  def place
    @placed_at = Time.now
    # thr = Thread.new do
    #   Pony.mail(
    #     to: StoreApplication::Admin.email,
    #     from: 'My store app jason.binwood@gmail.com',
    #     via: :smtp, via_options: {
    #     address: 'smtp.gmail.com',
    #     port: '587',
    #     user_name: 'jason.binwood@gmail.com',
    #     password: '6bh5snql83d8',
    #     authentication: :plain,
    #     domain: 'mail.google.com'
    #   },
    #     subject: 'New order has been placed', body: 'Please check beck you admin page'
    #   )
    # end
    # while thr.alive?
    #   puts '.'
    #   sleep(1)
    # end
    sent_email_at = Time.now
    @time_on_sending_email = sent_email_at - @placed_at
  end

end