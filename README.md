# Fragged Sheets
An interactive sheet for all things Fragged Systems.

## Dependencies installation

All instructions use Windows as the base operating system, however all resources listed below have their own installation instructions for other OS. Any questions, please contact Arisu-sensei on the [Fragged Empire Discord server](https://discord.com/invite/Z6Erwyc).

#### Requirements
- [Flutter](https://flutter.dev/docs/get-started/install)
- [Go](https://golang.org/dl/)
- C/C++ Compiler (MingW-64 will do fine on Windows)
- [Git](https://git-scm.com/)
- [Hover](https://github.com/go-flutter-desktop/hover)

#### Installation

1) Download and install Flutter, Go, Git and your C/C++ compiler of choice. Make sure they areon your path variables, and use `flutter doctor` and `go version` to check installations.
2) [ Project ] Navigate to any folder you want to keep the project at and run `git clone https://github.com/GwynmeTheos/fragged-sheets.git`. Once it is cloned, navigate into the new fragged-sheets folder.
3) [ Flutter ] Run `flutter pub get` to get all packages.
4) [ Hover ] Run `set GO111MODULE=on` followed by `go get -u -a github.com/go-flutter-desktop/hover`. `go get` has been deprecated, so if it ever gives you an error, please contact me on the Discord server.
5) Run `hover run` to run the project on Desktop.

#### IDEs

##### VSCode
Download the following extensions: Flutter, Dart, Flutter intl and Hover.
Launch options are already on the git repository, and should be ready to run. If they do not work, or if you want to run it on a webserver (without Chrome):
For desktop: `hover run`
For webserver `flutter run -d web-server --web-port 8080 --web-hostname 0.0.0.0`

#### Other tutorials

- [How to add a folder to your PATH on Windows](https://docs.microsoft.com/en-us/previous-versions/office/developer/sharepoint-2010/ee537574(v=office.14))
- 
