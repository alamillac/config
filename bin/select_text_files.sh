#!/bin/bash

#find * -type f -exec file -i {} \; | grep -iF ': text/'|cut -d':' -f1
find -type f -name '*.js' -or -name '*.html' -or -name '*.ejs' -or -name '*.scala' -or -name '*.php' -or -name '*.sh' -or -name '*.py' -or -name '*.coffee' -or -name '*.rb' -or -name '*.erb' -or -name '*.java' -or -name '*.scss' -or -name '*.pl' -or -name '*.handlebars' -or -name '*.jsx'
