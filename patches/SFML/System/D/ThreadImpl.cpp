////////////////////////////////////////////////////////////
//
// SFML - Simple and Fast Multimedia Library
// Copyright (C) 2007-2009 Laurent Gomila (laurent.gom@gmail.com)
//
// This software is provided 'as-is', without any express or implied warranty.
// In no event will the authors be held liable for any damages arising from the use of this software.
//
// Permission is granted to anyone to use this software for any purpose,
// including commercial applications, and to alter it and redistribute it freely,
// subject to the following restrictions:
//
// 1. The origin of this software must not be misrepresented;
//    you must not claim that you wrote the original software.
//    If you use this software in a product, an acknowledgment
//    in the product documentation would be appreciated but is not required.
//
// 2. Altered source versions must be plainly marked as such,
//    and must not be misrepresented as being the original software.
//
// 3. This notice may not be removed or altered from any source distribution.
//
////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////
// Headers
////////////////////////////////////////////////////////////
#include <SFML/System/D/ThreadImpl.hpp>
#include <SFML/System/Thread.hpp>

// Thoses are not supposed to be used on C++ side. Anyway, they require to be in the global scope to be linked with D.
void* __dsfml_start_thread(void* (*entryPoint)(void*), void* userData);
void __dsfml_wait_thread(void* tid);
void __dsfml_terminate_thread(void* tid);

namespace sf
{
namespace priv
{
////////////////////////////////////////////////////////////
ThreadImpl::ThreadImpl(Thread* owner) {
    tid = __dsfml_start_thread(&ThreadImpl::EntryPoint, owner);
}


////////////////////////////////////////////////////////////
void ThreadImpl::Wait() {
    __dsfml_wait_thread(tid);
}


////////////////////////////////////////////////////////////
void ThreadImpl::Terminate() {
    __dsfml_terminate_thread(tid);
}


////////////////////////////////////////////////////////////
void* ThreadImpl::EntryPoint(void* userData) {
    // The Thread instance is stored in the user data
    Thread* owner = static_cast<Thread*>(userData);

    // Forward to the owner
    owner->Run();

    return NULL;
}

} // namespace priv

} // namespace sf
