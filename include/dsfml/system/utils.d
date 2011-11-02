module dsfml.utils;

import std.traits;

version(D_InlineAsm_X86) {
	immutable bool sseAvailable = is(typeof({void* foo; asm { mov EAX, foo; movups XMM0, [EAX]; } }));
} else version(D_InlineAsm_X86_64) {
	immutable bool sseAvailable = is(typeof({void* foo; asm { mov RAX, foo; movups XMM0, [RAX]; } }));
}

T sadd(T, U)(const T n1, const U n2) @safe pure nothrow if(isIntegral!(T) && isUnsigned!(T) && is(Unqual!(T) == Unqual!(U))) {
	return (n1 >= (T.max - n2))?T.max:(cast(T) (n1 + n2));
}

T ssub(T)(const T n1, const T n2) @safe pure nothrow if(isIntegral!(T) && isUnsigned!(T) && is(Unqual!(T) == Unqual!(U))) {
	return (n1 <= (T.min + n2))?T.min:(cast(T) (n1 - n2));
}

unittest {
	void testFor(T)() if(isIntegral!(T) && isUnsigned!(T)) {
		immutable T max = T.max;
		immutable T min = T.min;
		immutable T x = 42;
		
		assert(sadd(max, max) == max);
		assert(sadd(min, min) == min);
		assert(ssub(max, max) == min);
		assert(ssub(min, min) == min);
		
		assert(sadd(max, min) == max);
		assert(sadd(min, max) == max);
		assert(ssub(max, min) == max);
		assert(ssub(min, max) == min);
		
		assert(sadd(max, x) == max);
		assert(sadd(x, max) == max);
		assert(ssub(max, x) == (max - x));
		assert(ssub(x, max) == min);
		
		assert(sadd(min, x) == x);
		assert(sadd(x, min) == x);
		assert(ssub(min, x) == min);
		assert(ssub(x, min) == x);
	}
	
	testFor!(ubyte)();
	testFor!(ushort)();
	testFor!(uint)();
	testFor!(ulong)();
}

T modulate(T, U)(const T n1, const U n2) @safe pure nothrow if(isNumeric!(T) && is(Unqual!(T) == Unqual!(U))) {
	return (n1 * n2) / T.max;
}

