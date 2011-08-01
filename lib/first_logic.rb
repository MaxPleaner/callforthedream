require 'httpotato'

class FirstLogic
  include HTTPotato
  
  base_uri "http://api.democrats.org/"
  format :json

  KEY = '08041906-c020-4eee-92e6-d7f48df70e45'
  
  def self.lookup(street, postal_code, name='John Doe')
    ret = filter_for_errors get("/lookup", :headers => {"Referer" => "http://my.barackobama.com/" },
          :query => { :key => KEY, :line1 => street, :line2 => postal_code, :name => name, :_ => Time.now.to_i.to_s })
    # add a field for addr_wo_apt
    house_number   = ret['house_number']
    street_prefix  = ret['street_prefix']
    street_name    = ret['street_name']
    street_type    = ret['street_type'] 
    street_postfix = ret['street_postfix']
    addr_wo_apt = "#{house_number} #{street_prefix} #{street_name} #{street_type} #{street_postfix}".gsub(/[ ]+/,' ').strip #reconstruct address and replace more than 1 space with just 1 space
    ret["addr_wo_apt"] = addr_wo_apt
    return ret 
  end
  
  private

  def self.filter_for_errors(hash)
    if hash.nil? || hash["plus4"].blank? || hash["cd"].blank?
      raise AddressNotFound
    end
    hash
  end

end

class AddressNotFound < Exception; end