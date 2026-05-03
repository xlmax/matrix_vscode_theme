$json = Get-Content "C:\Home\repos\Private\MatrixVSCodeTheme\themes\matrix-color-theme.json" -Raw | ConvertFrom-Json

Write-Host "=== Checking colors ==="
$validKnownColors = @(
    # Editor
    "editor.background", "editor.foreground", "editorCursor.foreground",
    "editor.selectionBackground", "editor.selectionHighlightBackground",
    "editor.inactiveSelectionBackground", "editor.wordHighlightBackground",
    "editor.wordHighlightStrongBackground", "editor.findMatchBackground",
    "editor.findMatchHighlightBackground", "editor.findRangeHighlightBackground",
    "editor.hoverHighlightBackground", "editor.lineHighlightBackground",
    "editor.lineHighlightBorder", "editor.rangeHighlightBackground",
    "editorBracketMatch.background", "editorBracketMatch.border",
    "editorBracketHighlight.foreground1", "editorBracketHighlight.foreground2",
    "editorBracketHighlight.foreground3", "editorBracketHighlight.foreground4",
    "editorBracketHighlight.foreground5", "editorBracketHighlight.foreground6",
    "editorBracketHighlight.unexpectedBracket.foreground",
    "editorCodeLens.foreground", "editorError.foreground", "editorError.border",
    "editorWarning.foreground", "editorWarning.border",
    "editorInfo.foreground", "editorInfo.border",
    "editorHint.foreground", "editorHint.border",
    "editorGutter.background", "editorGutter.modifiedBackground",
    "editorGutter.addedBackground", "editorGutter.deletedBackground",
    "editorGutter.commentRangeForeground",
    "editorLineNumber.foreground", "editorLineNumber.activeForeground",
    "editorIndentGuide.background", "editorIndentGuide.activeBackground",
    "editorWhitespace.foreground", "editorRuler.foreground",
    "editorWidget.background", "editorWidget.foreground", "editorWidget.border",
    "editorSuggestWidget.background", "editorSuggestWidget.border",
    "editorSuggestWidget.foreground", "editorSuggestWidget.selectedBackground",
    "editorSuggestWidget.highlightForeground",
    "editorHoverWidget.background", "editorHoverWidget.border", "editorHoverWidget.foreground",
    "editorLink.activeForeground",
    "editorStickyScroll.background", "editorStickyScrollHover.background",
    "editorUnicodeHighlight.border", "editorUnicodeHighlight.background",
    # Minimap
    "minimap.background", "minimap.errorHighlight", "minimap.warningHighlight",
    "minimap.findMatchHighlight", "minimap.selectionHighlight",
    "minimapGutter.addedBackground", "minimapGutter.modifiedBackground", "minimapGutter.deletedBackground",
    # Diff
    "diffEditor.insertedTextBackground", "diffEditor.removedTextBackground",
    "diffEditor.insertedLineBackground", "diffEditor.removedLineBackground", "diffEditor.border",
    # Merge
    "merge.currentHeaderBackground", "merge.currentContentBackground",
    "merge.incomingHeaderBackground", "merge.incomingContentBackground",
    "merge.commonHeaderBackground", "merge.commonContentBackground",
    # Panel
    "panel.background", "panel.border",
    "panelTitle.activeForeground", "panelTitle.activeBorder", "panelTitle.inactiveForeground",
    "panelSection.border", "panelSection.dropBackground", "panelSectionHeader.background",
    # Sidebar
    "sideBar.background", "sideBar.foreground", "sideBar.border",
    "sideBarTitle.foreground", "sideBarSectionHeader.background",
    "sideBarSectionHeader.foreground", "sideBar.dropBackground",
    # Activity bar
    "activityBar.background", "activityBar.foreground", "activityBar.inactiveForeground",
    "activityBar.border", "activityBarBadge.background", "activityBarBadge.foreground",
    "activityBar.activeBorder", "activityBar.activeFocusBorder", "activityBar.dropBackground",
    # Status bar
    "statusBar.background", "statusBar.foreground", "statusBar.border",
    "statusBar.debuggingBackground", "statusBar.debuggingForeground",
    "statusBar.noFolderBackground", "statusBar.noFolderForeground",
    "statusBarItem.remoteBackground", "statusBarItem.remoteForeground",
    "statusBarItem.hoverBackground", "statusBarItem.prominentBackground",
    "statusBarItem.prominentHoverBackground",
    "statusBarItem.errorBackground", "statusBarItem.warningBackground",
    # Title bar
    "titleBar.activeBackground", "titleBar.activeForeground",
    "titleBar.inactiveBackground", "titleBar.inactiveForeground", "titleBar.border",
    # Menu
    "menubar.selectionBackground", "menubar.selectionForeground",
    "menu.background", "menu.foreground", "menu.selectionBackground",
    "menu.selectionForeground", "menu.separatorBackground", "menu.border",
    # Tabs
    "tab.activeBackground", "tab.activeForeground", "tab.activeBorder", "tab.activeBorderTop",
    "tab.inactiveBackground", "tab.inactiveForeground",
    "tab.hoverBackground", "tab.hoverForeground", "tab.hoverBorder",
    "tab.unfocusedActiveBackground", "tab.unfocusedActiveForeground",
    "tab.unfocusedInactiveBackground", "tab.unfocusedInactiveForeground",
    "tab.border", "tab.lastPinnedBorder",
    "tab.activeModifiedBorder", "tab.inactiveModifiedBorder",
    # Input
    "input.background", "input.foreground", "input.border", "input.placeholderForeground",
    "inputOption.activeBackground", "inputOption.activeBorder", "inputOption.activeForeground",
    "inputValidation.errorBackground", "inputValidation.errorBorder",
    "inputValidation.warningBackground", "inputValidation.warningBorder",
    "inputValidation.infoBackground", "inputValidation.infoBorder",
    # Dropdown & Checkbox
    "dropdown.background", "dropdown.foreground", "dropdown.border",
    "checkbox.background", "checkbox.foreground", "checkbox.border", "checkbox.selectBackground",
    # Button
    "button.background", "button.foreground", "button.hoverBackground",
    "button.secondaryBackground", "button.secondaryForeground", "button.secondaryHoverBackground",
    "button.border", "button.separator",
    # Badge
    "badge.background", "badge.foreground",
    # Scrollbar
    "scrollbar.shadow", "scrollbarSlider.background", "scrollbarSlider.hoverBackground", "scrollbarSlider.activeBackground",
    # List/Tree
    "list.activeSelectionBackground", "list.activeSelectionForeground",
    "list.hoverBackground", "list.hoverForeground",
    "list.inactiveSelectionBackground", "list.inactiveSelectionForeground",
    "list.focusBackground", "list.focusForeground",
    "list.highlightForeground", "list.errorForeground", "list.warningForeground",
    "list.filterMatchBackground", "list.filterMatchBorder",
    "list.dropBackground", "list.focusOutline",
    "tree.indentGuidesStroke", "tree.tableColumnsBorder",
    # Quick picker
    "quickInput.background", "quickInput.foreground",
    "quickInput.list.focusBackground", "quickInput.list.focusForeground",
    # Picker group
    "pickerGroup.border", "pickerGroup.foreground",
    # Progress
    "progressBar.background",
    # Breadcrumb
    "breadcrumb.foreground", "breadcrumb.background",
    "breadcrumb.focusForeground", "breadcrumb.activeSelectionForeground",
    "breadcrumbPicker.background",
    # Notifications
    "notificationCenter.border", "notificationCenterHeader.background", "notificationCenterHeader.foreground",
    "notificationToast.border",
    "notification.background", "notification.foreground", "notification.border",
    "notificationLink.foreground",
    "notificationError.background", "notificationWarning.background", "notificationInfo.background",
    # Chat
    "chat.requestBackground", "chat.requestBorder",
    "chat.slashCommandBackground", "chat.slashCommandForeground",
    "chat.avatarBackground", "chat.avatarForeground",
    # Window
    "window.activeBorder", "window.inactiveBorder",
    # Debug
    "debugToolBar.background", "debugToolBar.border",
    "debugExceptionWidget.background", "debugExceptionWidget.border",
    "debugIcon.breakpointForeground", "debugIcon.breakpointDisabledForeground",
    "debugIcon.breakpointUnverifiedForeground",
    "debugIcon.continueForeground", "debugIcon.disconnectForeground",
    "debugIcon.pauseForeground", "debugIcon.startForeground",
    "debugIcon.stepBackForeground", "debugIcon.stepIntoForeground",
    "debugIcon.stepOutForeground", "debugIcon.stepOverForeground",
    "debugIcon.stopForeground",
    "debugTokenExpression.name", "debugTokenExpression.value",
    "debugTokenExpression.string", "debugTokenExpression.boolean",
    "debugTokenExpression.number", "debugTokenExpression.error",
    # Git
    "gitDecoration.addedResourceForeground", "gitDecoration.modifiedResourceForeground",
    "gitDecoration.deletedResourceForeground", "gitDecoration.untrackedResourceForeground",
    "gitDecoration.ignoredResourceForeground", "gitDecoration.conflictingResourceForeground",
    "gitDecoration.submoduleResourceForeground", "gitDecoration.renamedResourceForeground",
    "gitDecoration.stageDeletedResourceForeground", "gitDecoration.stageModifiedResourceForeground",
    # Peek view
    "peekView.border", "peekViewEditor.background", "peekViewEditorGutter.background",
    "peekViewEditor.matchHighlightBackground",
    "peekViewResult.background", "peekViewResult.fileForeground", "peekViewResult.lineForeground",
    "peekViewResult.matchHighlightBackground", "peekViewResult.selectionBackground", "peekViewResult.selectionForeground",
    "peekViewTitle.background", "peekViewTitleDescription.foreground", "peekViewTitleLabel.foreground",
    # Extensions
    "extensionButton.background", "extensionButton.foreground", "extensionButton.hoverBackground",
    "extensionButton.prominentBackground", "extensionButton.prominentForeground", "extensionButton.prominentHoverBackground",
    "extensionBadge.background", "extensionBadge.foreground", "extensionsViewer.background",
    # Terminal
    "terminal.background", "terminal.foreground", "terminal.border",
    "terminal.ansiBlack", "terminal.ansiRed", "terminal.ansiGreen", "terminal.ansiYellow",
    "terminal.ansiBlue", "terminal.ansiMagenta", "terminal.ansiCyan", "terminal.ansiWhite",
    "terminal.ansiBrightBlack", "terminal.ansiBrightRed", "terminal.ansiBrightGreen",
    "terminal.ansiBrightYellow", "terminal.ansiBrightBlue", "terminal.ansiBrightMagenta",
    "terminal.ansiBrightCyan", "terminal.ansiBrightWhite",
    "terminalCursor.background", "terminalCursor.foreground",
    "terminal.selectionBackground", "terminal.inactiveSelectionBackground",
    "terminal.findMatchBackground", "terminal.findMatchHighlightBackground",
    "terminal.dropBackground", "terminal.tab.activeBorder",
    # Welcome
    "welcomePage.background", "welcomePage.progress.background", "welcomePage.progress.foreground",
    "welcomePage.tileBackground", "welcomePage.tileHoverBackground",
    "welcomePage.buttonBackground", "welcomePage.buttonHoverBackground",
    "walkThrough.embeddedEditorBackground",
    # Settings
    "settings.headerForeground", "settings.modifiedItemIndicator",
    "settings.dropdownBackground", "settings.dropdownForeground", "settings.dropdownBorder",
    "settings.checkboxBackground", "settings.checkboxForeground", "settings.checkboxBorder",
    "settings.textInputBackground", "settings.textInputForeground", "settings.textInputBorder",
    "settings.numberInputBackground", "settings.numberInputForeground", "settings.numberInputBorder",
    "settings.focusedRowBackground", "settings.rowHoverBackground",
    # Keybinding
    "keybindingLabel.background", "keybindingLabel.foreground", "keybindingLabel.border", "keybindingLabel.bottomBorder",
    # Snippet
    "snippetTabstop.background", "snippetTabstop.border",
    "snippetFinalTabstop.background", "snippetFinalTabstop.border",
    # Misc
    "watermark.background",
    "statusBar.focusBorder",
    "inlineChat.background", "inlineChat.border", "inlineChat.inputBorder", "inlineChat.inputFocusBorder",
    "simpleFindWidget.sashBorder",
    "searchEditor.textInputBorder", "searchEditor.queryMatch",
    "focusBorder", "contrastBorder", "contrastActiveBorder",
    "errorForeground", "descriptionForeground",
    "icon.foreground", "sash.hoverBorder", "separator.background"
)

Write-Host "Checking for unknown color IDs..."
$warnings = @()
foreach ($key in $json.colors.PSObject.Properties.Name) {
    if ($key -notin $validKnownColors) {
        $warnings += $key
    }
}

if ($warnings.Count -gt 0) {
    Write-Host "⚠️ Possibly unknown color IDs:"
    $warnings | ForEach-Object { Write-Host "  - $_" }
} else {
    Write-Host "✅ All color IDs appear to be valid"
}

Write-Host "`n=== Checking color hex format ==="
$hexWarnings = @()
foreach ($key in $json.colors.PSObject.Properties.Name) {
    $val = $json.colors.$key
    if ($val -notmatch '^#[0-9A-Fa-f]{6}([0-9A-Fa-f]{2})?$') {
        $hexWarnings += "${key}: ${val}"
    }
}
if ($hexWarnings.Count -gt 0) {
    Write-Host "⚠️ Invalid hex colors:"
    $hexWarnings | ForEach-Object { Write-Host "  - $_" }
} else {
    Write-Host "✅ All hex colors are valid"
}

Write-Host "`n=== Checking semantic token colors ==="
$validSemanticTokens = @(
    "class", "class.defaultLibrary", "interface", "enum", "type", "type.defaultLibrary",
    "typeParameter", "parameter", "variable", "variable.readonly", "variable.defaultLibrary",
    "property", "property.readonly", "enumMember", "event",
    "function", "function.defaultLibrary", "method", "method.defaultLibrary",
    "macro", "label", "comment", "string", "keyword", "number", "regexp",
    "operator", "operator.keyword",
    "namespace", "builtin", "constant", "constant.builtin.readonly",
    "member", "member.getter", "member.setter",
    "decorator", "decorator.builtin",
    "modifier", "modifier.abstract", "modifier.static", "modifier.readonly",
    "headline",
    "markup.quote", "markup.list", "markup.bold", "markup.italic",
    "markup.strikethrough", "markup.underline", "markup.heading",
    "markup.link", "markup.link.label", "markup.raw",
    "markup.inserted", "markup.deleted", "markup.changed"
)

$semWarnings = @()
foreach ($key in $json.semanticTokenColors.PSObject.Properties.Name) {
    if ($key -notin $validSemanticTokens) {
        $semWarnings += $key
    }
}
if ($semWarnings.Count -gt 0) {
    Write-Host "⚠️ Possibly unknown semantic token colors:"
    $semWarnings | ForEach-Object { Write-Host "  - $_" }
} else {
    Write-Host "✅ All semantic token colors appear valid"
}

Write-Host "`n=== All checks complete ==="
