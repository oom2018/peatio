# frozen_string_literal: true

module Peatio
  module AML
    class << self
      attr_accessor :adapter

      def check(deposit)
        adapter.check(deposit)
      end
    end

    class Abstract
      def check!(_address, _currency_id, _uid)
        method_not_implemented
      end
    end

    class Dummy < Abstract
      def check!(_address, _currency_id, _uid)
        OpenStruct.new(risk_detected: false, is_pending: false, error: nil)
      end
    end
  end
end