From: "Michael Konrad" <MKonrad@syr.edu>
Subject: Re: reiser4 mount issue
Date: Wed, 03 Sep 2003 08:21:50 -0400
Message-ID: <sf55a4b3.080@gwia201.syr.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15528-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita@Namesys.COM
Cc: reiserfs-list@Namesys.COM

Done, recompiled kernel and mount works fine.

Now onto using it.

Thank you,
Michael

>>> Nikita Danilov <Nikita@Namesys.COM> 09/03/03 06:11AM >>>
Michael Konrad writes:
 > Hello Yury,
 >=20
 > This is what occurs in kernel log, when I try the reiser4 mount:=20
 >=20
 > Sep  3 05:48:14 [kernel]  reiser4[mount(16746)]: get_ready_format40
 > (fs/reiser4/plugin/disk_format/disk_format40.c:229)[nikita-3228]:
 >=20
 > Here is the part of my .config file with reiserfs:
 >=20
 > CONFIG_REISER4_FS=3Dy
 > # CONFIG_REISER4_FS_SYSCALL is not set
 > # CONFIG_REISER4_LARGE_KEY is not set

Flip CONFIG_REISER4_LARGE_KEY

 > # CONFIG_REISER4_CHECK is not set
 > # CONFIG_REISER4_USE_EFLUSH is not set
 > # CONFIG_REISER4_BADBLOCKS is not set
 > CONFIG_REISERFS_FS=3Dy
 > # CONFIG_REISERFS_CHECK is not set
 > # CONFIG_REISERFS_PROC_INFO is not set
 >=20
 > Thank you,
 > Michael
 >=20
 > Michael Konrad
 > Systems Administrator
 > College of Visual and Performing Arts
 > Syracuse University
 > >>> Yury Umanets <umka@namesys.com> 09/03/03 01:25 AM >>>
 > On Wed, 2003-09-03 at 05:17, Michael Konrad wrote:

Nikita.

 >=20
 > Hello,
 >=20
 >=20
 > > Compile of linux-2.6.0-test4 with reiser4 is good.=20
 > > Compile of libaal-0.4.9 is good
 > > Compile of reiser4fsprogs-0.4.12 is good.
 > >=20
 > > mkfs.reiser4 /dev/hda8 is good.=20
 > >=20
 > > When I issue the following command:
 > >=20
 > > mount -t reiser4 /dev/hda8 /mnt/lfs  or
 >=20
 > > mount -t reiserfs /dev/hda8 /mnt/lfs=20
 > You should not be trying to mount it as reiserfs. Reiser4 is fully
 > different filesystem.
 > >=20
 > > I get the following error:=20
 > >=20
 > > mount: wrong fs type, bad option, bad superblock on /dev/hda8, or too
 > many mounted file systems
 > >=20
 > > cat /proc/filesystems=20
 > >=20
 > > list both reiserfs and reiser4
 > >=20
 > > Am I missing something simple here?
 > >=20
 > > Thank you,
 > > Michael
 >=20
 > You should be aware, that mkfs.reiser4 creates filesystem with large
 > keys by default. What key policy have you turned on when building
 > kernel? And what does kernel log say?
 >=20
 > Regards.
 >=20
 >=20
 >=20

