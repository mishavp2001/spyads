module AdsHelper
  
  def display_ad ad, tracking=false
    
    cname = tracking && ad.ad_tracking.present? ? ad.ad_tracking.to_s : ""
 
    if ad.ad_body.present? 
      ad_content =  raw(ad.ad_body) 
    else
      ad_content =link_to( image_tag(ad.product_image), ad.product_link,{:class=>'int-box'})
    end
    # more  = content_tag(:div,'Were you looking for more information on',:class=>'looking-for')
    # title = content_tag(:div,ad.ad_title,:class=>'title')
    # text  = content_tag(:div,ad.ad_body,:class=>'body')
    # 
    # options_yes = {:id=>'learn-more' }
    # options_no  = {:id=>'no-thanks' }
    # options_img = {:class=>'int-box'}
    # 
    # if tracking  #clicks
    #   options_yes.merge!({:onclick =>"recordAnalyticsEvent('iad_yes_#{cname}','ad_learn_more_click');"})
    #   options_img.merge!({:onclick =>"recordAnalyticsEvent('iad_yes_#{cname}','ad_learn_more_click');"})
    #   options_no.merge!( {:onclick =>"recordAnalyticsEvent('iad_no_#{cname}','ad_no_thanks_click'); jQuery('#x-ad').hide();"})
    # end
    # 
    # yes = link_to('',ad.product_link ,options_yes)
    # no  = link_to('','#', options_no)
    # buttons = content_tag(:div,yes+no,:class=>'int-btn-set')
    # content = content_tag(:div,more + title + text + buttons, :class=>'int-content')
    # clear  = content_tag(:div,'',:class=>'clear')
    # 
    # middle = content_tag(:div, xlink + content + clear, :class=>'middle')

     
    if tracking  #impressions
      content_tag(:div, content_tag(:div, ad_content, :id=>"x-ad"), :id=>"ad_track",:class=>cname)
    else
      content_tag(:div,  ad_content , :id=>"x-ad")
    end
  end
end
