module csfml.system.Clock;

public import csfml.system.types;

extern(C) {
	sfClock* sfClock_Create();
	void sfClock_Destroy(sfClock* clock);
	sfClock* sfClock_Copy(sfClock* clock);
	
	uint sfClock_GetTime(sfClock* clock);
	void sfClock_Reset(sfClock* clock);
}

