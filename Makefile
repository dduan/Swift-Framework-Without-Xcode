PWD=$(shell pwd)
APP_NAME=printanswer
LIB_PATH=Frameworks
BUILD_PATH=$(PWD)/bulid
LIB_BUILD_PATH=$(BUILD_PATH)/$(LIB_PATH)
LIBS = Answer
SOURCES = main.swift

bulid: clean $(LIBS)
	swiftc $(SOURCES) \
		-o $(BUILD_PATH)/$(APP_NAME) \
		-I $(LIB_BUILD_PATH) \
		-L $(LIB_BUILD_PATH) \
		-Xlinker -rpath \
		-Xlinker @executable_path/ \
		-v

$(LIBS):
	mkdir -p $(LIB_BUILD_PATH)
	swiftc \
		-emit-library \
		-o $(LIB_BUILD_PATH)/lib$@.dylib \
		-Xlinker -install_name \
		-Xlinker @rpath/$(LIB_PATH)/lib$@.dylib \
		-emit-module \
		-emit-module-path $(LIB_BUILD_PATH)/$@.swiftmodule \
		-module-name $@ \
		-module-link-name $@ \
		-v \
		Frameworks/$@/*.swift

clean:
	rm -rf build
