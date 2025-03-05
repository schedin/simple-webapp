import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
    kotlin("jvm") version "1.8.21"
    id("io.ktor.plugin") version "2.3.0"
    application
}

group = "com.example"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    implementation("io.ktor:ktor-server-core:2.3.0")
    implementation("io.ktor:ktor-server-netty:2.3.0")
    implementation("io.ktor:ktor-server-content-negotiation:2.3.0")
    implementation("io.ktor:ktor-serialization-jackson:2.3.0")
    implementation("ch.qos.logback:logback-classic:1.4.7")
    implementation("io.ktor:ktor-server-cors:2.3.0")
    
    testImplementation(kotlin("test"))
}

tasks.test {
    useJUnitPlatform()
}

tasks.withType<KotlinCompile> {
    kotlinOptions.jvmTarget = "17"
}

application {
    mainClass.set("com.example.ApplicationKt")
}

ktor {
    fatJar {
        archiveFileName.set("counter-server.jar")
    }
}

// Configure the jar task to set manifest attributes
tasks.withType<Jar> {
    manifest {
        attributes(
            "Main-Class" to "com.example.ApplicationKt",
            "Implementation-Title" to "Counter Server Application",
            "Implementation-Version" to project.version
        )
    }
}

// Add a distribution task for better container readiness
tasks.register<Copy>("prepareDockerImage") {
    dependsOn("fatJar")
    from(layout.buildDirectory.dir("libs"))
    include("counter-server.jar")
    into(layout.buildDirectory.dir("docker"))
    doLast {
        copy {
            from(file("src/main/resources"))
            into(layout.buildDirectory.dir("docker/resources"))
        }
    }
}
