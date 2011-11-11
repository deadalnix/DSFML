module csfml.window.windowhandle;

import core.stdc.config;

version(Windows) {
	// Window handle is HWND (HWND__*) on Windows
	struct HWND__;
	alias HWND__* sfWindowHandle;
} else version(Posix) {
	// Window handle is Window (unsigned long) on Unix - X11
	alias c_ulong sfWindowHandle;
} else version(OSX) {
	alias void* sfWindowHandle;
}

static assert(is(sfWindowHandle), "Plateform not supported");

