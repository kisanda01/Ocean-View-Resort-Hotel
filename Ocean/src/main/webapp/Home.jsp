<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ocean View Resort | Luxury Stay in Galle</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,200;0,300;0,400;0,600;1,200;1,300;1,400&family=Jost:wght@200;300;400;500&display=swap" rel="stylesheet">

<style>
:root {
  --gold:        #b8965a;
  --gold-light:  #d4b483;
  --gold-pale:   #f0e0c0;
  --gold-glow:   rgba(184,150,90,0.25);
  --dark:        #0e0d0b;
  --dark-2:      #161410;
  --dark-3:      #1e1b16;
  --cream:       #f9f5ee;
  --cream-2:     #f2ebe0;
  --warm-grey:   #e8e0d4;
  --text-body:   #4a4540;
  --text-light:  #8a8278;
  --white:       #ffffff;
  --transition:  cubic-bezier(0.4, 0, 0.2, 1);
  --ease-out:    cubic-bezier(0.16, 1, 0.3, 1);
}
*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
html { scroll-behavior: smooth; font-size: 16px; }
body {
  font-family: 'Jost', sans-serif;
  color: var(--text-body);
  background: var(--dark);
  overflow-x: hidden;
  cursor: none;
}

.cursor {
  position: fixed; z-index: 9999;
  pointer-events: none;
}
.cursor-dot {
  width: 6px; height: 6px;
  background: var(--gold);
  border-radius: 50%;
  position: fixed; top: 0; left: 0;
  transform: translate(-50%, -50%);
  transition: width 0.2s, height 0.2s, background 0.2s;
  z-index: 9999; pointer-events: none;
}
.cursor-ring {
  width: 36px; height: 36px;
  border: 1px solid rgba(184,150,90,0.6);
  border-radius: 50%;
  position: fixed; top: 0; left: 0;
  transform: translate(-50%, -50%);
  transition: transform 0.12s var(--ease-out), width 0.3s, height 0.3s, border-color 0.3s;
  z-index: 9998; pointer-events: none;
}
body.cursor-hover .cursor-dot  { width: 10px; height: 10px; background: var(--gold-light); }
body.cursor-hover .cursor-ring { width: 56px; height: 56px; border-color: rgba(184,150,90,0.9); }

nav {
  position: fixed; top: 0; width: 100%; z-index: 500;
  padding: 28px 60px;
  display: flex; justify-content: space-between; align-items: center;
  transition: all 0.5s var(--transition);
}
nav.scrolled {
  background: rgba(14,13,11,0.92);
  backdrop-filter: blur(20px);
  padding: 18px 60px;
  border-bottom: 1px solid rgba(184,150,90,0.12);
}

.logo {
  font-family: 'Cormorant Garamond', serif;
  font-size: 1.35rem; font-weight: 400;
  letter-spacing: 0.22em; text-transform: uppercase;
  color: var(--white);
  text-decoration: none;
  display: flex; align-items: center; gap: 14px;
}
.logo-divider {
  width: 1px; height: 22px;
  background: rgba(184,150,90,0.5);
}
.logo-sub {
  font-size: 0.58rem; letter-spacing: 0.3em;
  color: var(--gold); font-family: 'Jost', sans-serif;
  font-weight: 300; text-transform: uppercase;
  line-height: 1.3;
}

.nav-links {
  display: flex; align-items: center; gap: 40px;
}
.nav-links a {
  text-decoration: none; color: rgba(255,255,255,0.75);
  font-size: 0.72rem; letter-spacing: 0.2em; text-transform: uppercase;
  font-weight: 300; transition: color 0.3s;
  position: relative;
}
.nav-links a::after {
  content: ''; position: absolute;
  bottom: -4px; left: 0; width: 0; height: 1px;
  background: var(--gold); transition: width 0.35s var(--ease-out);
}
.nav-links a:hover { color: var(--gold); }
.nav-links a:hover::after { width: 100%; }

.nav-cta {
  padding: 10px 26px;
  border: 1px solid rgba(184,150,90,0.6);
  color: var(--gold) !important;
  letter-spacing: 0.18em !important;
  transition: all 0.35s !important;
}
.nav-cta::after { display: none !important; }
.nav-cta:hover {
  background: var(--gold) !important;
  color: var(--dark) !important;
  border-color: var(--gold) !important;
}

.hero {
  position: relative;
  height: 100vh; min-height: 700px;
  display: flex; align-items: center; justify-content: center;
  overflow: hidden;
}

/* Slideshow */
.hero-slides { position: absolute; inset: 0; }
.hero-slide {
  position: absolute; inset: 0;
  background-size: cover; background-position: center;
  opacity: 0;
  transition: opacity 1.8s ease;
  transform: scale(1.05);
  transition: opacity 1.8s ease, transform 10s ease;
}
.hero-slide.active { opacity: 1; transform: scale(1); }

.hero-slide:nth-child(1) { background-image: url('https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=1920&q=80'); }
.hero-slide:nth-child(2) { background-image: url('https://images.unsplash.com/photo-1540541338287-41700207dee6?auto=format&fit=crop&w=1920&q=80'); }
.hero-slide:nth-child(3) { background-image: url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=1920&q=80'); }

/* Multi-layer overlay */
.hero-overlay {
  position: absolute; inset: 0; z-index: 1;
  background:
    linear-gradient(180deg, rgba(14,13,11,0.35) 0%, transparent 30%, transparent 55%, rgba(14,13,11,0.85) 100%),
    linear-gradient(90deg, rgba(14,13,11,0.6) 0%, transparent 60%);
}

/* Grain texture */
.hero-grain {
  position: absolute; inset: 0; z-index: 2;
  opacity: 0.035;
  background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)'/%3E%3C/svg%3E");
  background-size: 180px;
}

/* Scroll indicator */
.hero-scroll {
  position: absolute; bottom: 40px; left: 50%;
  transform: translateX(-50%);
  z-index: 10; display: flex; flex-direction: column; align-items: center; gap: 10px;
  animation: heroFade 2.5s 1.5s ease both;
}
.scroll-line {
  width: 1px; height: 60px;
  background: linear-gradient(to bottom, transparent, var(--gold));
  animation: scrollPulse 2s infinite;
}
.scroll-text {
  font-size: 0.58rem; letter-spacing: 0.3em;
  text-transform: uppercase; color: rgba(255,255,255,0.5);
  writing-mode: horizontal-tb;
}
@keyframes scrollPulse {
  0%,100% { transform: scaleY(1); opacity: 0.7; }
  50% { transform: scaleY(1.15); opacity: 1; }
}

/* Hero slide nav */
.slide-nav {
  position: absolute; bottom: 40px; right: 60px;
  z-index: 10; display: flex; gap: 10px;
}
.slide-dot {
  width: 24px; height: 1px;
  background: rgba(255,255,255,0.3);
  cursor: pointer; transition: all 0.4s;
}
.slide-dot.active { background: var(--gold); width: 44px; }

.hero-content {
  position: relative; z-index: 5;
  text-align: left; padding: 0 60px;
  max-width: 1400px; width: 100%;
}

.hero-eyebrow {
  font-size: 0.62rem; letter-spacing: 0.45em; text-transform: uppercase;
  color: var(--gold); font-family: 'Jost', sans-serif; font-weight: 300;
  margin-bottom: 20px;
  display: flex; align-items: center; gap: 16px;
  animation: heroFade 1.2s 0.3s var(--ease-out) both;
}
.hero-eyebrow::before {
  content: ''; display: block;
  width: 40px; height: 1px; background: var(--gold);
}

.hero-title {
  font-family: 'Cormorant Garamond', serif;
  font-size: clamp(3.5rem, 8vw, 7rem);
  font-weight: 200; color: var(--white);
  line-height: 1.0; letter-spacing: -0.01em;
  margin-bottom: 24px;
  animation: heroFade 1.2s 0.55s var(--ease-out) both;
}
.hero-title em { font-style: italic; color: var(--gold-light); }

.hero-subtitle {
  font-size: 0.9rem; color: rgba(255,255,255,0.6);
  letter-spacing: 0.12em; font-weight: 300;
  max-width: 440px; line-height: 1.8;
  margin-bottom: 44px;
  animation: heroFade 1.2s 0.8s var(--ease-out) both;
}

.hero-btns {
  display: flex; gap: 16px; flex-wrap: wrap;
  animation: heroFade 1.2s 1.05s var(--ease-out) both;
}

.btn-primary {
  display: inline-flex; align-items: center; gap: 12px;
  padding: 16px 40px;
  background: var(--gold); color: var(--dark);
  font-family: 'Jost', sans-serif;
  font-size: 0.7rem; letter-spacing: 0.25em; text-transform: uppercase;
  font-weight: 500; text-decoration: none;
  transition: all 0.4s var(--ease-out);
  position: relative; overflow: hidden;
}
.btn-primary::before {
  content: ''; position: absolute; inset: 0;
  background: var(--gold-light);
  transform: translateX(-101%);
  transition: transform 0.4s var(--ease-out);
}
.btn-primary:hover::before { transform: translateX(0); }
.btn-primary span { position: relative; z-index: 1; }
.btn-primary .btn-arrow { transition: transform 0.3s; position: relative; z-index: 1; }
.btn-primary:hover .btn-arrow { transform: translateX(4px); }

.btn-ghost {
  display: inline-flex; align-items: center; gap: 10px;
  padding: 16px 40px;
  border: 1px solid rgba(255,255,255,0.3); color: var(--white);
  font-family: 'Jost', sans-serif;
  font-size: 0.7rem; letter-spacing: 0.25em; text-transform: uppercase;
  font-weight: 300; text-decoration: none;
  transition: all 0.4s;
}
.btn-ghost:hover { border-color: var(--gold); color: var(--gold); }

@keyframes heroFade {
  from { opacity: 0; transform: translateY(24px); }
  to   { opacity: 1; transform: translateY(0); }
}

.marquee-strip {
  background: var(--gold);
  padding: 14px 0;
  overflow: hidden;
  white-space: nowrap;
}
.marquee-inner {
  display: inline-flex; gap: 0;
  animation: marquee 22s linear infinite;
}
.marquee-inner span {
  font-size: 0.65rem; letter-spacing: 0.35em; text-transform: uppercase;
  color: var(--dark); font-weight: 500; padding: 0 30px;
}
.marquee-inner .sep {
  color: rgba(14,13,11,0.35); padding: 0;
}
@keyframes marquee {
  from { transform: translateX(0); }
  to   { transform: translateX(-50%); }
}

.intro {
  background: var(--cream);
  padding: 130px 60px;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 80px;
  align-items: center;
  position: relative; overflow: hidden;
}
.intro::before {
  content: 'OVR';
  position: absolute; right: -30px; top: 50%; transform: translateY(-50%);
  font-family: 'Cormorant Garamond', serif;
  font-size: 22rem; font-weight: 200; color: rgba(184,150,90,0.06);
  line-height: 1; pointer-events: none; user-select: none;
  white-space: nowrap;
}

.intro-label {
  font-size: 0.6rem; letter-spacing: 0.35em; text-transform: uppercase;
  color: var(--gold); margin-bottom: 18px; font-weight: 400;
  display: flex; align-items: center; gap: 12px;
}
.intro-label::before {
  content: ''; width: 28px; height: 1px; background: var(--gold);
}

.intro-heading {
  font-family: 'Cormorant Garamond', serif;
  font-size: clamp(2rem, 3.5vw, 3.2rem);
  font-weight: 300; color: var(--dark);
  line-height: 1.2; margin-bottom: 28px;
}
.intro-heading em { font-style: italic; color: var(--gold); }

.intro-text {
  font-size: 0.88rem; color: var(--text-light);
  line-height: 1.9; margin-bottom: 36px; font-weight: 300;
}

.intro-stats {
  display: grid; grid-template-columns: repeat(3,1fr); gap: 0;
  border-top: 1px solid var(--warm-grey);
  padding-top: 36px; margin-top: 36px;
}
.stat-item { text-align: center; padding: 0 20px; border-right: 1px solid var(--warm-grey); }
.stat-item:first-child { padding-left: 0; }
.stat-item:last-child  { border-right: none; padding-right: 0; }
.stat-num {
  font-family: 'Cormorant Garamond', serif;
  font-size: 2.6rem; font-weight: 300; color: var(--gold);
  line-height: 1; display: block;
}
.stat-label { font-size: 0.62rem; letter-spacing: 0.2em; text-transform: uppercase; color: var(--text-light); margin-top: 6px; display: block; }

.intro-image-wrap {
  position: relative;
}
.intro-image-main {
  width: 100%; height: 560px;
  object-fit: cover;
  display: block;
}
.intro-image-accent {
  position: absolute; bottom: -30px; left: -30px;
  width: 200px; height: 260px;
  object-fit: cover;
  border: 6px solid var(--cream);
  box-shadow: 0 20px 60px rgba(0,0,0,0.15);
}
.intro-badge {
  position: absolute; top: 30px; right: -20px;
  width: 110px; height: 110px; border-radius: 50%;
  background: var(--gold);
  display: flex; flex-direction: column; align-items: center; justify-content: center;
  text-align: center;
  box-shadow: 0 8px 32px var(--gold-glow);
}
.intro-badge span:first-child {
  font-family: 'Cormorant Garamond', serif;
  font-size: 1.8rem; font-weight: 300; color: var(--dark); line-height: 1;
}
.intro-badge span:last-child {
  font-size: 0.52rem; letter-spacing: 0.18em; text-transform: uppercase; color: rgba(14,13,11,0.65);
}

.rooms-section {
  background: var(--dark);
  padding: 120px 60px;
}

.section-header {
  display: flex; justify-content: space-between; align-items: flex-end;
  margin-bottom: 60px;
}
.section-label {
  font-size: 0.6rem; letter-spacing: 0.4em; text-transform: uppercase;
  color: var(--gold); margin-bottom: 14px; font-weight: 300;
  display: flex; align-items: center; gap: 12px;
}
.section-label::before { content: ''; width: 24px; height: 1px; background: var(--gold); }

.section-heading {
  font-family: 'Cormorant Garamond', serif;
  font-size: clamp(2rem, 3vw, 2.8rem); font-weight: 300;
  color: var(--white); line-height: 1.2;
}
.section-heading em { font-style: italic; color: var(--gold-light); }

.rooms-grid {
  display: grid;
  grid-template-columns: 1.4fr 1fr 1fr;
  gap: 2px;
  height: 680px;
}

.room-card {
  position: relative; overflow: hidden;
  cursor: pointer;
  group: '';
}

.room-card img {
  width: 100%; height: 100%;
  object-fit: cover;
  transition: transform 0.9s var(--ease-out);
  display: block;
}
.room-card:hover img { transform: scale(1.08); }

.room-card-overlay {
  position: absolute; inset: 0;
  background: linear-gradient(180deg, transparent 30%, rgba(14,13,11,0.92) 100%);
  transition: opacity 0.4s;
}

.room-card-content {
  position: absolute; bottom: 0; left: 0; right: 0;
  padding: 36px 30px;
}
.room-card-type {
  font-size: 0.58rem; letter-spacing: 0.3em; text-transform: uppercase;
  color: var(--gold); margin-bottom: 8px;
}
.room-card-name {
  font-family: 'Cormorant Garamond', serif;
  font-size: 1.5rem; font-weight: 300; color: var(--white);
  margin-bottom: 10px; line-height: 1.2;
}
.room-card-price {
  font-size: 0.72rem; color: rgba(255,255,255,0.5);
  letter-spacing: 0.08em;
}
.room-card-price strong { color: var(--gold-light); font-weight: 300; font-size: 1rem; }

.room-card-cta {
  display: inline-flex; align-items: center; gap: 8px;
  margin-top: 16px; padding: 10px 22px;
  border: 1px solid rgba(184,150,90,0.5);
  color: var(--gold); font-size: 0.65rem; letter-spacing: 0.2em;
  text-transform: uppercase; text-decoration: none;
  opacity: 0; transform: translateY(12px);
  transition: all 0.4s var(--ease-out);
}
.room-card:hover .room-card-cta { opacity: 1; transform: translateY(0); }
.room-card-cta:hover { background: var(--gold); color: var(--dark); }

.experience-section {
  background: var(--cream);
  padding: 130px 60px;
}

.exp-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 2px;
  margin-top: 60px;
}

.exp-card {
  position: relative;
  overflow: hidden;
  aspect-ratio: 3/4;
}
.exp-card img {
  width: 100%; height: 100%;
  object-fit: cover;
  transition: transform 0.8s var(--ease-out);
  display: block;
  filter: brightness(0.75);
}
.exp-card:hover img { transform: scale(1.06); filter: brightness(0.6); }

.exp-card-body {
  position: absolute; inset: 0;
  padding: 36px 30px;
  display: flex; flex-direction: column; justify-content: flex-end;
}
.exp-number {
  font-family: 'Cormorant Garamond', serif;
  font-size: 5rem; font-weight: 200;
  color: rgba(255,255,255,0.08);
  line-height: 1; margin-bottom: auto;
  transition: color 0.4s;
}
.exp-card:hover .exp-number { color: rgba(184,150,90,0.2); }
.exp-icon { font-size: 1.6rem; margin-bottom: 12px; }
.exp-title {
  font-family: 'Cormorant Garamond', serif;
  font-size: 1.6rem; font-weight: 300; color: var(--white);
  margin-bottom: 10px;
}
.exp-desc {
  font-size: 0.78rem; color: rgba(255,255,255,0.6);
  line-height: 1.7; font-weight: 300;
  max-height: 0; overflow: hidden;
  transition: max-height 0.5s var(--ease-out), opacity 0.4s;
  opacity: 0;
}
.exp-card:hover .exp-desc { max-height: 100px; opacity: 1; }

.feature-block {
  display: grid;
  grid-template-columns: 1fr 1fr;
  min-height: 620px;
}
.feature-block.reverse { direction: rtl; }
.feature-block.reverse > * { direction: ltr; }

.feature-image {
  position: relative; overflow: hidden;
}
.feature-image img {
  width: 100%; height: 100%;
  object-fit: cover; display: block;
  transition: transform 1s var(--ease-out);
}
.feature-image:hover img { transform: scale(1.04); }

/* Diagonal clip */
.feature-block:not(.reverse) .feature-image::after {
  content: '';
  position: absolute; top: 0; right: -1px; bottom: 0;
  width: 80px;
  background: var(--cream-alt, var(--cream));
  clip-path: polygon(60% 0, 100% 0, 100% 100%, 0% 100%);
}
.feature-block.alt { background: var(--dark); }
.feature-block.alt .feature-image::after { background: var(--dark); }

.feature-content {
  padding: 80px 80px;
  display: flex; flex-direction: column; justify-content: center;
  background: var(--cream);
}
.feature-block.alt .feature-content { background: var(--dark); }
.feature-block.alt .feature-heading { color: var(--white); }
.feature-block.alt .feature-text    { color: rgba(255,255,255,0.5); }

.feature-tag {
  font-size: 0.58rem; letter-spacing: 0.4em; text-transform: uppercase;
  color: var(--gold); margin-bottom: 18px; font-weight: 300;
  display: flex; align-items: center; gap: 10px;
}
.feature-tag::before { content: '—'; color: rgba(184,150,90,0.5); }

.feature-heading {
  font-family: 'Cormorant Garamond', serif;
  font-size: clamp(1.8rem, 2.8vw, 2.6rem); font-weight: 300;
  color: var(--dark); line-height: 1.25; margin-bottom: 22px;
}
.feature-heading em { font-style: italic; color: var(--gold); }

.feature-text {
  font-size: 0.87rem; color: var(--text-light);
  line-height: 1.9; margin-bottom: 36px; font-weight: 300;
}

.btn-outline {
  display: inline-flex; align-items: center; gap: 10px;
  padding: 14px 34px;
  border: 1px solid currentColor;
  font-size: 0.68rem; letter-spacing: 0.22em; text-transform: uppercase;
  font-weight: 400; text-decoration: none;
  color: var(--dark); transition: all 0.4s var(--ease-out);
  align-self: flex-start;
}
.btn-outline .arrow { transition: transform 0.3s; }
.btn-outline:hover { background: var(--dark); color: var(--white); }
.btn-outline:hover .arrow { transform: translateX(4px); }
.feature-block.alt .btn-outline { color: var(--gold); border-color: rgba(184,150,90,0.5); }
.feature-block.alt .btn-outline:hover { background: var(--gold); color: var(--dark); border-color: var(--gold); }

.testimonials {
  background: var(--dark-3);
  padding: 120px 60px;
  position: relative; overflow: hidden;
}
.testimonials::before {
  content: '"';
  position: absolute; top: -40px; left: 40px;
  font-family: 'Cormorant Garamond', serif;
  font-size: 30rem; font-weight: 200;
  color: rgba(184,150,90,0.04); line-height: 1;
  pointer-events: none;
}

.testimonials-grid {
  display: grid; grid-template-columns: repeat(3,1fr); gap: 32px;
  margin-top: 60px;
}

.testimonial-card {
  padding: 40px 36px;
  border: 1px solid rgba(184,150,90,0.12);
  background: rgba(255,255,255,0.02);
  transition: all 0.4s;
  position: relative;
}
.testimonial-card::before {
  content: '';
  position: absolute; top: 0; left: 0;
  width: 0; height: 2px;
  background: linear-gradient(90deg, var(--gold), var(--gold-light));
  transition: width 0.5s var(--ease-out);
}
.testimonial-card:hover::before { width: 100%; }
.testimonial-card:hover { border-color: rgba(184,150,90,0.25); background: rgba(255,255,255,0.035); }

.tcard-stars {
  display: flex; gap: 4px; margin-bottom: 20px;
}
.tcard-stars span { color: var(--gold); font-size: 0.85rem; }

.tcard-text {
  font-family: 'Cormorant Garamond', serif;
  font-size: 1.1rem; font-weight: 300;
  color: rgba(255,255,255,0.75); line-height: 1.7;
  font-style: italic; margin-bottom: 28px;
}

.tcard-author {
  display: flex; align-items: center; gap: 14px;
  padding-top: 22px; border-top: 1px solid rgba(255,255,255,0.06);
}
.tcard-avatar {
  width: 44px; height: 44px; border-radius: 50%;
  object-fit: cover;
  border: 2px solid rgba(184,150,90,0.3);
}
.tcard-name { font-size: 0.78rem; color: var(--white); font-weight: 400; }
.tcard-origin { font-size: 0.65rem; color: var(--text-light); margin-top: 2px; letter-spacing: 0.08em; }

.cta-section {
  position: relative; overflow: hidden;
  height: 580px;
  display: flex; align-items: center; justify-content: center;
}
.cta-bg {
  position: absolute; inset: 0;
  background-image: url('https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?auto=format&fit=crop&w=1920&q=80');
  background-size: cover; background-position: center;
  transform: scale(1.1);
  transition: transform 15s ease;
}
.cta-section:hover .cta-bg { transform: scale(1.0); }
.cta-overlay {
  position: absolute; inset: 0;
  background: rgba(14,13,11,0.72);
}
.cta-content {
  position: relative; z-index: 2;
  text-align: center; max-width: 700px; padding: 0 30px;
}
.cta-content .section-label { justify-content: center; }
.cta-content .section-label::before { display: none; }
.cta-heading {
  font-family: 'Cormorant Garamond', serif;
  font-size: clamp(2.4rem, 5vw, 4.2rem);
  font-weight: 200; color: var(--white); line-height: 1.1;
  margin: 16px 0 28px;
}
.cta-heading em { color: var(--gold-light); font-style: italic; }
.cta-sub {
  font-size: 0.85rem; color: rgba(255,255,255,0.55);
  line-height: 1.8; font-weight: 300; margin-bottom: 40px;
}
.cta-form {
  display: flex; gap: 2px; max-width: 480px; margin: 0 auto;
}
.cta-form input {
  flex: 1; padding: 16px 22px;
  background: rgba(255,255,255,0.1); border: 1px solid rgba(255,255,255,0.2);
  color: var(--white); font-family: 'Jost', sans-serif;
  font-size: 0.8rem; outline: none; transition: border-color 0.3s;
}
.cta-form input::placeholder { color: rgba(255,255,255,0.35); }
.cta-form input:focus { border-color: var(--gold); }
.cta-form button {
  padding: 16px 28px;
  background: var(--gold); border: none; cursor: pointer;
  font-family: 'Jost', sans-serif; font-size: 0.7rem;
  letter-spacing: 0.2em; text-transform: uppercase;
  color: var(--dark); font-weight: 500; transition: background 0.3s;
  white-space: nowrap;
}
.cta-form button:hover { background: var(--gold-light); }

.awards-strip {
  background: var(--cream);
  padding: 60px;
  display: flex; align-items: center; justify-content: center; gap: 70px;
  flex-wrap: wrap;
  border-top: 1px solid var(--warm-grey);
  border-bottom: 1px solid var(--warm-grey);
}
.award-item {
  text-align: center; opacity: 0.45;
  transition: opacity 0.3s;
}
.award-item:hover { opacity: 0.75; }
.award-item .award-icon { font-size: 2rem; margin-bottom: 8px; }
.award-item .award-name {
  font-size: 0.58rem; letter-spacing: 0.25em; text-transform: uppercase;
  color: var(--text-light);
}

.gallery-section {
  background: var(--dark);
  padding: 120px 60px;
}
.gallery-mosaic {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-template-rows: 280px 280px;
  gap: 3px;
  margin-top: 60px;
}
.gallery-tile {
  position: relative; overflow: hidden; cursor: pointer;
}
.gallery-tile:nth-child(1) { grid-column: span 2; grid-row: span 2; }
.gallery-tile:nth-child(5) { grid-column: span 2; }
.gallery-tile img {
  width: 100%; height: 100%; object-fit: cover;
  transition: transform 0.7s var(--ease-out), filter 0.4s;
  display: block;
}
.gallery-tile:hover img { transform: scale(1.08); filter: brightness(0.7); }
.gallery-tile-overlay {
  position: absolute; inset: 0;
  background: rgba(14,13,11,0);
  transition: background 0.4s;
  display: flex; align-items: center; justify-content: center;
}
.gallery-tile:hover .gallery-tile-overlay { background: rgba(14,13,11,0.3); }
.gallery-tile-label {
  font-family: 'Cormorant Garamond', serif;
  font-size: 1.1rem; color: var(--white);
  letter-spacing: 0.1em; opacity: 0;
  transform: translateY(10px);
  transition: all 0.4s var(--ease-out);
}
.gallery-tile:hover .gallery-tile-label { opacity: 1; transform: translateY(0); }

footer {
  background: var(--dark-2);
  border-top: 1px solid rgba(184,150,90,0.1);
}

.footer-top {
  display: grid;
  grid-template-columns: 1.4fr 1fr 1fr 1fr;
  gap: 60px;
  padding: 80px 60px 60px;
  border-bottom: 1px solid rgba(255,255,255,0.05);
}

.footer-brand .logo { margin-bottom: 18px; display: inline-flex; }
.footer-brand p {
  font-size: 0.78rem; color: var(--text-light);
  line-height: 1.9; font-weight: 300; max-width: 280px;
}
.footer-social {
  display: flex; gap: 14px; margin-top: 28px;
}
.social-link {
  width: 38px; height: 38px; border-radius: 50%;
  border: 1px solid rgba(255,255,255,0.1);
  display: flex; align-items: center; justify-content: center;
  color: var(--text-light); font-size: 0.85rem; text-decoration: none;
  transition: all 0.3s;
}
.social-link:hover { border-color: var(--gold); color: var(--gold); }

.footer-col h4 {
  font-size: 0.6rem; letter-spacing: 0.3em; text-transform: uppercase;
  color: var(--gold); margin-bottom: 22px; font-weight: 400;
}
.footer-col a, .footer-col p {
  display: block; margin-bottom: 12px;
  font-size: 0.8rem; color: var(--text-light);
  text-decoration: none; font-weight: 300; transition: color 0.3s;
  line-height: 1.6;
}
.footer-col a:hover { color: var(--gold-light); }

.footer-bottom {
  padding: 28px 60px;
  display: flex; align-items: center; justify-content: space-between;
}
.footer-copy {
  font-size: 0.65rem; letter-spacing: 0.1em; text-transform: uppercase;
  color: rgba(255,255,255,0.2);
}
.footer-links {
  display: flex; gap: 28px;
}
.footer-links a {
  font-size: 0.65rem; color: rgba(255,255,255,0.2);
  text-decoration: none; transition: color 0.3s;
}
.footer-links a:hover { color: var(--gold); }

.reveal {
  opacity: 0; transform: translateY(36px);
  transition: opacity 0.9s var(--ease-out), transform 0.9s var(--ease-out);
}
.reveal.revealed { opacity: 1; transform: none; }
.reveal-delay-1 { transition-delay: 0.12s; }
.reveal-delay-2 { transition-delay: 0.24s; }
.reveal-delay-3 { transition-delay: 0.36s; }

.burger {
  display: none; flex-direction: column; gap: 5px; cursor: pointer;
  background: none; border: none; padding: 4px;
}
.burger span { display: block; width: 22px; height: 1px; background: var(--white); transition: all 0.3s; }

@media (max-width: 1024px) {
  nav { padding: 22px 36px; }
  nav.scrolled { padding: 16px 36px; }
  .hero-content { padding: 0 36px; }
  .intro { padding: 90px 36px; grid-template-columns: 1fr; gap: 60px; }
  .rooms-section, .experience-section, .gallery-section, .testimonials { padding: 90px 36px; }
  .rooms-grid { grid-template-columns: 1fr 1fr; height: auto; }
  .rooms-grid .room-card { height: 400px; }
  .rooms-grid .room-card:first-child { grid-column: span 2; height: 480px; }
  .exp-grid { grid-template-columns: 1fr 1fr; }
  .feature-block { grid-template-columns: 1fr; }
  .feature-block.reverse { direction: ltr; }
  .feature-image { height: 400px; }
  .feature-block:not(.reverse) .feature-image::after { display: none; }
  .footer-top { grid-template-columns: 1fr 1fr; gap: 40px; padding: 60px 36px; }
  .footer-bottom { padding: 22px 36px; flex-direction: column; gap: 14px; text-align: center; }
  .gallery-mosaic { grid-template-rows: 200px 200px; }
}
@media (max-width: 768px) {
  nav { padding: 18px 24px; }
  nav.scrolled { padding: 14px 24px; }
  .nav-links { display: none; }
  .burger { display: flex; }
  .hero-content { padding: 0 24px; }
  .hero-title { font-size: clamp(2.6rem, 10vw, 4rem); }
  .intro { padding: 70px 24px; }
  .rooms-section,.experience-section,.gallery-section,.testimonials,.cta-section { padding: 70px 24px; }
  .rooms-grid { grid-template-columns: 1fr; }
  .rooms-grid .room-card { height: 360px; }
  .rooms-grid .room-card:first-child { grid-column: span 1; }
  .exp-grid, .testimonials-grid { grid-template-columns: 1fr; }
  .gallery-mosaic { grid-template-columns: 1fr 1fr; grid-template-rows: repeat(4, 180px); }
  .gallery-tile:nth-child(1) { grid-column: span 2; grid-row: span 1; }
  .gallery-tile:nth-child(5) { grid-column: span 2; }
  .feature-content { padding: 50px 24px; }
  .footer-top { grid-template-columns: 1fr; padding: 50px 24px; }
  .awards-strip { padding: 40px 24px; gap: 40px; }
  .intro-stats { grid-template-columns: repeat(3,1fr); }
  .cta-form { flex-direction: column; }
  body { cursor: auto; }
  .cursor-dot,.cursor-ring { display: none; }
}
</style>
</head>
<body>

<!-- CURSOR -->
<div class="cursor-dot"  id="cursorDot"></div>
<div class="cursor-ring" id="cursorRing"></div>

<!-- ═══ NAVIGATION ═══ -->
<nav id="mainNav">
  <a href="Home.jsp" class="logo">
    Ocean View
    <div class="logo-divider"></div>
    <div class="logo-sub">Resort<br>Galle</div>
  </a>
  <div class="nav-links">
    <a href="#">Rooms &amp; Suites</a>
    <a href="#experience">Experiences</a>
    <a href="#dining">Dining</a>
    <a href="#gallery">Gallery</a>
    <a href="log.jsp" class="nav-cta">Staff Portal</a>
  </div>
  <button class="burger" id="burger" aria-label="Menu">
    <span></span><span></span><span></span>
  </button>
</nav>

<!-- ═══ HERO ═══ -->
<section class="hero">
  <div class="hero-slides">
    <div class="hero-slide active"></div>
    <div class="hero-slide"></div>
    <div class="hero-slide"></div>
  </div>
  <div class="hero-overlay"></div>
  <div class="hero-grain"></div>

  <div class="hero-content">
    <div class="hero-eyebrow">Galle Fort, Sri Lanka &nbsp;·&nbsp; Est. 2008</div>
    <h1 class="hero-title">
      Where the Ocean<br>
      <em>Meets Elegance</em>
    </h1>
    <p class="hero-subtitle">
      A sanctuary of refined luxury set against the timeless beauty of the Indian Ocean. Discover a world apart.
    </p>
    <div class="hero-btns">
      <a href="Reservation.jsp" class="btn-primary">
        <span>Reserve Your Stay</span>
        <span class="btn-arrow">→</span>
      </a>
      <a href="#rooms" class="btn-ghost">Explore Rooms</a>
    </div>
  </div>

  <div class="slide-nav">
    <div class="slide-dot active" onclick="goToSlide(0)"></div>
    <div class="slide-dot" onclick="goToSlide(1)"></div>
    <div class="slide-dot" onclick="goToSlide(2)"></div>
  </div>

  <div class="hero-scroll">
    <div class="scroll-line"></div>
    <div class="scroll-text">Scroll</div>
  </div>
</section>

<!-- ═══ MARQUEE ═══ -->
<div class="marquee-strip" aria-hidden="true">
  <div class="marquee-inner">
    <span>Luxury Stays</span><span class="sep">◆</span>
    <span>Ocean Views</span><span class="sep">◆</span>
    <span>Fine Dining</span><span class="sep">◆</span>
    <span>Spa &amp; Wellness</span><span class="sep">◆</span>
    <span>Galle Fort</span><span class="sep">◆</span>
    <span>Sri Lanka</span><span class="sep">◆</span>
    <span>World Class</span><span class="sep">◆</span>
    <span>Unforgettable</span><span class="sep">◆</span>
    <!-- Duplicate for seamless loop -->
    <span>Luxury Stays</span><span class="sep">◆</span>
    <span>Ocean Views</span><span class="sep">◆</span>
    <span>Fine Dining</span><span class="sep">◆</span>
    <span>Spa &amp; Wellness</span><span class="sep">◆</span>
    <span>Galle Fort</span><span class="sep">◆</span>
    <span>Sri Lanka</span><span class="sep">◆</span>
    <span>World Class</span><span class="sep">◆</span>
    <span>Unforgettable</span><span class="sep">◆</span>
  </div>
</div>

<!-- ═══ INTRO ═══ -->
<section class="intro">
  <div class="reveal">
    <div class="intro-label">Our Story</div>
    <h2 class="intro-heading">
      A Sanctuary<br>on the <em>Southern Coast</em>
    </h2>
    <p class="intro-text">
      Nestled within the storied walls of Galle Fort, Ocean View Resort is more than a hotel — it is an immersion into beauty, culture, and flawless hospitality. Every detail, from the hand-laid coral stone walls to the infinity pool that dissolves into the horizon, has been crafted to elevate your senses.
    </p>
    <p class="intro-text">
      For over 15 years, we have welcomed discerning travellers who seek the extraordinary. A place where mornings are greeted by the sound of waves, and evenings glow with the warmth of a Sri Lankan sunset.
    </p>
    <a href="#rooms" class="btn-outline">
      <span>Explore The Resort</span>
      <span class="arrow">→</span>
    </a>
    <div class="intro-stats">
      <div class="stat-item">
        <span class="stat-num">48</span>
        <span class="stat-label">Private Suites</span>
      </div>
      <div class="stat-item">
        <span class="stat-num">15+</span>
        <span class="stat-label">Years of Excellence</span>
      </div>
      <div class="stat-item">
        <span class="stat-num">4.9</span>
        <span class="stat-label">Guest Rating</span>
      </div>
    </div>
  </div>

  <div class="reveal reveal-delay-1">
    <div class="intro-image-wrap">
      <img class="intro-image-main"
           src="https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?auto=format&fit=crop&w=900&q=80"
           alt="Ocean View Resort exterior">
      <img class="intro-image-accent"
           src="https://images.unsplash.com/photo-1540541338287-41700207dee6?auto=format&fit=crop&w=400&q=80"
           alt="Resort detail">
      <div class="intro-badge">
        <span>★ 5</span>
        <span>Luxury<br>Resort</span>
      </div>
    </div>
  </div>
</section>

<!-- ═══ AWARDS STRIP ═══ -->
<div class="awards-strip">
  <div class="award-item">
    <div class="award-icon">🏆</div>
    <div class="award-name">Best Resort<br>Sri Lanka 2024</div>
  </div>
  <div class="award-item">
    <div class="award-icon">🌿</div>
    <div class="award-name">Green Globe<br>Certified</div>
  </div>
  <div class="award-item">
    <div class="award-icon">⭐</div>
    <div class="award-name">Condé Nast<br>Traveller Gold</div>
  </div>
  <div class="award-item">
    <div class="award-icon">🍽️</div>
    <div class="award-name">Michelin<br>Recommended</div>
  </div>
  <div class="award-item">
    <div class="award-icon">💎</div>
    <div class="award-name">Forbes Travel<br>Five Star</div>
  </div>
</div>

<!-- ═══ ROOMS ═══ -->
<section class="rooms-section" id="rooms">
  <div class="section-header">
    <div class="reveal">
      <div class="section-label">Accommodation</div>
      <h2 class="section-heading">
        Rooms &amp; <em>Suites</em>
      </h2>
    </div>
    <a href="reservation.html" class="btn-ghost reveal reveal-delay-1" style="color:rgba(255,255,255,0.5); font-size:0.72rem; letter-spacing:0.16em;">
      View All Rooms →
    </a>
  </div>

  <div class="rooms-grid reveal">
    <div class="room-card">
      <img src="https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=1200&q=80" alt="Oceanfront Suite">
      <div class="room-card-overlay"></div>
      <div class="room-card-content">
        <div class="room-card-type">Signature Room</div>
        <div class="room-card-name">Oceanfront Suite</div>
        <div class="room-card-price">From <strong>LKR 22,000</strong> / night</div>
        <a href="reservation.html" class="room-card-cta">Book Now →</a>
      </div>
    </div>
    <div class="room-card">
      <img src="https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=800&q=80" alt="Deluxe Room">
      <div class="room-card-overlay"></div>
      <div class="room-card-content">
        <div class="room-card-type">Premium</div>
        <div class="room-card-name">Deluxe Ocean View</div>
        <div class="room-card-price">From <strong>LKR 12,000</strong> / night</div>
        <a href="reservation.html" class="room-card-cta">Book Now →</a>
      </div>
    </div>
    <div class="room-card">
      <img src="https://images.unsplash.com/photo-1591088398332-8596b4e9b4f3?auto=format&fit=crop&w=800&q=80" alt="Presidential Suite">
      <div class="room-card-overlay"></div>
      <div class="room-card-content">
        <div class="room-card-type">Ultimate Luxury</div>
        <div class="room-card-name">Presidential Suite</div>
        <div class="room-card-price">From <strong>LKR 45,000</strong> / night</div>
        <a href="reservation.html" class="room-card-cta">Book Now →</a>
      </div>
    </div>
  </div>
</section>

<!-- ═══ EXPERIENCE ═══ -->
<section class="experience-section" id="experience">
  <div class="section-header">
    <div class="reveal">
      <div class="section-label" style="color: var(--gold);">Curated Experiences</div>
      <h2 class="section-heading" style="color: var(--dark);">
        Life at <em>Ocean View</em>
      </h2>
    </div>
  </div>

  <div class="exp-grid">
    <div class="exp-card reveal">
      <img src="https://images.unsplash.com/photo-1544161515-4ab6ce6db874?auto=format&fit=crop&w=600&q=80" alt="Spa">
      <div class="exp-card-body">
        <div class="exp-number">01</div>
        <div class="exp-icon">🌸</div>
        <div class="exp-title">Ayurvedic Spa</div>
        <div class="exp-desc">Ancient Sri Lankan healing rituals reimagined for the modern traveller. Five-star therapists, rare botanicals, oceanside treatment rooms.</div>
      </div>
    </div>
    <div class="exp-card reveal reveal-delay-1">
      <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=600&q=80" alt="Dining">
      <div class="exp-card-body">
        <div class="exp-number">02</div>
        <div class="exp-icon">🍽️</div>
        <div class="exp-title">Fine Dining</div>
        <div class="exp-desc">Culinary artistry celebrating the rich flavours of Sri Lanka. Fresh-caught seafood, handpicked spices, and an award-winning wine cellar.</div>
      </div>
    </div>
    <div class="exp-card reveal reveal-delay-2">
      <img src="https://images.unsplash.com/photo-1519046904884-53103b34b206?auto=format&fit=crop&w=600&q=80" alt="Water Sports">
      <div class="exp-card-body">
        <div class="exp-number">03</div>
        <div class="exp-icon">🌊</div>
        <div class="exp-title">Ocean Adventures</div>
        <div class="exp-desc">Diving, surfing, whale watching, and sunset sailing. The Indian Ocean is your playground — our expert guides ensure it is unforgettable.</div>
      </div>
    </div>
  </div>
</section>

<!-- ═══ FEATURE BLOCKS ═══ -->
<div class="feature-block" id="dining">
  <div class="feature-image reveal">
    <img src="https://images.unsplash.com/photo-1414235077428-338989a2e8c0?auto=format&fit=crop&w=1000&q=80" alt="Restaurant">
  </div>
  <div class="feature-content">
    <div class="feature-tag">Gastronomy</div>
    <h3 class="feature-heading reveal">
      Where <em>Every Meal</em><br>
      Tells a Story
    </h3>
    <p class="feature-text reveal reveal-delay-1">
      Our oceanside restaurant is a celebration of Sri Lanka's extraordinary culinary heritage. Chef Nimal Perera and his team source directly from local fishermen and highland farms, crafting menus that change with the tides and seasons.
    </p>
    <p class="feature-text reveal reveal-delay-2">
      From spiced coconut curries at sunrise to candlelit seafood dinners as waves lap below — dining here is not a meal, it is a memory.
    </p>
    <a href="#" class="btn-outline reveal reveal-delay-3">
      <span>View Our Menus</span>
      <span class="arrow">→</span>
    </a>
  </div>
</div>

<div class="feature-block reverse alt">
  <div class="feature-image reveal">
    <img src="https://images.unsplash.com/photo-1544161515-4ab6ce6db874?auto=format&fit=crop&w=1000&q=80" alt="Spa Treatment">
  </div>
  <div class="feature-content">
    <div class="feature-tag">Wellness</div>
    <h3 class="feature-heading reveal">
      The Art of<br><em>Pure Restoration</em>
    </h3>
    <p class="feature-text reveal reveal-delay-1">
      Our Ayurvedic spa draws from 3,000-year-old healing traditions of the island. Oceanside treatment pavilions, a thermal pool, and a team of master therapists await to restore your body and quiet your mind.
    </p>
    <a href="#" class="btn-outline reveal reveal-delay-2">
      <span>Explore Spa</span>
      <span class="arrow">→</span>
    </a>
  </div>
</div>

<!-- ═══ TESTIMONIALS ═══ -->
<section class="testimonials">
  <div class="section-header">
    <div class="reveal">
      <div class="section-label" style="color:var(--gold)">Guest Stories</div>
      <h2 class="section-heading">Words from <em>Our Guests</em></h2>
    </div>
  </div>

  <div class="testimonials-grid">
    <div class="testimonial-card reveal">
      <div class="tcard-stars">
        <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
      </div>
      <p class="tcard-text">
        "An absolute dream. The sunrise from our suite, the sound of the ocean, the staff who remembered our names from the first moment — Ocean View Resort is in a class entirely its own."
      </p>
      <div class="tcard-author">
        <img class="tcard-avatar" src="https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&w=100&q=80" alt="Sarah M">
        <div>
          <div class="tcard-name">Sarah M.</div>
          <div class="tcard-origin">London, United Kingdom</div>
        </div>
      </div>
    </div>

    <div class="testimonial-card reveal reveal-delay-1">
      <div class="tcard-stars">
        <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
      </div>
      <p class="tcard-text">
        "We have stayed at many five-star hotels around the world, but Ocean View feels truly special. The combination of history, natural beauty and genuine care is rare and wonderful."
      </p>
      <div class="tcard-author">
        <img class="tcard-avatar" src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=crop&w=100&q=80" alt="Marcus L">
        <div>
          <div class="tcard-name">Marcus &amp; Priya L.</div>
          <div class="tcard-origin">Sydney, Australia</div>
        </div>
      </div>
    </div>

    <div class="testimonial-card reveal reveal-delay-2">
      <div class="tcard-stars">
        <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
      </div>
      <p class="tcard-text">
        "The Ayurvedic spa alone is worth the trip. After three treatments I felt completely reborn. The oceanview suite was the most beautiful room I have ever stayed in. We will return."
      </p>
      <div class="tcard-author">
        <img class="tcard-avatar" src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=100&q=80" alt="Yuki T">
        <div>
          <div class="tcard-name">Yuki T.</div>
          <div class="tcard-origin">Tokyo, Japan</div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ═══ GALLERY ═══ -->
<section class="gallery-section" id="gallery">
  <div class="section-header reveal">
    <div>
      <div class="section-label">Visual Journey</div>
      <h2 class="section-heading">Life at the <em>Resort</em></h2>
    </div>
    <a href="#" class="btn-ghost reveal" style="color:rgba(255,255,255,0.4); font-size:0.72rem; letter-spacing:0.16em;">
      Full Gallery →
    </a>
  </div>

  <div class="gallery-mosaic reveal">
    <div class="gallery-tile">
      <img src="https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?auto=format&fit=crop&w=900&q=80" alt="Pool">
      <div class="gallery-tile-overlay"><span class="gallery-tile-label">Infinity Pool</span></div>
    </div>
    <div class="gallery-tile">
      <img src="https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?auto=format&fit=crop&w=600&q=80" alt="Room">
      <div class="gallery-tile-overlay"><span class="gallery-tile-label">Ocean Suite</span></div>
    </div>
    <div class="gallery-tile">
      <img src="https://images.unsplash.com/photo-1414235077428-338989a2e8c0?auto=format&fit=crop&w=600&q=80" alt="Dining">
      <div class="gallery-tile-overlay"><span class="gallery-tile-label">Fine Dining</span></div>
    </div>
    <div class="gallery-tile">
      <img src="https://images.unsplash.com/photo-1519046904884-53103b34b206?auto=format&fit=crop&w=600&q=80" alt="Beach">
      <div class="gallery-tile-overlay"><span class="gallery-tile-label">Private Beach</span></div>
    </div>
    <div class="gallery-tile">
      <img src="https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=1200&q=80" alt="Sunset">
      <div class="gallery-tile-overlay"><span class="gallery-tile-label">Ocean Sunsets</span></div>
    </div>
  </div>
</section>

<!-- ═══ CTA ═══ -->
<section class="cta-section">
  <div class="cta-bg"></div>
  <div class="cta-overlay"></div>
  <div class="cta-content">
    <div class="section-label" style="justify-content:center; color:var(--gold);">
      Limited Availability
    </div>
    <h2 class="cta-heading">
      Begin Your<br><em>Story Here</em>
    </h2>
    <p class="cta-sub">
      Reserve your suite at Ocean View Resort and experience the most beautiful corner of Sri Lanka. Special rates available for extended stays.
    </p>
    <div class="cta-form">
      <input type="email" placeholder="Your email address">
      <button type="button" onclick="window.location='reservation.html'">Reserve Now</button>
    </div>
  </div>
</section>

<!-- ═══ FOOTER ═══ -->
<footer>
  <div class="footer-top">
    <div class="footer-brand">
      <a href="#" class="logo" style="color:var(--white)">
        Ocean View
        <div class="logo-divider"></div>
        <div class="logo-sub">Resort<br>Galle</div>
      </a>
      <p>A world-class luxury resort set within the historic Galle Fort on the southern coast of Sri Lanka. Redefining the art of hospitality since 2008.</p>
      <div class="footer-social">
        <a class="social-link" href="www.instagram.com" aria-label="Instagram">Ig</a>
        <a class="social-link" href="www.facebook.com" aria-label="Facebook">Fb</a>
        <a class="social-link" href="www.x.com" aria-label="Twitter">𝕏</a>
        <a class="social-link" href="www.tripadvisor.com" aria-label="TripAdvisor">Ta</a>
      </div>
    </div>

    <div class="footer-col">
      <h4>Explore</h4>
      <a href="#rooms">Rooms &amp; Suites</a>
      <a href="#experience">Dining</a>
      <a href="#experience">Spa &amp; Wellness</a>
      <a href="#experience">Ocean Adventures</a>
      <a href="#gallery">Photo Gallery</a>
    </div>

    <div class="footer-col">
      <h4>Reservations</h4>
      <a href="Reservation.jsp">Book a Room</a>
      <a href="#">Special Offers</a>
      <a href="#">Weddings &amp; Events</a>
      <a href="#">Corporate Stays</a>
      <a href="Login.jsp">Staff Portal</a>
    </div>

    <div class="footer-col">
      <h4>Contact</h4>
      <p>42 Light House Street<br>Galle Fort, Galle 80000<br>Sri Lanka</p>
      <a href="tel:+94912245678">+94 91 224 5678</a>
      <a href="mailto:hello@oceanviewgalle.lk">hello@oceanviewgalle.lk</a>
      <a href="#">www.oceanviewgalle.lk</a>
    </div>
  </div>

  <div class="footer-bottom">
    <p class="footer-copy">© 2026 Ocean View Resort. All rights reserved.</p>
    <div class="footer-links">
      <a href="#">Privacy Policy</a>
      <a href="#">Terms of Service</a>
      <a href="#">Cookie Preferences</a>
    </div>
  </div>
</footer>

<!-- ═══════════════════════════════════════
     JAVASCRIPT
═══════════════════════════════════════ -->
<script>
/* ── Custom Cursor ── */
const dot  = document.getElementById('cursorDot');
const ring = document.getElementById('cursorRing');
let mouseX = 0, mouseY = 0, ringX = 0, ringY = 0;

document.addEventListener('mousemove', e => {
  mouseX = e.clientX; mouseY = e.clientY;
  dot.style.left  = mouseX + 'px';
  dot.style.top   = mouseY + 'px';
});

function animateRing() {
  ringX += (mouseX - ringX) * 0.12;
  ringY += (mouseY - ringY) * 0.12;
  ring.style.left = ringX + 'px';
  ring.style.top  = ringY + 'px';
  requestAnimationFrame(animateRing);
}
animateRing();

document.querySelectorAll('a, button, .room-card, .exp-card, .gallery-tile').forEach(el => {
  el.addEventListener('mouseenter', () => document.body.classList.add('cursor-hover'));
  el.addEventListener('mouseleave', () => document.body.classList.remove('cursor-hover'));
});

/* ── Nav Scroll ── */
const nav = document.getElementById('mainNav');
window.addEventListener('scroll', () => {
  nav.classList.toggle('scrolled', window.scrollY > 60);
});

/* ── Hero Slideshow ── */
let currentSlide = 0;
const slides = document.querySelectorAll('.hero-slide');
const dots   = document.querySelectorAll('.slide-dot');

function goToSlide(n) {
  slides[currentSlide].classList.remove('active');
  dots[currentSlide].classList.remove('active');
  currentSlide = (n + slides.length) % slides.length;
  slides[currentSlide].classList.add('active');
  dots[currentSlide].classList.add('active');
}

setInterval(() => goToSlide(currentSlide + 1), 6000);

/* ── Scroll Reveal ── */
const revealEls = document.querySelectorAll('.reveal');
const revealObserver = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('revealed');
      revealObserver.unobserve(entry.target);
    }
  });
}, { threshold: 0.12, rootMargin: '0px 0px -60px 0px' });

revealEls.forEach(el => revealObserver.observe(el));

/* ── Smooth anchor scroll ── */
document.querySelectorAll('a[href^="#"]').forEach(a => {
  a.addEventListener('click', e => {
    const target = document.querySelector(a.getAttribute('href'));
    if (target) {
      e.preventDefault();
      target.scrollIntoView({ behavior: 'smooth', block: 'start' });
    }
  });
});

/* ── Parallax hero subtle ── */
window.addEventListener('scroll', () => {
  const scrollY = window.scrollY;
  const heroSlides = document.querySelectorAll('.hero-slide');
  heroSlides.forEach(s => {
    s.style.transform = `translateY(${scrollY * 0.3}px)`;
  });
}, { passive: true });

/* ── Stat counter animation ── */
function animateCount(el, target, duration = 1500) {
  const isFloat = target % 1 !== 0;
  let start = 0;
  const step = timestamp => {
    if (!start) start = timestamp;
    const progress = Math.min((timestamp - start) / duration, 1);
    const ease = 1 - Math.pow(1 - progress, 3);
    const current = ease * target;
    el.textContent = isFloat ? current.toFixed(1) : Math.floor(current) + (target >= 15 ? '+' : '');
    if (progress < 1) requestAnimationFrame(step);
  };
  requestAnimationFrame(step);
}

const statsObserver = new IntersectionObserver(entries => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      const nums = [
        { el: document.querySelectorAll('.stat-num')[0], val: 48 },
        { el: document.querySelectorAll('.stat-num')[1], val: 15 },
        { el: document.querySelectorAll('.stat-num')[2], val: 4.9 },
      ];
      nums.forEach(n => { if (n.el) animateCount(n.el, n.val); });
      statsObserver.disconnect();
    }
  });
}, { threshold: 0.5 });
const statsSection = document.querySelector('.intro-stats');
if (statsSection) statsObserver.observe(statsSection);
</script>

</body>
</html>