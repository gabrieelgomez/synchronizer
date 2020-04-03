require 'open-uri'

class EasyBrokerSynchronizer
  STAGING_URL = 'http://www.stagingeb.com/feeds/dc3122988c6d81d750eba0825adba94d049f0559/easybroker_MX.xml.gz'

  def self.synchronize
    Property.update_all(published: false)
    Ox.sax_parse Property::Parse.new, self.set_document
  end

  private

  def self.set_document
    open('./doc/easybroker_MX.xml').read
    # Zlib::GzipReader.new(open(STAGING_URL)).read
  end
end
