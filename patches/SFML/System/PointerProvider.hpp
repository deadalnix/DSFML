namespace sf {

// Ensure that Enumeration have a known size.
template<class T> struct PointerProvider {
	PointerProvider(T t)
		: item(t)
	{}
	
private:
	T item;
};

}

