# AI Assistance Attribution

## Assignment 8 - Buildroot Character Driver Integration

OpenAI Codex/ChatGPT was used as a collaborative programming assistant for the
Assignment 8 Buildroot integration on October 17, 2026.

### Full chat history

https://chatgpt.com/s/cx_6ad400f57728819180d4f6450bf29492

### AI-assisted files

- `base_external/package/aesd-assignments/aesd-assignments.mk`
- `base_external/rootfs_overlay/etc/init.d/S98aesdchar`
- `AI_ATTRIBUTION.md`

The assignment-selection change was course starter code merged from
`buildroot-assignments-base/assignment8`.

### Assistance provided

AI assistance enabled the assignments package's kernel-module integration for
`aesd-char-driver`, forced clean target builds to prevent stale host binaries
from entering the AArch64 image, and added a boot script that loads the module,
resolves its dynamic major number, creates `/dev/aesdchar`, and unloads it
cleanly. AI assistance used a local Buildroot source override for pre-commit
validation and then pinned the final package to native commit
`4878e89fb6b6d28a355857bb74b45a24dc2a1f86`.

### Student review and verification

The student completed an interactive review covering newline-delimited pending
writes, circular-buffer eviction and allocation ownership, read offsets,
kernel and user-space locking, error paths, test-coverage limits, and device
permission implications. The integrated Buildroot package produced AArch64
versions of both `aesdsocket` and `aesdchar.ko`. The generated image booted in
QEMU, loaded the driver before starting the socket server, successfully
unloaded/reloaded the driver, and passed the course Assignment 8
`drivertest.sh` and `sockettest.sh` validations. A subsequent build fetched the
pinned native commit directly from GitHub, rebuilt the target applications and
module, regenerated the image, and passed both QEMU validations again. GitHub
Actions full-test run `39081095603` passed on attempt 7. Earlier attempts were
interrupted by missing repository secret configuration, runner termination,
job timeout while the host was suspended, and host reboot; a reboot-corrupted
OpenSSL intermediate directory was cleaned before the successful retry. The
successful run built the pinned native source, booted QEMU, loaded and
unloaded `aesdchar`, and passed both `drivertest.sh` and `sockettest.sh`.

### External code and sources

No external implementation code and no other student's assignment were used.
Requirements, starter changes, and tests came from the supplied Assignment 8
instructions, the course `aesd-assignments` and
`buildroot-assignments-base` repositories, and the course-provided tests.

### Other student assignments

No other student's assignment was used, supplied to the AI, or referenced.

## Assignment 7 Part 2 - Buildroot Kernel Modules

- Full chat history: https://chatgpt.com/s/cx_6ac93e63e5f081919b89f40a3ba75ff9
- AI-assisted files: `base_external/Config.in`,
  `base_external/configs/aesd_qemu_defconfig`,
  `base_external/package/ldd/Config.in`,
  `base_external/package/ldd/ldd.mk`,
  `base_external/rootfs_overlay/etc/init.d/S98lddmodules`, and
  `AI_ATTRIBUTION.md`.
- Assistance provided: Added a Buildroot kernel-module package for the course
  `misc-modules` and `scull` sources, enabled it in the saved configuration,
  added the relative rootfs overlay, and implemented startup, device-node,
  rollback, shutdown, and restart handling for `scull`, `faulty`, and `hello`.
- Student review and verification: The student explained module registration,
  major/minor device routing, why dynamic major numbers cannot be guessed,
  required rollback when discovery fails, wrapped circular-buffer ordering,
  allocation ownership, and the diagnostic and security meaning of the
  observed kernel oops. The package cross-compiled for AArch64, the image
  built and booted in QEMU, all required modules and nodes appeared, the
  personalized hello message appeared in `/var/log/messages`, stop/restart
  cleanup succeeded, and the course Assignment 7 Buildroot validation passed
  locally. The GitHub Actions full test passed in run `37979774999`.
- External code and sources: Course Assignment 7 instructions, course starter
  repositories and tests, upstream `ldd3`, and Buildroot 2024.02.13
  documentation. No external implementation code was reused.
- Other student assignments used: No.

## Assignment 5 Part 2 - Buildroot Socket Server Integration

- Full chat history:
  https://chatgpt.com/s/cx_6ab9a5c51dc08191aa55f3e47918260e
- AI-assisted files:
  `base_external/package/aesd-assignments/aesd-assignments.mk`, `runqemu.sh`,
  and `AI_ATTRIBUTION.md`. The Assignment 5 workflow, assignment-selection,
  and `save-config.sh` changes came from the course-provided
  `buildroot-assignments-base/assignment5` merge.
- Assistance provided: Added cross-compilation and target installation of
  `aesdsocket`, installed its init script as `/etc/init.d/S99aesdsocket`, and
  added QEMU host forwarding for port 9000 while retaining SSH forwarding on
  port 10022. Configured the new Assignment 5 classroom repository as
  `origin` while preserving the Assignment 4 remote.
- Student review and verification: The student explained TCP newline framing,
  partial sends, signal-handler safety, graceful persistent-file cleanup,
  Buildroot startup and forwarding, and network/SSH mitigations. A local-source
  Buildroot package build produced an AArch64 executable and image. QEMU
  automatically started the server, SSH and socket forwarding worked, the
  course socket test passed, graceful halt ran the stop script, and a restart
  confirmed old socket data was absent. GitHub Actions full test run
  `36341879376` completed successfully.
- External code and sources: Course Assignment 5 instructions, course starter
  repositories and tests, and upstream Buildroot 2024.02.13. No external
  implementation code was reused.
- Other student assignments used: No.

## Assignment 4 Part 2 - Buildroot Environment Bringup

- Full chat history: https://chatgpt.com/s/cx_6aab4ce579e88191872276dcf9a3ca97
- AI-assisted files: `.gitmodules`, `.github/workflows/github-actions.yml`,
  `base_external/Config.in`,
  `base_external/external.desc`, `base_external/external.mk`,
  `base_external/configs/aesd_qemu_defconfig`,
  `base_external/package/aesd-assignments/aesd-assignments.mk`, `clean.sh`, and
  `AI_ATTRIBUTION.md`.
- Assistance provided: Added and pinned the Buildroot submodule, created the
  external-tree metadata, implemented the source package build and target
  installation rules, saved the AESD package/Dropbear/root-password
  configuration, and added the required clean script. After a clean Actions
  build exceeded the original two-hour limit while downloading dependencies,
  AI assistance increased the job timeout and added a persistent Buildroot
  download cache.
- Student review and verification: The student explained working-directory
  path resolution, reproducible source revisions, cross-compilation, staging
  under `TARGET_DIR`, fail-fast behavior, safer production SSH access, and the
  end-to-end Buildroot/QEMU flow. Source-side and configuration validation,
  the full image build, AArch64 QEMU boot, SSH/SCP checks, syslog verification,
  and the course `full-test.sh` passed. GitHub Actions run
  `35456772299` also completed successfully from a clean checkout.
  The student also explained that the first cache-enabled workflow run must
  populate the cache, while subsequent runs can reuse the cached downloads.
- External code and sources: Course starter files, course Assignment 4 Part 2
  instructions, course tests, and upstream Buildroot 2024.02.13. No external
  implementation code was reused.
- Other student assignments used: No.
