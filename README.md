# Mark 3D Print · Website

**Markforged 한국 공식 대리점** — mark3dprint.com 정적 웹사이트

## 스택
- HTML / CSS (Pretendard + Inter) · Vanilla JS
- Vercel 배포 · cleanUrls · 정적 CDN
- 배포: `git push` → Vercel 자동 배포

## 구조
```
/                        홈
/markforged             마크포지드 브랜드·한국 도입 가이드
/about                   회사 소개
/printers                프린터 라인업
  /printers/mark-two     Mark Two 상세
  /printers/x7           X7 상세
  /printers/fx10         FX10 상세
  /printers/fx20         FX20 상세
/materials               재료 인덱스
  /materials/onyx        Onyx
  /materials/onyx-fr     Onyx FR
  /materials/nylon-white-fs  Nylon White FS
  /materials/carbon-fiber    Continuous Carbon Fiber
/industries              산업 분야
/software                Digital Forge · Eiger
/service                 3D 프린팅 서비스
/inquiry                 문의 (FormSubmit.co)
/faq                     FAQ
/thank-you               문의 완료
/404                     404

css/style.css            공통 스타일
_partials/               header · footer · main · build script (배포 제외)
```

## 페이지 수정
1. `_partials/main_<page>.html` 수정
2. `bash _partials/build.sh` 실행 (해당 페이지)
3. `git commit && git push`
4. Vercel 자동 재배포 (3분)

## 문의
- 정기운 · 010-4253-4387 · sales@mark3dprint.com

## SEO Landing Pages

2026-08-15 added search-intent pages for Google/Naver visibility. Keep these pages useful and factual, and update sitemap.xml/rss.xml when adding or renaming them.

- /markforged-korea: 마크포지드 한국 공식 대리점, 가격, 견적
- /markforged: 마크포지드 단독 브랜드 검색, 한국 도입 가이드
- /carbon-fiber-3d-printer: 탄소섬유 3D 프린터, 연속 섬유 CFR
- /metal-replacement-3d-printing: 금속 대체 3D 프린팅, 알루미늄 부품 대체
- /jigs-fixtures-3d-printing: 지그·픽스처 3D 프린팅, 치공구 제작
- /materials/17-4ph, /materials/316l, /materials/h13: FX10 Metal Kit 금속 재료 검색 대응
