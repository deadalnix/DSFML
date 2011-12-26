namespace sf {

// Ensure that Enumeration have a known size.
template<class E, class T> struct Enumeration {
	typedef T type;
	typedef E enum_type;
	
	Enumeration()
		: e_(E())
	{}
	
	Enumeration(E e)
		: e_(static_cast<T>(e))
	{}
	
	Enumeration(T t)
		: e_(t)
	{}
	
	operator E() const
	{ return static_cast<E>(e_); }
	
private:
	T e_;
};

}

