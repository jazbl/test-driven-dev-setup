#!/bin/bash
#Created by Jasmine-Ball, 23 April 2016.

cd /tmp
wget http://nodejs.org/dist/v0.10.32/node-v0.10.32-linux-x64.tar.gz
tar xvf node-v0.10.32-linux-x64.tar.gz
cd node-v0.10.32-linux-x64/
cp * /usr/local/ -r
cd ~
clear
printf "\n You now have the following version of Node installed: "
node -v
sleep 0.1
printf "\n"
npm install -g express-generator
printf "\n Please enter a name for your new project and press [Enter]: "
read projectName
express $projectName
cd $projectName
npm install
sed -i -e '$ i , "devDependencies": { \n  "mocha": "*", \n  "should": ">= 0.0.1" \n } ' package.json
npm install
mkdir test
cd test
echo -e "--require should \n--ui bdd \n--recursive" > mocha.opts
cd ~/$projectName
sed -i -e '$ i , "devDependencies": { \n  "mocha": "*", \n  "should": ">= 0.0.1" \n } ' package.json
sed -i -e '/scripts/ a \    "test": "node_modules/.bin/mocha -w",' package.json
npm install
cd test
printf "'use strict'; \n \nvar myCode = require('./code.js'); //The string on this line is the location of the file to be tested\n \ndescribe('spec1', function () { \n  it('Code file should output the number 1', function (done) {  //The string on this line is just your own description of the test\n \n    var codeOut = myCode.outputNumber; \n    codeOut.should.equal(1); \n    done();\n\n  });\n});\n" > spec.js
printf "'use strict';  \nvar number = 1; \nexports.outputNumber = number; \n" > code.js
npm install
clear
printf '\nCongratulations!\n\nYou are now set up to do Test Driven Development with NodeJS. Your project directory is located at ~/'$projectName'.'
sleep 0.5
printf '\nInside your project directory, you will see a folder called ''\e[0;32m%-6s\e[m' "test, "
printf 'containing a ''\e[0;32m%-6s\e[m' "spec.js "
printf 'file for specifying the output requirements of your code. \n\nThere is also a ''\e[0;32m%-6s\e[m' "code.js "
printf 'file in the test folder, which is where you can place the code which you want to test. \nThese two files already have some sample code in them to get you started. \n\nNavigate to your project directory and type''\e[0;32m%-6s\e[m' " npm test "
printf 'to see whether the code passes the output requirements of the spec.js file. \n\n'
