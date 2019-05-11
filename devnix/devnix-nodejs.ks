%packages

## JavaScript
nodejs
nodejs-docs

nodejs-typescript
nodejs-ansi
nodejs-yarn
nodejs-sqlite3
nodejs-markdown
nodejs-discord-js

%end


# No DNS resolution here so this won't work
#%post --erroronfail
#
## Node packages not in yum repos
#npm install -g tslint
#npm install -g @angular/cli
#npm install -g nativescript
#npm install -g @vue/cli
#npm install -g create-react-app
#npm install -g cordova
#npm install -g electron
#
#%end
