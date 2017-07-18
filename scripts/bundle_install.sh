# bundle config build.nokogiri --use-system-libraries
nproc=$(which nproc > /dev/null && nproc || 1)

case "$RAILS_ENV" in
  "development" )
    bundle install --jobs="$nproc" --without production;;
  "test" )
    bundle install --jobs="$nproc" --deployment --without production;;
  "production" )
    bundle install --jobs="$nproc" --deployment --without development test;;
esac
