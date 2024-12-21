/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1; /* -b  option; if 0, dmenu appears at bottom     */
static int centered = 1; /* -c option; centers dmenu on screen */
static int min_width = 500; /* minimum width when centered */
static const float menu_height_ratio = 4.0f; /* This is the ratio used in the original calculation */

/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"monospace:size=12"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */

static const char *colors[SchemeLast][3] = {
		/*	fg         bg       border*/
	[SchemeNorm] = { "#bbbbbb", "#222222", "#663399" },
	[SchemeSel] = { "#eeeeee", "#005577", "#663399" },
	[SchemeOut] = { "#000000", "#00ffff", "#663399" },
	/*[SchemeMid] = { "#eeeeee", "#770000" },*/
};

/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 5;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
/* Size of the window border */
static unsigned int border_width = 3;

