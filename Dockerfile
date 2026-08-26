# official dart image ব্যবহার করা হচ্ছে
FROM dart:stable AS build

WORKDIR /app

# dependencies কপি এবং ইনস্টল করা
COPY pubspec.yaml ./
RUN dart pub get

# বাকি কোড কপি করে বিল্ড করা
COPY . .
RUN dart compile exe bin/server.dart -o bin/server

# প্রোডাকশন এনভায়রনমেন্ট তৈরি
FROM subfuzion/dart:slim

WORKDIR /app
COPY --from=build /app/bin/server /app/bin/server

# Render-এর ডিফল্ট পোর্ট সেটআপ
EXPOSE 10000

CMD ["/app/bin/server"]
