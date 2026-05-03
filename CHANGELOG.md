# Change Log

All notable changes to the "Matrix Theme" extension will be documented in this file.

Check [Keep a Changelog](http://keepachangelog.com/) for recommendations on how to structure this file.

## [0.1.0] - 2026-05-03

### Added
- 🎨 **300+ UI color entries** — full coverage of all VS Code surfaces:
  - Editor: selection, find, bracket match, hover, rulers, indent guides, widgets
  - Editor gutter: line numbers, breakpoints, Git decorations
  - Minimap: background, errors, warnings, find matches, gutter
  - Diff editor & merge: inserted/removed lines, current/incoming headers
  - Panel, sidebar, activity bar, status bar (including debugging & remote)
  - Title bar, menubar, menus
  - Tabs: active, inactive, hover, unfocused, modified
  - Input controls, dropdowns, checkboxes, buttons, badges
  - Lists, trees, quick picker
  - Breadcrumbs, progress bar, scrollbar
  - Notifications, chat panel
  - Debug toolbar, debug icons, debug expression tokens
  - Git decorations: added, modified, deleted, untracked, ignored, conflicted
  - Peek view, extensions view
  - Settings page, keybinding labels
  - Snippet tabstops, watermark, inline chat
  - Welcome page, walkthrough
  - Terminal: full 16-color ANSI palette, cursor, selection, find
  - Focus, contrast, separator, sash borders

- ✨ **95+ syntax token rules** for comprehensive highlighting:
  - All comment styles (block, line, documentation, JSDoc, shebang)
  - Keywords: control flow, operators, imports, exceptions, units
  - Storage types and modifiers
  - All string types: quoted, template, interpolated, regex, docstring
  - Numeric: integer, float, hex, octal, binary
  - Language constants: boolean, null, undefined
  - Character escapes
  - Functions: constructors, methods, preprocessor
  - Types: class, struct, enum, interface, namespace, module
  - Tags, attribute names, IDs, classes, inherited classes
  - Variables: language (this), parameters, properties, enum members
  - Support: built-in functions, classes, types, constants
  - All punctuation: brackets, terminators, separators, accessors
  - Full markup: headings, bold, italic, lists, quotes, links, raw, tables
  - Diff: headers, ranges, indexes
  - Language-specific: CSS/SCSS/YAML/JSON/Java/Python/Rust

- 🧠 **55+ semantic token colors** for language servers:
  - Classes, interfaces, enums, types, type parameters
  - Parameters, variables, properties, enum members
  - Events, functions, methods, macros, labels
  - Namespaces, builtins, constants, members
  - Decorators, modifiers (abstract, static, readonly)
  - Markup: headings, links, quotes, lists, bold, italic

- 🎯 **Icon** — Custom Matrix-style SVG icon

### Changed
- Package metadata: added description, publisher, license (MIT), repository, keywords
- Theme name from `"matrix"` to `"Matrix Theme"` for better readability
- VS Code engine minimum version set to `^1.75.0` for broader compatibility

### Fixed
- Empty description in package.json
- Minimal UI color coverage (was ~20 entries, now 300+)
- Minimal token color coverage (was ~10 scopes, now 95+)
- README contained default template, now has proper documentation
- Missing icon for VS Code Marketplace
