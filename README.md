# Vapor

Vapor is a steamkit implementation for the V programming language. Based on the work I did for [argonx](https://github.com/emily33901/argonx), but with different goals.
Vapor intends to be the [SteamKit](https://github.com/SteamRE/SteamKit) of the V programming world. No grandeur ideas of replacing `steamclient.dll` here, just a way to interface with Steam.

Vapor uses the components that I have been building out over time after realising that I would need to provide them myself. If you are interested in using any of them they are (in no particular order):
* Protobuf support: [protoc-v](https://github.com/emily33901/protoc-v) (and [vproto](https://github.com/emily33901/vproto))
* RSA and AES encryption: [vtomcrypt](https://github.com/emily33901/vtomcrypt)
* TCP Networking support: [net](https://github.com/emily33901/vlang-net)
* Simple Zip compression: [zip](https://github.com/emily33901/vzip)

Vapor is still a work in progress.

Protobufs are currently not formatted becuase vfmt is eating module names!
