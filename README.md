# 🦆 Quackscordia (Optimized)

Quackscordia is a Discord bot built on **Discordia** and **Luvit**, designed to handle voice playback, commands, and automation.  
This version focuses on **lower memory usage** and **better runtime efficiency** without removing any core features.

---

## 💡 What’s New

- **Less idle memory:**  
  Original build idled around ~600 MB.  
  This version typically idles between **250–350 MB**, depending on runtime and active modules.

- **Lower garbage collection load:**  
  Audio streams now reuse their internal buffers instead of allocating new ones every frame.

- **Same functionality, smoother performance:**  
  Voice playback, FFmpeg integration, and Opus encoding all work the same way — just leaner.

---

## ⚙️ Technical Notes

Optimized components:
- `libs/voice/streams/PCMString.lua`
- `libs/voice/streams/PCMStream.lua`
- `libs/voice/streams/PCMGenerator.lua`

These files were rewritten to reuse PCM data tables, reducing short-lived allocations and memory churn during voice streaming.

Nothing else was stripped or simplified — all original behavior is intact.

---

## 🧩 Requirements

- **Luvit**  
- **Discordia**  
- **FFmpeg**  
- **Opus** (for voice encoding)  
- **LuaJIT** (recommended for the best performance)

---

## 🔧 Tips for Lower Idle Usage

- Use LuaJIT instead of standard Lua where possible.  
- Run `collectgarbage("collect")` during long idle periods.  
- Disable or unload voice modules when not in use.  
- Lazy-load command modules instead of preloading all at startup.

---

## 📜 License

Same license as the original Quackscordia project.  
This is an optimized, drop-in version meant for better performance and smaller footprint.

---

### 🧠 Author Notes
This version was tuned to run cleaner and use less memory over long sessions without changing the bot’s behavior.  
If you’re running Quackscordia 24/7 or on a small VPS, this edition should save you a noticeable amount of RAM while keeping everything working as expected.
