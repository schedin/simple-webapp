document.addEventListener('DOMContentLoaded', () => {
    const counter = document.getElementById('counter');
    const incrementBtn = document.getElementById('increment');
    const decrementBtn = document.getElementById('decrement');
    const resetBtn = document.getElementById('reset');
    
    // Use environment variable or fall back to default
    const API_BASE_URL = process.env.API_BASE_URL || 'http://localhost:8081';
    
    // Initial fetch of counter value
    fetchCounter();
    
    function updateCounter(value) {
        counter.textContent = value;
    }
    
    function fetchCounter() {
        fetch(`${API_BASE_URL}/counter`)
            .then(response => response.json())
            .then(data => {
                updateCounter(data.value);
            })
            .catch(error => {
                console.error('Error fetching counter:', error);
                counter.textContent = 'Error';
            });
    }
    
    function performCounterAction(action) {
        fetch(`${API_BASE_URL}/counter/${action}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            }
        })
        .then(response => response.json())
        .then(data => {
            updateCounter(data.value);
        })
        .catch(error => {
            console.error(`Error performing ${action}:`, error);
            counter.textContent = 'Error';
        });
    }
    
    incrementBtn.addEventListener('click', () => {
        performCounterAction('increment');
    });
    
    decrementBtn.addEventListener('click', () => {
        performCounterAction('decrement');
    });
    
    resetBtn.addEventListener('click', () => {
        performCounterAction('reset');
    });
});