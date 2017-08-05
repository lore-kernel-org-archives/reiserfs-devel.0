From: <doiggl@velocitynet.com.au>
Subject: What paremeters to add to .config to  allow kernel build with a reiser4 patch [reiser4-for-4.11.0.patch.?
Date: Sat, 05 Aug 2017 19:50:40 +1000
Message-ID: <6601b2f794b6717733db28e9f571b0c6@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: opensuse-kernel@opensuse.org, opensuse-packaging@opensuse.org, reiserfs-devel@vger.kernel.org

Hello.
What paremeters to add to .config to  allow kernel build with a reiser4
patch [reiser4-for-4.11.0.patch ]?
- make oldconfig seems to remove them.

Add in:
CONFIG_REISER4_DEBUG=n
CONFIG_REISER4_FS=m

#
Am I missing any parameters ? 
Thanks for your expertise.
--Glenn

urls

:spec
https://build.opensuse.org/package/view_file/home:doiggl/kernel-vanilla/kernel-vanilla.spec?expand=1

:reiser4 parameters allow patch to enable patch.
https://build.opensuse.org/package/view_file/home:doiggl/kernel-vanilla/zreiser4parameters.txt?expand=1

reiser4 patch
[reiser4-for-4.11.0.patch.gz 	2017-06-03 	625.9 kB]
https://sourceforge.net/projects/reiser4/files/reiser4-for-linux-4.x/reiser4-for-4.11.0.patch.gz

:build log.
https://build.opensuse.org/build/home:doiggl/openSUSE_13.1/i586/kernel-vanilla/_log
:build log content

[   74s] # configuration written to .config
[   74s] #
[   74s] make[1]: Leaving directory
`/home/abuild/rpmbuild/BUILD/kernel-vanilla-4.12.4/linux-4.12/linux-obj'
[   74s] make: Leaving directory
`/home/abuild/rpmbuild/BUILD/kernel-vanilla-4.12.4/linux-4.12'
[   74s] + echo '#run:
/home/abuild/rpmbuild/SOURCES/check-for-config-changes .config.orig
.config'
[   74s] #run: /home/abuild/rpmbuild/SOURCES/check-for-config-changes
.config.orig .config
[   74s] + /home/abuild/rpmbuild/SOURCES/check-for-config-changes
.config.orig .config
[   74s] 
[   74s] Changes after running `make oldconfig':
[   74s] -# CONFIG_FRAME_POINTER_UNWINDER is not set
[   74s] -# CONFIG_GUESS_UNWINDER is not set
[   74s] +# CONFIG_REISER4_DEBUG is not set
[   74s] -# CONFIG_SUSE_KERNEL_SUPPORTED is not set
[   74s] -CONFIG_CRASHER=m
[   74s] -CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
[   74s] -CONFIG_NF_CONNTRACK_SLP=m
[   74s] -CONFIG_ORC_UNWINDER=y
[   74s] -CONFIG_REISER4_DEBUG=n
[   74s] -CONFIG_REISER4_DEBUG=n
[   74s] -CONFIG_REISER4_FS=m
[   74s] -CONFIG_SUSE_KERNEL=y
[   74s] -CONFIG_UNWIND_INFO=y
[   74s] 
[   74s] error: Bad exit status from /var/tmp/rpm-tmp.OzqHE8 (%prep)
[   74s] 
[   74s] 
[   74s] RPM build errors:
[   74s]     Bad exit status from /var/tmp/rpm-tmp.OzqHE8 (%prep)
[   74s] 
[   74s] cloud135 failed "build kernel-vanilla.spec" at Sat Aug  5
08:57:33 UTC 2017.
[   74s] 
[   74s] ### VM INTERACTION START ###
[   79s] [   50.623286] reboot: Power down
[   91s] ### VM INTERACTION END ###
[   91s] 
[   91s] cloud135 failed "build kernel-vanilla.spec" at Sat Aug  5
08:57:51 UTC 2017.

