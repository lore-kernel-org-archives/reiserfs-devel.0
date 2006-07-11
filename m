From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: reiser4 oops
Date: Tue, 11 Jul 2006 00:43:25 -0600
Message-ID: <1152600205.10888.44.camel@gentoo>
References: <op.tb00v9njd4os1z@localhost> <1151900677.10172.22.camel@gentoo>
	 <1151921448.6335.42.camel@tribesman.namesys.com>
	 <1151969007.10172.23.camel@gentoo>  <1152256712.9797.17.camel@gentoo>
	 <1152278167.6236.21.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28949-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1152278167.6236.21.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: =?iso-8859-2?Q?=A3ukasz?= Mierzwa <prymitive@pcserwis.net>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

I tried 2.6.17-mm6 (was the latest at the time) and reiser4 still always
fails when it runs out of memory. My test has been building a kernel
with enough jobs to exhaust memory. Expecting problems, I began by
testing reiser4 with debugging enabled.

The first time, I got the panic below after running "while true ; do
make mrproper && zcat /proc/config.gz > .config && make -j64 ; done" in
linux-2.6.17-mm6 (on a fresh test filesystem) for an unknown duration of
time.

        reiser4 panicked cowardly: reiser4[cc1(12238)]: page_bio (fs/reiser=
4/page_cache.c:434)[nikita-2276]:
        Kernel panic - not syncing: reiser4[cc1(12238)]: page_bio (fs/reise=
r4/page_cache.c:434)[nikita-2276]:

The next two times, after about half an hour of the above command I got
the panic below (except the second time was with cc1 instead of fixdep).

        reiser4 panicked cowardly: reiser4[fixdep(19463)]: sibling_list_rem=
ove (fs/reiser4/tree_walk.c:813)[zam-32245]:
        Kernel panic - not syncing: reiser4[fixdep(19463)]: sibling_list_re=
move (fs/reiser4/tree_walk.c:813)[zam-32245]:

The third time the filesystem wasn't clean after a reboot. fsck.reiser4
--check logged:
http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/20060711/fsck3=
_--check.txt.gz
       =20
fsck.reiser4 --fix logged:
http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/20060711/fsck3=
_--fix.txt.gz

Another --check turned up clean:=20
http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/20060711/fsck3=
_--check_after_--fix.txt.gz

Things got slightly more interesting with debugging disabled. The first
time I got the following OOPS after some "flushing like mad" messages. A
bunch of cc1 process were stuck in the D state.

http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/20060711/messa=
ges4.txt.gz
http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/20060711/fsck4=
_--check.txt.gz
http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/20060711/fsck4=
_--fix.txt.gz
http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/20060711/fsck4=
_--check_after_--fix.txt.gz

The second time I got:

http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/20060711/messa=
ges5.txt.gz
http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/20060711/fsck5=
_--check.txt.gz
http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/20060711/fsck5=
_--fix.txt.gz
http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/20060711/fsck5=
_--check_after_--fix.txt.gz

On Fri, 2006-07-07 at 17:16 +0400, Vladimir V. Saveliev wrote:
> Hello
>=20
> On Fri, 2006-07-07 at 01:18 -0600, Jake Maciejewski wrote:
> > It doesn't look like this issue has been fixed:
> >=20
> > http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/20060702/r=
eiser4_kio_http.txt.gz
> >=20
> > Again fsck showed a clean filesystem. Should I try -mm?
> >=20
>=20
> Yes, please try to check whether latest mm has this problem.
>=20
> > This is somewhat difficult to reproduce because the critical factor
> > seems to be using all available memory, however in doing so the system
> > quickly becomes unresponsive.
> >=20
> > On Mon, 2006-07-03 at 17:23 -0600, Jake Maciejewski wrote:
> > > Thanks for the patch. I don't think I'll be able to test it before
> > > Wednesday, though.
> > >=20
> > > On Mon, 2006-07-03 at 14:10 +0400, Vladimir V. Saveliev wrote:
> > > > Hello
> > > >=20
> > > > On Sun, 2006-07-02 at 22:24 -0600, Jake Maciejewski wrote:
> > > > > I'm seeing this on 2.6.16.20 with the -4 patch, amd64 with preemp=
t. The
> > > > > OOM killer was called even though I have 1GB RAM and 4GB swap. My=
 logs
> > > > > are available at:
> > > > >=20
> > > > > http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/2006=
0702/oom.txt.gz
> > > > >=20
> > > > > Both affected filesystems (rsync was using one filesystem, cc1 th=
e
> > > > > other) came up clean with fsck.
> > > > >=20
> > > > > On Sat, 2006-07-01 at 22:08 +0200, =A3ukasz Mierzwa wrote:
> > > > > > I'm running x86 gentoo system with / on reiser4, I'm using
> > > > > > suspend-sources-2.6.16-r8 kernel with 2.6.16-4 patch. Today I r=
un emerge
> > > > > > --sync, after that I started to compile new xine-lib while brow=
sing net,
> > > > > > when xine-lib was finishing I got this errors:
> > > > > >=20
> > > > > > kernel BUG at fs/inode.c:253!
> > > >=20
> > > > would you please check whether this patch helps?
> > > > ftp://ftp.ru.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.=
6.17/2.6.17-mm5/broken-out/reiser4-run-truncate_inode_pages-in-reiser4_dele=
te_inode.patch
> > > >=20
> > > >=20
> > > > > > invalid opcode: 0000 [#1]
> > > > > > PREEMPT
> > > > > > Modules linked in: ndiswrapper fglrx acer_acpi nsc_ircc irda cr=
c_ccitt
> > > > > > snd_atiixp snd_ac97_codec snd_ac97_bus yenta_socket rsrc_nonsta=
tic
> > > > > > pcmcia_core tifm_7xx1 tifm_core
> > > > > > CPU:    0
> > > > > > EIP:    0060:[<c017bc56>]    Tainted: P      VLI
> > > > > > EFLAGS: 00010206   (2.6.16-suspend2-r8 #2)
> > > > > > EIP is at clear_inode+0x16/0xb0
> > > > > > eax: 00000003   ebx: d5245d20   ecx: 00000000   edx: d5245df8
> > > > > > esi: df2099c0   edi: c2a3a000   ebp: c2a3a000   esp: c2a3be94
> > > > > > ds: 007b   es: 007b   ss: 0068
> > > > > > Process emerge (pid: 9123, threadinfo=3Dc2a3a000 task=3Dc2a0ba7=
0)
> > > > > > Stack: <0>df2099c0 d5245d20 df2099c0 c01db519 c017a385 00000000=
 00000400
> > > > > > d5245e28
> > > > > >          d5245d20 c2a3a000 d415c114 d5245d20 c01db4e0 c017bd59 =
d5245d20
> > > > > > dfe9b000
> > > > > >                 c017b81c d415c114 c017a431 00000000 dfe9b000 df=
533000
> > > > > > c2a3bf50 c0172d74
> > > > > >                 Call Trace:
> > > > > >                  [<c01db519>] reiser4_delete_inode+0x39/0xc0
> > > > > >                   [<c017a385>] dput+0x25/0x170
> > > > > >                    [<c01db4e0>] reiser4_delete_inode+0x0/0xc0
> > > > > >                     [<c017bd59>] generic_delete_inode+0x69/0x10=
0
> > > > > >                      [<c017b81c>] iput+0x5c/0x70
> > > > > >                       [<c017a431>] dput+0xd1/0x170
> > > > > >                        [<c0172d74>] sys_renameat+0x1c4/0x1f0
> > > > > >                         [<c0172dc7>] sys_rename+0x27/0x30
> > > > > >                          [<c0102ef3>] sysenter_past_esp+0x54/0x=
75
> > > > > >                          Code: 80 98 00 00 00 8b 40 38 eb c4 8d=
 74 26 00 8d
> > > > > > bc 27 00 00 00 00 56 53 89 c3 83 ec 04 e8 14 b0 fe ff 8b 83 c4 =
00 00 00 85
> > > > > > c0 74 08 <0f> 0b fd 00 ab d4 37 c0 8b 83 20 01 00 00 a8 10 75 0=
8 0f 0b ff
> > > > > >                           <4>reiser4[emerge(9123)]: release_uni=
x_file
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >                           reiser4[emerge(9123)]: release_unix_f=
ile
> > > > > > (fs/reiser4/plugin/file/file.c:2294)[vs-44]:
> > > > > >                           WARNING: out of memory?
> > > > > >=20
> > > > > > I rebooted, remounted / read only and run fsck --fix, I had to =
run fsck
> > > > > > --build-fs becouse of fatal corruptions, I got whole lot of err=
ors
> > > > > > referring to /usr/portage dir but fs is now ok.
> > > >=20
>=20
--=20
Jake Maciejewski <maciejej@msoe.edu>

