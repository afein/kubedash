FROM progrium/busybox
MAINTAINER almavrog@google.com

# Copy all pages to /pages
ADD pages /pages

# Create the static JS files directory
RUN mkdir -p /static/js

# Add the application frontend under /static
ADD app /static/js/app

# Add third party JS static files under /static
ADD third_party/jquery/dist/jquery.min.js /static/js
ADD third_party/bootstrap/dist/bootstrap.min.js /static/js
ADD third_party/angular/angular.min.js /static/js
ADD third_party/angular-route/angular-route.min.js /static/js
ADD third_party/d3/d3.min.js /static/js
ADD third_party/nvd3/nvd3.min.js /static/js
ADD third_party/angular-nvd3/dist/angular-nvd3.min.js /static/js

# Add third party CSS static files under /static
ADD third_party/bootstrap/dist/bootstrap.min.css /static/css
ADD third_party/bootstrap/main.css /static/css
ADD third_party/nvd3/nv.d3.css /static/css

# Copy the Kubedash binary
ADD kubedash /kubedash

ENTRYPOINT ["/kubedash"]