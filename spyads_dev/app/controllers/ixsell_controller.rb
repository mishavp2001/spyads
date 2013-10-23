class IxsellController < ApplicationController
  
  helper :ads
  
  def home
  end

  def query
    
    # Get the query parameters from the user
    authid = params[:authid]
    ad_id = params[:ad_id]
    ruleset = params[:ruleset] #name of the ruleset
    
    
    # If the ad_id parameter is provided, render the ad directly
    # It basically overrides everything else!
    if ad_id
      @ad = Ad.find_by_id(ad_id)
      if @ad
        render_ad and return
      else
        render :text => "Ad with id #{ad_id} was not found" and return
      end
    end
    
    # if no specific ruleset is provided, use our default uber-ruleset
    if ruleset.blank?
      ruleset = "Default"
    end

    all_rules = Ruleset.find_by_name(ruleset).rules

    # DEBUG: hardcoded teh authid if it's not provided
    authid = "56527919" if authid.blank?
    
    # Get the two api's from BIO, store them as objects
    unlock_products_url = "http://http://qa-ext.sr.qbinproduct.intuit.com/las_box_offers"
    unlock_profiles_url = "http://http://qa-ext.sr.qbinproduct.intuit.com/las_box_offers"
    
    unlock_products_response = HTTParty.get(unlock_products_url + authid)
    logger.debug unlock_products_response
    unlock_products = unlock_products_response.parsed_response
    unlock_products = unlock_products["productOwnershipResponse"]["smallBizProductOwnershipDetails"]
    logger.debug "Unlock products: #{unlock_products}"
    
    logger.debug "**** Test for tenure: #{unlock_products["tenure"]}"
    
    unlock_profiles_response = HTTParty.get(unlock_profiles_url + authid)
    logger.debug unlock_profiles_response.inspect
    unlock_profiles = unlock_profiles_response.parsed_response
    unlock_profiles = unlock_profiles["PIIDetailsResponse"]["smallBizContact"]
    
    # merge the products and profiles to make things easier for ourselves
    unlock_products.merge!(unlock_profiles)
    logger.debug("Unlock products after merging: #{unlock_products.inspect}")
    # Match them against all the rules and look for the first match
    all_rules = Ruleset.find_by_name(ruleset).rules
    
    matching_rule = nil
    return_ad = nil
    
    all_rules.each do |rule|
      # grap the json object, turn it into the hash
      rule_po = Hash.new
      rule_po = JSON.parse(rule.product_ownership) if !rule.product_ownership.blank?
      logger.debug rule_po.inspect
      
      rule_ud = Hash.new
      rule_ud = JSON.parse(rule.user_details) if !rule.user_details.blank?
      logger.debug rule_po.inspect
      
      # merge user details into product_ownership
      rule_po.merge!(rule_ud)
      
      # compare to
      rule_matches = true
      rule_po.each do |k, v|
        logger.debug "processing rule: #{rule.id} with key, value: #{k}, #{v}"
        if rule_matches == true
          rule_matches = match_rule(k, v, unlock_products)
        end 
      end
      
      # The first rule match we get, we use it, and break out of the loop
      if rule_matches
        return_ad = rule.ad
        break
      end
    end
    
    # Return whatever the user has matched
    logger.debug return_ad.inspect
    @ad = return_ad
    
    render_ad
    
  end
  
  def match_rule (k, v, unlock_products)
    # if unlock products[k] exists and is a string or integer, use it
    # if it's an array, recurse over each array element, if it's a hash, use it for a hash
    
    # check if value matches
    unlock_matche_values_for_k = unlock_products.recursive_find_by_key(k)
    return false if unlock_matche_values_for_k.empty? 
    logger.debug "matching key found: #{k}"
    logger.debug "unlock matches matcking key #{k}: #{unlock_matche_values_for_k.inspect}"
    if v[0] == '!' && !unlock_matche_values_for_k.include?(v[1..v.length])
      return true
    end
    unlock_matche_values_for_k.each do |u_match_val|
      if v[0] == "<" or v[0] == ">"
        logger.debug "found a comparison operator for: #{v}"
        logger.debug "running eval of #{u_match_val.to_i} #{v}"
        if eval("#{u_match_val.to_i}#{v}") 
          return true
        end
      else
        logger.debug "comparing u_match_val: #{u_match_val}, v: #{v}"
        if u_match_val.to_s.downcase == v.to_s.downcase
          logger.debug "match found for key: #{k}, value: #{v}"
          return true
        end
      end
    end
    return false
  end
  
  def render_ad
    respond_to do |format|
      format.html { render :layout => false } # index.html.erb
      format.json { render json: @ad }
    end
  end

end
