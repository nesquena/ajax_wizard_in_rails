external = [ 'libraries/protoculous', 'libraries/lowpro',
             'libraries/animator', 'extensions/animator_extensions']
              
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :external => external