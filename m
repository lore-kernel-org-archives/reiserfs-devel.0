From: Michael.James@csiro.au
Subject: un-long listable files
Date: Wed, 6 Aug 2003 14:31:39 +1000
Message-ID: <200308061431.13695.Michael.James@csiro.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15169-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I'm running into this problem repeatedly.
Anyone know what's going on here?

I'm running Suse8.2 with the default reiserfs filesystem.
Suse8.2 # cat /etc/fstab
/dev/hda6       /               reiserfs defaults               1 1
/dev/hda5       /altOS          reiserfs defaults               1 2
/dev/hda1       /boot           ext2    defaults                1 2
/dev/hda8       /home           reiserfs defaults               1 2
/dev/hda7       swap            swap    pri=3D42                  0 0


=46rom time to time, an application segfaults out,
 (Grip and VMware have done it)
 leaving me with a file that hangs a long listing.
It's usually a big one.

eg:=20
ls  winXPPro.vmdk		is fine, no problem characters in the filename
ls -l  winXPPro.vmdk		is not, hangs forever
echo *			is fine

It's not just a character in the name causing the trouble.
touch *			is fine but doesn't help
chown me:grp *		is fine but doesn't help
chmod 644 *		is fine but doesn't help

I can cat it, but not cp it.
I can rm it, then the directory becomes listable.

So try stracing it.
strace    ls -l winXPPro.vmdk		gives:

<lots of lines snipped>

lstat64("ls-fail", {st_mode=3DS_IFREG|0644, st_size=3D6932, ...}) =3D 0
        getxattr("strace.ls", "system.posix_acl_access", (nil), 0) =3D -1
        EOPNOTSUPP (Operation not supported)

lstat64("winXPPro.vmdk",
        {st_mode=3DS_IFREG|0644, st_size=3D95416320, ...}) =3D 0

getxattr("light_in_time_of_darkness__glad_to_see_you.wav",
         "system.posix_acl_access"

and there it sits waiting for heat-death-of-universe.

To cope with line-wrapping I've tabbed extensions in
 and put an extra newline at real line breaks.

Looks like I'm falling foul of some strange ACLs.
ls -l as root still hangs though.


So I took the trouble to drop down to run level 1,
 unmount /home and do a fsck.reiser on it.
It ran without finding any errors.
Ran it again with --fix-fixable, still nothing,
 but now everything works and the files are listable!

Hmpf, I don't like this, problems down in reiserfs?
michaelj


PS:
suse8.2 # cat /proc/version
	Linux version 2.4.20-4GB (root@Pentium.suse.de)
	 (gcc version 3.3 20030226 (prerelease)
	 (SuSE Linux)) #1 Fri Jul 11 07:33:18 UTC 2003

suse8.2 # rpm -qf /boot/vmlinuz
	k_deflt-2.4.20-96


=2D-=20
Michael James				michael.james@csiro.au
System Administrator			voice:	02 6246 5040
CSIRO Bioinformatics Facility	fax:		02 6246 5166
