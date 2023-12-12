# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "jquery", to: "jquery"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
