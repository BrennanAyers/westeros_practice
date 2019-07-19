class SearchFacade
  def initialize(house)
    @house = house
  end

  def member_count
    @members ||= westeros_service.members

    @members.count
  end

  def members
    @members ||= westeros_service.members

    @members.map do |member|
      HouseMember.new(member)
    end
  end

  private

  def westeros_service
    @_westeros_service ||= WesterosService.new(@house)
  end
end
