package com.example

import kotlin.test.Test
import kotlin.test.Ignore
import kotlin.test.assertEquals

class CounterServiceTest {
    
    @Ignore
    @Test
    fun `increment should increase counter value by 1`() {
        // Arrange
        val counterService = CounterService()
        val initialValue = counterService.getCurrentValue()
        
        // Act
        val result = counterService.increment()
        
        // Assert
        assertEquals(initialValue + 1, result, "Increment should return the counter value increased by 1")
        assertEquals(initialValue + 1, counterService.getCurrentValue(), "After increment, the internal counter should be increased by 1")
    }
}
