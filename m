From: Milan =?ISO-8859-1?Q?Holz=E4pfel?= <lists@mjh.name>
Subject: Problem with unmounting readonly-mounted Reiser4 - only when
 debugging options enabled
Date: Wed, 25 Aug 2004 15:06:45 +0200
Sender: news <news@sea.gmane.org>
Message-ID: <20040825150645.06383d00.lists@mjh.name>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20500-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi

| bombax mnt # mount /dev/sd/c0b0t0u0p8 gentoo/  # sd/c0b0t0u0p8 is Reiser4
| bombax mnt # ls gentoo/
| .   bin   dev  home  mnt  proc  sbin  tmp  var
| ..  boot  etc  lib   opt  root  sys   usr
| bombax mnt # find gentoo -type f -exec cat "{}" ";" >/dev/null=20
| bombax mnt # umount gentoo

This works all right.

| bombax mnt # mount /dev/sd/c0b0t0u0p8 gentoo/ -o ro
| bombax mnt # ls gentoo/
| .   bin   dev  home  mnt  proc  sbin  tmp  var
| ..  boot  etc  lib   opt  root  sys   usr
| bombax mnt # umount gentoo

This is ok too.

| bombax mnt # mount /dev/sd/c0b0t0u0p8 /mnt/gentoo/ -o ro=20
| bombax mnt # ls gentoo=20
| .   bin   dev  home  mnt  proc  sbin  tmp  var
| ..  boot  etc  lib   opt  root  sys   usr
| bombax mnt # find gentoo -type f -exec cat "{}" ";" >/dev/null=20
| bombax mnt # umount gentoo

But this produces trouble: The mount doesn't return and I get the
following in the syslog:

| Aug 25 14:46:46 bombax ef_hash_table: 8192 buckets
| Aug 25 14:46:46 bombax z_hash_table: 8192 buckets
| Aug 25 14:46:46 bombax z_hash_table: 8192 buckets
| Aug 25 14:46:46 bombax j_hash_table: 16384 buckets
| Aug 25 14:46:46 bombax loading reiser4 bitmap......done (16 jiffies)
| Aug 25 14:46:46 bombax d_cursor_hash_table: 256 buckets

(this is from mounting the partition; output from umount command starts her=
e: )

| Aug 25 14:47:06 bombax reiser4[umount(8150)]: atom_begin_andlock (fs/reis=
er4/txnmgr.c:759)[nikita-3366]:
| Aug 25 14:47:06 bombax WARNING: Creating atom on rofs
| Aug 25 14:47:06 bombax [<c01e374e>] atom_begin_andlock+0x3ce/0x4b0
| Aug 25 14:47:06 bombax [<c01e6306>] try_capture_block+0x236/0x5a0
| Aug 25 14:47:06 bombax [<c01e6771>] try_capture+0x71/0x150
| Aug 25 14:47:06 bombax [<c01e6a68>] try_capture_page_to_invalidate+0x58/0=
x2b0
| Aug 25 14:47:06 bombax [<c01b3418>] schedulable+0x8/0x80
| Aug 25 14:47:06 bombax [<c022007d>] reiser4_invalidatepage+0xbd/0x540
| Aug 25 14:47:06 bombax [<c01e2bd8>] txn_end+0x68/0x1a0
| Aug 25 14:47:06 bombax [<c01b338c>] preempt_point+0xc/0x90
| Aug 25 14:47:06 bombax [<c01e2bd8>] txn_end+0x68/0x1a0
| Aug 25 14:47:06 bombax [<c0139f27>] do_invalidatepage+0x27/0x30
| Aug 25 14:47:06 bombax [<c0139f8b>] truncate_complete_page+0x5b/0x60
| Aug 25 14:47:06 bombax [<c013a14b>] truncate_inode_pages_range+0x13b/0x320
| Aug 25 14:47:06 bombax [<c02199cc>] reiser4_destroy_inode+0xbc/0x350
| Aug 25 14:47:06 bombax [<c013a35f>] truncate_inode_pages+0x2f/0x40
| Aug 25 14:47:06 bombax [<c0163cd0>] dispose_list+0x80/0xa0
| Aug 25 14:47:06 bombax [<c0163e3b>] invalidate_inodes+0x4b/0x70
| Aug 25 14:47:06 bombax [<c01522b2>] generic_shutdown_super+0x62/0x160
| Aug 25 14:47:06 bombax [<c0152cad>] kill_block_super+0x1d/0x40
| Aug 25 14:47:06 bombax [<c01521d0>] deactivate_super+0x50/0x70
| Aug 25 14:47:06 bombax [<c0166b3f>] sys_umount+0x3f/0x90
| Aug 25 14:47:06 bombax [<c014105b>] do_munmap+0x12b/0x180
| Aug 25 14:47:06 bombax [<c01410f4>] sys_munmap+0x44/0x70
| Aug 25 14:47:06 bombax [<c0166ba7>] sys_oldumount+0x17/0x20
| Aug 25 14:47:06 bombax [<c0103f3b>] syscall_call+0x7/0xb
| Aug 25 14:47:06 bombax reiser4[umount(8150)]: atom_begin_andlock (fs/reis=
er4/txnmgr.c:759)[nikita-3366]:
| Aug 25 14:47:06 bombax WARNING: Creating atom on rofs
| Aug 25 14:47:06 bombax [<c01e374e>] atom_begin_andlock+0x3ce/0x4b0
| Aug 25 14:47:06 bombax [<c01e6306>] try_capture_block+0x236/0x5a0
| Aug 25 14:47:06 bombax [<c01e6771>] try_capture+0x71/0x150
| Aug 25 14:47:06 bombax [<c01e6a68>] try_capture_page_to_invalidate+0x58/0=
x2b0
| Aug 25 14:47:06 bombax [<c022007d>] reiser4_invalidatepage+0xbd/0x540
| Aug 25 14:47:06 bombax [<c01e2bd8>] txn_end+0x68/0x1a0
| Aug 25 14:47:06 bombax [<c01b338c>] preempt_point+0xc/0x90
| Aug 25 14:47:06 bombax [<c01e2bd8>] txn_end+0x68/0x1a0
| Aug 25 14:47:06 bombax [<c0139f27>] do_invalidatepage+0x27/0x30
| Aug 25 14:47:06 bombax [<c0139f8b>] truncate_complete_page+0x5b/0x60
| Aug 25 14:47:06 bombax [<c013a14b>] truncate_inode_pages_range+0x13b/0x320
| Aug 25 14:47:06 bombax [<c02199cc>] reiser4_destroy_inode+0xbc/0x350
| Aug 25 14:47:06 bombax [<c013a35f>] truncate_inode_pages+0x2f/0x40
| Aug 25 14:47:06 bombax [<c0163cd0>] dispose_list+0x80/0xa0
| Aug 25 14:47:06 bombax [<c0163e3b>] invalidate_inodes+0x4b/0x70
| Aug 25 14:47:06 bombax [<c01522b2>] generic_shutdown_super+0x62/0x160
| Aug 25 14:47:06 bombax [<c0152cad>] kill_block_super+0x1d/0x40
| Aug 25 14:47:06 bombax [<c01521d0>] deactivate_super+0x50/0x70
| Aug 25 14:47:06 bombax [<c0166b3f>] sys_umount+0x3f/0x90
| Aug 25 14:47:06 bombax [<c014105b>] do_munmap+0x12b/0x180
| Aug 25 14:47:06 bombax [<c01410f4>] sys_munmap+0x44/0x70
| Aug 25 14:47:06 bombax [<c0166ba7>] sys_oldumount+0x17/0x20
| Aug 25 14:47:06 bombax [<c0103f3b>] syscall_call+0x7/0xb

I guess these two backtraces are exactly the same, and they are repeated
until I press the reset button.  fsck before the whole thing says FS is
consistent.  I experience this on a 2.6.8.1-mm4 with all debugging
except CONFIG_REISER4_DEBUG_MEMCPY enabled, but without them the above
commands work perfectly fine. =20

So probably not a big problem but quite a bit annoying... =20

Regards,
Milan


- --=20

                   Milan Holz=E4pfel alias jagdfalke alias jag

Meine eMail-Adresse ist hier zu              You can find my eMail-address
                      finden:                here:
Kontaktinfos sowie                                   Contact infos as well =
as
=D6ff GnuPG-Schl=FCssel    <URL:http://con.mjh.name/>    GnuPG Public Key
GnuPG Fingerabdruck     4C8A 5FAF 5D32 6125 89D1     GnuPG Fingerprint
                        0CE5 DB0C AF4F 6583 7966


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBLI7l2wyvT2WDeWYRAqKhAKDVV/PtczsEvoK40PDtKVap89DEqwCdGXvH
hrjTmD9OcKZy8WwhNb5u33Y=3D
=3DzNGW
-----END PGP SIGNATURE-----

