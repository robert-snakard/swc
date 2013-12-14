# swc: launch/local.mk

dir := launch

$(dir)_TARGETS := $(dir)/swc-launch

# Dependencies
$(dir)_PACKAGES =   \
    libdrm

$(dir)/swc-launch: $(dir)/launch.o $(dir)/protocol.o
	$(link) $(launch_PACKAGE_LIBS)

check-dependencies-$(dir):
	$(call check_deps,swc-launch,$(LAUNCH_PACKAGES))

install-$(dir): $(dir)/swc-launch | $(DESTDIR)$(BINDIR)
	install -m4755 launch/swc-launch "$(DESTDIR)$(BINDIR)"

CLEAN_FILES += $(dir)/launch.o

include common.mk
