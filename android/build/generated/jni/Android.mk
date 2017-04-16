# Android.mk for ti.mely
LOCAL_PATH := $(call my-dir)
THIS_DIR := $(LOCAL_PATH)

include $(CLEAR_VARS)

THIS_DIR = $(LOCAL_PATH)
LOCAL_MODULE := ti.mely
LOCAL_CFLAGS := -g "-I$(TI_MOBILE_SDK)/android/native/include"

# https://jira.appcelerator.org/browse/TIMOB-15263
LOCAL_DISABLE_FORMAT_STRING_CHECKS=true

# Several places in generated code we set some jvalues to NULL and
# since NDK r8b we'd get warnings about each one.
LOCAL_CFLAGS += -Wno-conversion-null

# cf https://groups.google.com/forum/?fromgroups=#!topic/android-ndk/Q8ajOD37LR0
LOCAL_CFLAGS += -Wno-psabi

LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -ldl -llog -L$(TARGET_OUT) "-L$(TI_MOBILE_SDK)/android/native/libs/$(TARGET_ARCH_ABI)" -lkroll-v8

GEN_DIR := $(realpath .)
GEN_JNI_DIR := $(GEN_DIR)/jni

ABS_SRC_FILES := $(wildcard $(LOCAL_PATH)/*.cpp)
BOOTSTRAP_CPP := $(wildcard $(LOCAL_PATH)/../*Bootstrap.cpp)

LOCAL_SRC_FILES := $(patsubst $(LOCAL_PATH)/%,%,$(ABS_SRC_FILES)) \
	$(patsubst $(LOCAL_PATH)/%,%,$(BOOTSTRAP_CPP))

$(BOOTSTRAP_CPP): $(GEN_DIR)/KrollGeneratedBindings.cpp $(GEN_DIR)/BootstrapJS.cpp

$(GEN_DIR)/KrollGeneratedBindings.cpp:
	gperf -L C++ -E -t "$(GEN_DIR)/KrollGeneratedBindings.gperf" > "$(GEN_DIR)/KrollGeneratedBindings.cpp"

$(GEN_DIR)/BootstrapJS.cpp:
	"$(PYTHON)" "$(TI_MOBILE_SDK)/module/android/js2c.py" "$(GEN_DIR)/BootstrapJS.cpp" "$(GEN_DIR)/bootstrap.js"

include $(BUILD_SHARED_LIBRARY)
