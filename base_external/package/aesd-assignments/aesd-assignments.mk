
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

AESD_ASSIGNMENTS_VERSION = 4878e89fb6b6d28a355857bb74b45a24dc2a1f86
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignment-3-sawa9885.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES
AESD_ASSIGNMENTS_MODULE_SUBDIRS = aesd-char-driver

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) -C $(@D)/finder-app clean
	$(MAKE) -C $(@D)/server clean
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/writer
	$(INSTALL) -D -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin/finder.sh
	$(INSTALL) -D -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/finder-test.sh
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/finder-app/conf
	$(INSTALL) -m 0644 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -D -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/aesdsocket
	$(INSTALL) -D -m 0755 $(@D)/server/aesdsocket-start-stop \
		$(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(kernel-module))
$(eval $(generic-package))
