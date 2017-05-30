#!/bin/bash
echo "Creating Public Folders"
mkdir -p public
mkdir -p public/images
mkdir -p public/pdf
mkdir -p public/flags
mkdir -p public/fonts
mkdir -p public/css
mkdir -p public/js
mkdir -p tmp
chmod 777 tmp/

echo "Refresh Bower packages"
bower install

echo "Creating Index.html"
pug index.pug -O keys.json -O studies.json -o public/

echo "Combine, Minify and Copy CSS"
touch tmp/main.css
lessc assets/css/main.less tmp/main.css
cp bower_components/bootstrap/dist/css/bootstrap.min.css tmp/bootstrap.min.css
cp bower_components/font-awesome/css/font-awesome.min.css tmp/font-awesome.min.css
cp bower_components/flag-icon-css/css/flag-icon.min.css tmp/flag-icon.min.css
cp -a bower_components/font-awesome/fonts/. public/fonts/
uglifycss tmp/*.css > public/css/main.css

echo "Combine, Minify and Copy JS"
uglifyjs bower_components/jquery/dist/jquery.min.js bower_components/bootstrap/dist/js/bootstrap.min.js bower_components/jquery.lazyload/jquery.lazyload.js analytics.js main.js --mangle --compress --output=public/js/main.js

echo "Copy Images"
cp -a assets/images/. public/images/

echo "Copy PDFs"
cp -a assets/pdfs/. public/pdfs/

echo "Copy Flags"
cp -a bower_components/flag-icon-css/flags/. public/flags/

echo "Copy Impressum and Datenschutz"
pug impressum.pug -o public/
pug datenschutz.pug -o public/

echo "Copy 404 and 500"
pug 404.pug -o public/
pug 500.pug -o public/

echo "Copy htaccess"
cp .htaccess public/.htaccess

echo "Copy Autorun (for USB/CD)"
cp autorun.inf public/autorun.inf

echo "Copy AppCache.manifest"
cp manifest.appcache public/manifest.appcache

rm -rf tmp
echo "Done. Now Copy all in public to your webspace"
