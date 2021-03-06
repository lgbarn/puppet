Puppet::Parser::Functions::newfunction(:template_body, :type => :rvalue) do |args|
  args.collect do |file|
    unless filename = Puppet::Parser::Files.find_template(file, self.compiler.environment.to_s)
      raise Puppet::ParseError, "Could not find template '#{filename}'"
    end
    File.read(filename)
  end.join('')
end
