%packages

## JavaScript
nodejs
nodejs-devel
nodejs-docs

nodejs-express
nodejs-express-session

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
#sudo npm install -g electron --unsafe-perm=true
#npm install -g express-generator

#%end
