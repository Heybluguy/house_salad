class Member < ApplicationRecord
  attr_reader :name,
              :role,
              :party,
              :district,
              :seniority

  def initialize(attributes = {})
    @name       = attributes[:name]
    @role       = attributes[:role]
    @party      = attributes[:party]
    @district   = attributes[:district]
    @seniority  = attributes[:seniority].to_i
  end

  def find_all(state)
    members = PropublicaService.find_house_members(state).map do |raw_member|
      Member.new(raw_member)
    end

    sort_members(members)
  end

end