#!/bin/bash

# SDStudio Android 빌드 스크립트 (Mac/Linux)

set -e  # 에러 발생 시 중단

echo "🔨 렌더러 빌드 중..."
npm run build:renderer

echo "📱 Capacitor 동기화 중..."
npx cap sync android

echo "🚀 Android 디버그 APK 빌드 중..."
cd android
./gradlew assembleDebug
cd ..

echo "✅ 빌드 완료!"
echo "📦 APK 위치: android/app/build/outputs/apk/debug/app-debug.apk"
