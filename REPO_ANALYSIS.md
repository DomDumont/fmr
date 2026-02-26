# Repository Analysis (brief)

## What this project is
- A small Lua/LÖVE experiment for a Formula-style racing card game prototype.
- It contains both:
  - an older CLI flow (`fmr.lua`) that runs a complete season loop in terminal, and
  - a newer scene/UI flow (`main.lua` + `scenes/*` + `libs/ui/*`) for in-window interaction.

## Current architecture
- Entry point for LÖVE app: `main.lua`.
- Global scene stack manager: `libs/scene_manager.lua` (`TheSceneManager`).
- Global GUI registry: `libs/ui/gui.lua` (`TheGUI`).
- Domain logic split into `game.lua`, `deck.lua`, `card.lua`, `player.lua`.
- Scene set:
  - `scenes/menuscene.lua` (setup UI controls)
  - `scenes/game/setupscene.lua` (intermediate setup display)
  - `scenes/gamescene.lua` (placeholder)
  - `scenes/pausescene.lua` (pause state)

## Key observations
1. **Prototype state is clear**
   - The code uses many `print` traces and placeholder scene behavior, indicating active prototyping.

2. **Two parallel flows exist**
   - The CLI season loop in `fmr.lua` duplicates game bootstrapping responsibilities now partially represented in scenes.
   - This is useful during transition, but increases maintenance cost and can cause divergence.

3. **Global singletons simplify flow, but couple systems**
   - `TheSceneManager` and `TheGUI` make scene code concise.
   - Tradeoff: hidden dependencies and harder isolated testing.

4. **Potential bug in scene pop behavior**
   - `SceneManager:pop_scene()` always calls `on_scene_enter()` on the new top scene after removal.
   - If last scene is popped, stack is empty and this can index nil.

5. **UI framework is serviceable and lightweight**
   - Widget focus traversal and tab-order are implemented.
   - Good foundation for incremental UX improvements.

## Suggested next steps
- Pick a single primary runtime path (LÖVE scenes vs CLI) and mark the other as legacy.
- Harden scene stack operations for empty-stack edge cases.
- Extract game setup/session state into one module shared by scenes to reduce duplication.
- Add a minimal smoke test harness (or scripted launch checks) to validate startup and scene transitions.
