# ใช้ Ruby Alpine image เป็นฐาน
FROM ruby:3.2-alpine

# ติดตั้ง dependencies ที่จำเป็น
RUN apk add --no-cache \
    build-base \
    postgresql-dev \
    nodejs \
    yarn \
    tzdata \
    git \
    # เพิ่ม dependencies อื่นๆ ที่จำเป็นสำหรับโปรเจคของคุณ
    && rm -rf /var/cache/apk/*

# ตั้งค่า working directory
WORKDIR /app

# คัดลอก Gemfile และ Gemfile.lock
COPY Gemfile Gemfile.lock ./

# ติดตั้ง gems
RUN bundle config set --local without 'development test' \
    && bundle install --jobs 20 --retry 5

# คัดลอกโค้ดของแอปพลิเคชัน
COPY . .

# Precompile assets
RUN RAILS_ENV=production bundle exec rails assets:precompile

# เคลียร์ cache และลบไฟล์ที่ไม่จำเป็น
RUN rm -rf /usr/local/bundle/cache/*.gem \
    && find /usr/local/bundle/gems/ -name "*.c" -delete \
    && find /usr/local/bundle/gems/ -name "*.o" -delete

# ตั้งค่า environment variables
ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=true

# เปิด port 3000
EXPOSE 3000

# คำสั่งที่จะรันเมื่อ container เริ่มทำงาน
CMD ["rails", "server", "-b", "0.0.0.0"]