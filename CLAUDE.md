# SDStudio - Claude AI 작업 가이드

## 프로젝트 개요

SDStudio는 Stable Diffusion 계열 API와 모델을 사용하기 편하게 해주는 Electron 기반 데스크톱 애플리케이션입니다.
여러 씬을 생성 예약하고, 이미지 월드컵으로 선택하며, 리터칭하는 작업 흐름에 최적화되어 있습니다.

## 기술 스택

- **프레임워크**: Electron 26.x
- **UI 라이브러리**: React 18.x
- **언어**: TypeScript 5.x
- **상태 관리**: MobX State Tree
- **빌드 도구**: Webpack 5
- **스타일링**: Tailwind CSS, Sass
- **모바일**: Capacitor (Android/iOS 지원)

## 프로젝트 구조

```
SDStudio/
├── src/
│   ├── main/           # Electron 메인 프로세스
│   ├── renderer/       # React 렌더러 프로세스
│   └── native/         # 네이티브 모듈
├── android/            # Android Capacitor 앱
├── .erb/               # Electron React Boilerplate 설정
│   ├── configs/        # Webpack 설정
│   └── scripts/        # 빌드 스크립트
├── assets/             # 애플리케이션 리소스
└── data/               # 데이터 파일
```

## 주요 기능

### 1. 씬 별 이미지 생성
- 여러 씬을 관리하고 생성 예약
- 프롬프트 조합 및 변형

### 2. 이미지 월드컵
- 생성된 이미지들을 토너먼트 방식으로 비교 선택

### 3. 이미지 편집
- 인페인팅 (Inpainting)
- 자동 배경 제거
- 포토샵 연동

### 4. 프롬프트 관리
- 태그 자동 완성
- 프롬프트 조각 및 구문 하이라이팅
- 프롬프트 조합 기능

## 개발 가이드라인

### 시작하기

```bash
# 의존성 설치
npm install

# 개발 서버 시작
npm start

# 프로덕션 빌드
npm run build

# 패키징
npm run package
```

### 코드 스타일

- **Linting**: ESLint 설정 준수
- **Formatting**: Prettier 사용 (single quotes)
- **타입**: TypeScript strict 모드 사용

### 파일 작성 규칙

1. **컴포넌트**: PascalCase (예: `ImageEditor.tsx`)
2. **유틸리티**: camelCase (예: `imageUtils.ts`)
3. **타입/인터페이스**: PascalCase with descriptive names
4. **상수**: UPPER_SNAKE_CASE

### 주의사항

#### Electron 보안
- `nodeIntegration`은 false로 유지
- IPC 통신 시 입력 검증 필수
- 외부 콘텐츠 로드 시 `contextIsolation` 활용

#### 성능
- 대용량 이미지 처리 시 Worker 사용 고려
- 메모리 누수 방지 (이벤트 리스너 정리)
- 렌더러 프로세스와 메인 프로세스 간 효율적인 통신

#### 크로스 플랫폼
- 경로는 `path.join()` 사용
- 플랫폼별 조건부 로직 최소화
- 네이티브 모듈 사용 시 재빌드 필요

## 빌드 설정

### ASAR Unpacking
다음 모듈들은 ASAR에서 압축 해제됨:
- `.node`, `.dll` 파일
- sharp, chokidar, exiftool-vendored
- localai

### 타겟 플랫폼
- **macOS**: x64, arm64 (Apple Silicon)
- **Windows**: NSIS installer
- **Linux**: AppImage
- **Android**: Capacitor
- **iOS**: Capacitor

## 디버깅

### Electron DevTools
- 메인 프로세스: `--inspect` 플래그 사용
- 렌더러 프로세스: Chrome DevTools 내장

### 로깅
- `electron-log` 사용
- 로그 위치: 플랫폼별 app data 디렉토리

## 배포

```bash
# 크로스 플랫폼 빌드 (Windows)
npm run package-cross

# 현재 플랫폼 빌드
npm run package
```

## 기여 시 체크리스트

- [ ] TypeScript 타입 에러 없음
- [ ] ESLint 경고 없음
- [ ] Prettier 포맷팅 적용
- [ ] 기존 기능 동작 확인
- [ ] 크로스 플랫폼 호환성 고려
- [ ] 메모리 누수 체크

## 참고 자료

- [Electron Documentation](https://www.electronjs.org/docs)
- [React Documentation](https://react.dev)
- [MobX State Tree](https://mobx-state-tree.js.org)
- [Capacitor Documentation](https://capacitorjs.com/docs)

## 크레딧

이미지 씬 기능은 https://dendenai.xyz 의 프리셋 기능에서 파생되었습니다.
