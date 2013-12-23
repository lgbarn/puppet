Facter.add("location") do
  setcode do
    distid = Facter.value('ipaddress')
    case distid
    when /^10\.10\./
      "Bradenton"
    when /^10\.20\./
      "Reno"
    when /^10\.30\./
      "San_Leandro"
    when /^192\.168\.1\./
      "DMZ"
    else
      ""
    end
  end
end

