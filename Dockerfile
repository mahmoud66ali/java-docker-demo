# استخدم صورة جافا
FROM openjdk:17-jdk-slim

# انسخ الملفات من الجهاز لجوا الصورة
COPY App.class /app/

# اختار فولدر التشغيل
WORKDIR /app

# الأمر اللي يتنفذ لما نشغل الكونتينر
CMD ["java", "App"]
