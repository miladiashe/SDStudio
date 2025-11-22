#!/bin/bash

# SDStudio Android 릴리즈 빌드 스크립트 (Mac/Linux)

set -e  # 에러 발생 시 중단

echo "🔨 렌더러 빌드 중..."
npm run build:renderer

echo "📱 Capacitor 동기화 중..."
npx cap sync android

echo "🚀 Android 릴리즈 APK 빌드 중..."
cd android
./gradlew assembleRelease
cd ..

echo "✅ 빌드 완료!"
echo "📦 APK 위치: android/app/build/outputs/apk/release/app-release.apk"
echo ""
echo "⚠️  참고: 릴리즈 APK는 서명이 필요합니다."
echo "   서명되지 않은 APK는 설치할 수 없습니다."
