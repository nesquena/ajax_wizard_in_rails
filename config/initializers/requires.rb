external = [ 'libraries/protoculous', 'libraries/lowpro',
             'libraries/animator', 'libraries/animator_extensions']
              
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :external => external