require 'rswt/version'

require 'java'

module Rswt
  
  def self.jars
    [
      'swt'
    ]
  end

  Rswt.jars.each do |jar|
    raise "You must set RSWT_JAR_PATH!" if ENV['RSWT_JAR_PATH'].nil?
    begin
      require File.join(ENV['RSWT_JAR_PATH'], jar)
    rescue LoadError => e
      STDERR.puts e.message
      STDERR.puts "Make sure you have set RSWT_JAR_PATH to the path where your swt jars are stored."
      exit -1
    end
  end
end