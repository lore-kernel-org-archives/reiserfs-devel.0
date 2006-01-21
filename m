From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: reiserfs tails and disk space
Date: Sat, 21 Jan 2006 19:08:23 +0100
Message-ID: <43D27897.3090500@free.fr>
References: <20060117181548.GB11010@untroubled.org> <200601182134.49888.vitaly@namesys.com> <20060119195349.GC11010@untroubled.org> <200601200100.58038.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27821-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200601200100.58038.vitaly@namesys.com>
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Bruce Guenter <lists-reiserfs-list@bruce-guenter.dyndns.org>

Le 19.01.2006 23:00, Vitaly Fertman a =E9crit :
> On Thursday 19 January 2006 22:53, Bruce Guenter wrote:
>=20
>>On Wed, Jan 18, 2006 at 09:34:49PM +0300, Vitaly Fertman wrote:
>>
>>>thank you for the report, the attached patch should fix=20
>>>the broken mount options. please try it.
>>
>>It does indeed fix the problem.  What other mount options would have
>>been affected by this problem? =20
>=20
>=20
> it does not seem to brake anything else.
>=20
>=20
>>In what version of the kernel was this=20
>>problem introduced?
>=20
>=20
> 2.6.13.
>=20

This patch have been pushed into 2.6.16-rc1-mm2, and now I have some
permissions problems : I'm not able to update some files or
directories althought the permissions seems OK. Not all files are
impacted.

Reverting
someone-broke-reiserfs-v3-mount-options-this-fixes-it.patch fixes my
permissions problems.

I have to say this filesystem have been badly hit by the
2.6.16-rc1-mm1 reiserfs' bugs. I had to issue a "fsck.reiserfs
--rebuild-tree" to get back about 1 Gb of files in lost+found
(reiserfsck 3.6.19).

Here are some logs taken with an unpatched 2.6.16-rc1-mm2 kernel :

Script started on Sat Jan 21 17:54:22 2006
[ this is root user ]
sh-3.00# cd /home/gnutella/
sh-3.00# df -h .
Filesystem            Size  Used Avail Use% Mounted on
/dev/mapper/vglinux1-lvhome
                      5.0G  4.8G  291M  95% /home
sh-3.00# mount
[...]
/dev/mapper/vglinux1-lvhome on /home type reiserfs (rw)
[...]
sh-3.00# ls -ld .
drwx--x--x  18 gnutella gnutella 768 Jan 21 16:35 .
sh-3.00# ls -l
total 16
drwxr-xr-x  3 gnutella gnutella  72 Dec 24  2002 News
lrwxrwxrwx  1 gnutella gnutella  21 Jan 20 00:19 azureus ->
/home/laurent/azureus
-rw-r--r--  1 root     root     121 Jan 21 16:35 essai
-rw-r--r--  1 root     root     121 Jan 21 15:44 essai2
-rw-r--r--  1 root     root     121 Jan 21 16:24 essai3
-rw-r--r--  1 root     root       0 Jan 21 16:35 essai4
drwxr-xr-x  5 gnutella gnutella 120 Jan 20 00:11 klibido
-rw-------  1 gnutella gnutella 377 Jan 20 00:22 nohup.out
drwx------  7 gnutella gnutella 320 Jan 21 04:08 tmp
sh-3.00# touch essai5
touch: cannot touch `essai5': Permission denied
sh-3.00# > eesai5
sh: eesai5: Permission denied
sh-3.00# rm essai
rm: remove write-protected regular file `essai'? y
rm: cannot remove `essai': Permission denied
sh-3.00# strace touch essai
execve("/bin/touch", ["touch", "essai"], [/* 13 vars */]) =3D 0
uname({sys=3D"Linux", node=3D"antares.localdomain", ...}) =3D 0
brk(0)                                  =3D 0x8051000
[...]
open("essai", O_WRONLY|O_NONBLOCK|O_CREAT|O_NOCTTY|O_LARGEFILE,
0666) =3D -1 EACCES (Permission denied)
utime("essai", NULL)                    =3D -1 EACCES (Permission denied)
write(2, "touch: ", 7touch: )                  =3D 7
write(2, "cannot touch `essai\'", 20cannot touch `essai')   =3D 20
write(2, ": Permission denied", 19: Permission denied)     =3D 19
write(2, "\n", 1
)                       =3D 1
exit_group(1)                           =3D ?
Process 1699 detached
sh-3.00# ls -l
total 16
drwxr-xr-x  3 gnutella gnutella  72 Dec 24  2002 News
lrwxrwxrwx  1 gnutella gnutella  21 Jan 20 00:19 azureus ->
/home/laurent/azureus
-rw-r--r--  1 root     root     121 Jan 21 16:35 essai
-rw-r--r--  1 root     root     121 Jan 21 15:44 essai2
-rw-r--r--  1 root     root     121 Jan 21 16:24 essai3
-rw-r--r--  1 root     root       0 Jan 21 16:35 essai4
drwxr-xr-x  5 gnutella gnutella 120 Jan 20 00:11 klibido
-rw-------  1 gnutella gnutella 377 Jan 20 00:22 nohup.out
drwx------  7 gnutella gnutella 320 Jan 21 04:08 tmp
sh-3.00# strace vi essai 2>/tmp/trace
[...]
sh-3.00# grep essai /tmp/essai
execve("/bin/vi", ["vi", "essai"], [/* 13 vars */]) =3D 0
stat64("essai", {st_mode=3DS_IFREG|0644, st_size=3D121, ...}) =3D 0
stat64("/home/gnutella/essai", {st_mode=3DS_IFREG|0644, st_size=3D121,
...}) =3D 0
stat64("essai", {st_mode=3DS_IFREG|0644, st_size=3D121, ...}) =3D 0
stat64("essai", {st_mode=3DS_IFREG|0644, st_size=3D121, ...}) =3D 0
access("essai", W_OK)                   =3D -1 EACCES (Permission denied)
open("essai", O_RDONLY|O_LARGEFILE)     =3D 3
open("essai", O_RDONLY|O_LARGEFILE)     =3D 3
stat64("essai", {st_mode=3DS_IFREG|0644, st_size=3D121, ...}) =3D 0
sh-3.00#
Script done on Sat Jan 21 18:24:23 2006

~~
laurent

