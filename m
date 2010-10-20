From: Viji V Nair <viji@fedoraproject.org>
Subject: Compilation Issue - Reiser4
Date: Wed, 20 Oct 2010 15:23:45 +0530
Message-ID: <AANLkTimQ+8nyP3-Ah3p09Z=Dcq17eCoQ+euqztBABipA@mail.gmail.com>
Reply-To: Community support for Fedora users <users@lists.fedoraproject.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <users-bounces@lists.fedoraproject.org>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <https://admin.fedoraproject.org/mailman/listinfo/users>,
	<mailto:users-request@lists.fedoraproject.org?subject=unsubscribe>
List-Archive: <http://lists.fedoraproject.org/pipermail/users>
List-Post: <mailto:users@lists.fedoraproject.org>
List-Help: <mailto:users-request@lists.fedoraproject.org?subject=help>
List-Subscribe: <https://admin.fedoraproject.org/mailman/listinfo/users>,
	<mailto:users-request@lists.fedoraproject.org?subject=subscribe>
Sender: users-bounces@lists.fedoraproject.org
Errors-To: users-bounces@lists.fedoraproject.org
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, Community support for Fedora users <users@lists.fedoraproject.org>

Hi,

I am working on "kmod-reiser4" package, to pack the module only - will
help to avoid the full recompilation of the kernel. There are couple
of issues.

1. I have downloaded the kernel source package of fedora 13 and
patched for reiser4. I believe the module should get compiled with the
kernel-devel package, instead of the full source tree. The main
purpose of providing  the kernel development package with the
distribution is to support these kind of module development, but the
reise4 compilation fails with the following error.

# make CONFIG_REISER4_FS=3Dm CONFIG_REISER4_DEBUG=3Dn -C
/usr/src/kernels/2.6.34.7-56.fc13.x86_64/
M=3D/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.34.x86_64/f=
s/reiser4

make: Entering directory `/usr/src/kernels/2.6.34.7-56.fc13.x86_64'
  LD      /data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.34.x8=
6_64/fs/reiser4/built-in.o
  CC [M]  /data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.34.x8=
6_64/fs/reiser4/debug.o
  CC [M]  /data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.34.x8=
6_64/fs/reiser4/jnode.o
  CC [M]  /data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.34.x8=
6_64/fs/reiser4/znode.o
  CC [M]  /data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.34.x8=
6_64/fs/reiser4/key.o
  CC [M]  /data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.34.x8=
6_64/fs/reiser4/pool.o
  CC [M]  /data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.34.x8=
6_64/fs/reiser4/tree_mod.o
  CC [M]  /data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.34.x8=
6_64/fs/reiser4/estimate.o
  CC [M]  /data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.34.x8=
6_64/fs/reiser4/carry.o
  CC [M]  /data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.34.x8=
6_64/fs/reiser4/carry_ops.o
  CC [M]  /data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.34.x8=
6_64/fs/reiser4/lock.o
  CC [M]  /data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.34.x8=
6_64/fs/reiser4/tree.o
  CC [M]  /data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.34.x8=
6_64/fs/reiser4/context.o
/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.34.x86_64/fs/re=
iser4/context.c:
In function =91reiser4_throttle_write_at=92:
/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.34.x86_64/fs/re=
iser4/context.c:156:
error: implicit declaration of function =91current_is_flush_bd_task=92
make[1]: *** [/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.3=
4.x86_64/fs/reiser4/context.o]
Error 1
make: *** [_module_/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-=
2.6.34.x86_64/fs/reiser4]
Error 2
make: Leaving directory `/usr/src/kernels/2.6.34.7-56.fc13.x86_64'

2. If I compile against the full source tree,

      a. I need to run "make scripts && make prepare " first and
executing make "make CONFIG_REISER4_FS=3Dm CONFIG_REISER4_DEBUG=3Dn -C
/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.34.x86_64
M=3D/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.34.x86_64/f=
s/reiser4".
This is complaining about the missing Module.symvers file, this file
will be created automatically by running "make all" which is an
overhead.

      b. The module alone is getting compiled (on step a), but getting
the following error when trying to load.

insmod fs/reiser4/reiser4.ko
insmod: error inserting 'fs/reiser4/reiser4.ko': -1 Invalid module format


Any help on the above is greatly appreciated.

Thanks
Viji Nair
-- =

users mailing list
users@lists.fedoraproject.org
To unsubscribe or change subscription options:
https://admin.fedoraproject.org/mailman/listinfo/users
Guidelines: http://fedoraproject.org/wiki/Mailing_list_guidelines
