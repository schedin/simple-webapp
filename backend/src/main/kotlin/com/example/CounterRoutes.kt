package com.example

import io.ktor.server.routing.*
import io.ktor.server.response.*
import io.ktor.server.application.*
import io.ktor.http.*

data class CounterResponse(val value: Int, val action: String)

fun Route.counterRoutes(counterService: CounterService) {
    route("/backend") {
        route("/counter") {
            get {
                val currentValue = counterService.getCurrentValue()
                call.respond(CounterResponse(currentValue, "get"))
            }
            
            post("/increment") {
                val newValue = counterService.increment()
                call.respond(CounterResponse(newValue, "increment"))
            }
            
            post("/decrement") {
                val newValue = counterService.decrement()
                call.respond(CounterResponse(newValue, "decrement"))
            }
            
            post("/reset") {
                val newValue = counterService.reset()
                call.respond(CounterResponse(newValue, "reset"))
            }
        }
    }
}
