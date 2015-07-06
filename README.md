Without Xcode, how would one use `swiftc` to compile and dynamically link to
Swift frameworks?

This project demostrates one way to achieve that.

(It's really just some combinations of commandline options for `swiftc` in
a Makefile.)

## Usage

1. Under the *Frameworks* folder, create a folder named after the "framework",
   place all source files for this framework in the root level of this folder.
2. Open *Makefile*, add the folder name to the values of the `LIBS` variable
   (separated by a space).
3. Change `APP_NAME` to your application's name.
4. List the relative path of the Swift source files in the `SOURCES` variable.
5. Type `make`, and your app will be built in the *build* folder.

Now you can import the frameworks in your application code the normal way and
the app will build and run as expected.

*main.swift* and *Frameworks/Answer* are there as an example.
