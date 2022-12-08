/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int gappx     = 15;        /* gaps between windows */
static const unsigned int snap      = 0;       /* snap pixel */
static const int swallowfloating    = 0;        /* 1 means swallow floating windows by default */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "FantasqueSansMono Nerd Font:bold:pixelsize=22:antialias=true:autohint=true" };
static const char dmenufont[]       = "monospace:size=10";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#b39e66";
// Left
static const char tag_foreground[]        = "#bbbbbb";
static const char tag_background[]        = "#222222";
static const char seltag_foreground[]        = "#222222";
static const char seltag_background[]        = "#b39e66";
// Middle
static const char mid_foreground[]        = "#bbbbbb";
static const char mid_background[]        = "#222222";
static const char selmid_foreground[]        = "#bbbbbb";
static const char selmid_background[]        = "#222222";
// Right
static const char status_foreground[]        = "#222222";
static const char status_background[]        = "#222222";
static const char *colors[][3]      = {
	/*               	    fg         		bg		border   */
	[SchemeNorm]		= { col_gray3,		col_gray1,	col_gray2 },
	[SchemeSel]		= { col_gray4,		col_cyan, 	col_cyan  },
	[SchemeTagsNorm]	= { tag_foreground,	tag_background,	"#000000"  }, // Tagbar left unselected {text,background,not used but cannot be empty}
	[SchemeTagsSel]		= { seltag_foreground,	seltag_background, "#000000"  }, // Tagbar left selected {text,background,not used but cannot be empty}
	[SchemeInfoNorm]	= { mid_foreground,	mid_background,	"#000000"  }, // infobar middle  unselected {text,background,not used but cannot be empty}
	[SchemeInfoSel]		= { selmid_foreground,	selmid_background, "#000000"  }, // infobar middle  selected {text,background,not used but cannot be empty}
	[SchemeStatus]		= { status_foreground,	status_background, "#000000"  }, // Statusbar right {text,background,not used but cannot be empty}
};

typedef struct {
	const char *name;
	const void *cmd;
} Sp;

const char *spcmd1[] = {"st", "-n", "spterm", "-g", "120x34", NULL };
const char *spcmd2[] = {"keepassxc", NULL };
static Sp scratchpads[] = {
	/* name          cmd  */
	{"spterm",      spcmd1},
	{"password",   spcmd2},
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

// There are two options when it comes to per-client rules:
static const Rule rules[] = {
	/* class		instance	title		tags mask	isfloating	monitor */
	{ "Gcolor2",		NULL,		NULL,		0,		1,		-1},
	{ "edev",		NULL,		NULL,		0,		1,		-1},
	{ "gnome-calculator",	NULL,		NULL,		0,		1,		-1},
	{ NULL,			"spterm",	NULL,		SPTAG(0),	1,		-1},
	{ NULL,			"keepassxc",	NULL,		SPTAG(1),	0,		-1},
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", NULL };

static const Key keys[] = {
	/* modifier                     key            function                argument */
	{ MODKEY,                       XK_b,          togglebar,              {0} },
	// change tag
	{ MODKEY,			XK_q,	       shiftviewclients,       { .i = -1 } },
	{ MODKEY,			XK_w,	       shiftviewclients,       { .i = +1 } },
	// change focus
	{ MODKEY,                       XK_Right,      focusstack,             {.i = +1 } },
	{ MODKEY,                       XK_Left,       focusstack,             {.i = -1 } },
	// move windows
	{ MODKEY|ShiftMask,             XK_Right,      rotatestack,            {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_Left,       rotatestack,            {.i = -1 } },
	// increase/decrease stack
	{ MODKEY,                       XK_j,          incnmaster,             {.i = +1 } },
	{ MODKEY,                       XK_k,          incnmaster,             {.i = -1 } },
	// increase/decrease stack size
	{ MODKEY,                       XK_u,          setmfact,               {.f = -0.025} },
	{ MODKEY,                       XK_i,          setmfact,               {.f = +0.025} },
	{ MODKEY,                       XK_h,          setcfact,               {.f = +0.25} },
	{ MODKEY,                       XK_l,          setcfact,               {.f = -0.25} },
	// swap master/stack window
        { MODKEY|ControlMask,           XK_Left,       zoom,                   {0} },
        { MODKEY|ControlMask,           XK_Right,      zoom,                   {0} },
	{ MODKEY,                       XK_0,          view,                   {0} },
	{ MODKEY|ShiftMask,             XK_q,          killclient,             {0} },
	{ MODKEY|ShiftMask,             XK_F11,        quit,                   {0} },
	{ MODKEY|ShiftMask,             XK_space,      togglefloating,         {0} },
	// scratchpads
	{ MODKEY,                       XK_s,          togglescratch,          {.ui = 0 } },
	{ MODKEY|ShiftMask,             XK_s,          togglescratch,          {.ui = 1 } },
	// monitor control
	{ MODKEY,                       XK_comma,      focusmon,               {.i = -1 } },
	{ MODKEY,                       XK_period,     focusmon,               {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,      tagmon,                 {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period,     tagmon,                 {.i = +1 } },
	// change layout
	{ MODKEY,                       XK_e,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_r,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_y,      setlayout,      {.v = &layouts[2]} },
	TAGKEYS(                        XK_1,                                  0)
	TAGKEYS(                        XK_2,                                  1)
	TAGKEYS(                        XK_3,                                  2)
	TAGKEYS(                        XK_4,                                  3)
	TAGKEYS(                        XK_5,                                  4)
	TAGKEYS(                        XK_6,                                  5)
	TAGKEYS(                        XK_7,                                  6)
	TAGKEYS(                        XK_8,                                  7)
	TAGKEYS(                        XK_9,                                  8)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

