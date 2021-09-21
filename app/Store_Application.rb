class StoreApplication

  class << self
    def config(*_args)
      unless @instance
        yield(self)
        require "pony"
        require_relative 'String'
        require_relative 'Item_Container'
        require_relative 'Item'
        require_relative 'Virtual_Item'
        require_relative 'Real_Item'
        require_relative 'antique_item'
        require_relative 'Cart'
        require_relative 'Order'
      end
      @instance ||= self
      @instance.freeze
    end

    attr_accessor :name, :environment

    def admin(&block)
      @admin ||= Admin.new(&block)
    end

  end

  class Admin
    class << self
      attr_accessor :email, :login

      def new
        yield(self) unless @instance
        @instance ||= self
        @instance.freeze
      end

      def send_info_emails_on(day)
        @send_info_emails_on = day
      end

    end

  end

end