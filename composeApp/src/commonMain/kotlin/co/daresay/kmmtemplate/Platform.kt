package co.daresay.kmmtemplate

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform