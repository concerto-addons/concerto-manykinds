# Concerto Manykinds

A Rails Engine for displaying multiple types of content in the same template field in Concerto. An example usage scenario is where you have a screen with one field that covers the entire screen-- you can add the other types to that field so that is also shows Text, and Ticker content.

To use this engine, add the following to the Concerto Gemfile-plugins, or use the UI to add the plugin: 
```
gem 'concerto_manykinds'
```

You probably don't need to create the migrations manually with this method shown below, because when you restart Concerto it will automatically run the migrations.
```
rails generate concerto_manykinds
```

Then go into the templates you want to modify and add the additional kinds in the sidebar.
