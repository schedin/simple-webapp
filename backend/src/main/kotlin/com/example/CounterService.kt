package com.example

import java.util.concurrent.atomic.AtomicInteger

class CounterService {
    private val counter = AtomicInteger(0)
    
    fun getCurrentValue(): Int {
        return counter.get()
    }
    
    fun increment(): Int {
        return counter.incrementAndGet()
    }
    
    fun decrement(): Int {
        return counter.decrementAndGet()
    }
    
    fun reset(): Int {
        counter.set(0)
        return counter.get()
    }
}
