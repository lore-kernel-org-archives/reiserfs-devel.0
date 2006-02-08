From: Bernd Schubert <bernd-schubert@gmx.de>
Subject: Re: 2.6.15 Bug? New security model?
Date: Wed, 8 Feb 2006 13:14:59 +0100
Message-ID: <200602081314.59639.bernd-schubert@gmx.de>
References: <200602080212.27896.bernd-schubert@gmx.de> <43E94A02.2080205@vilain.net> <20060208053732.GA13560@butterfly.hjsoft.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28046-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060208053732.GA13560@butterfly.hjsoft.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: John M Flinchbaugh <john@hjsoft.com>, reiserfs-list@namesys.com
Cc: Sam Vilain <sam@vilain.net>, linux-kernel@vger.kernel.org

CC'ed also the reiser-list


On Wednesday 08 February 2006 06:37, John M Flinchbaugh wrote:
> On Wed, Feb 08, 2006 at 02:31:46PM +1300, Sam Vilain wrote:
> > Bernd Schubert wrote:
> > >With 2.6.15:
> > >bathl:~# touch /var/run/test
> > >touch: cannot touch `/var/run/test': Permission denied
> > >With 2.6.13:
> > >bathl:~# touch /var/run/test
> > >(No error message)
> >
> > Some ideas; ACLs, SELinux, Attributes, Capabilities.
>
> lsattr -d /var/run && lsattr /var/run

Indeed, with 2.6.13

bathl:~# lsattr -d /var/run
lsattr: Inappropriate ioctl for device While reading flags on /var/run

with 2.6.15.3

bathl:~# cat lsatr.out.2.6.15
=2D-S-ia-AcBZXEj-t- /var/run


After the problem came up, I already suspected something like this and=20
therefore already had the kernel recompiled without xattr support, so I =20
don't know why lsattr shows something for 2.6.15 and nothing for 2.6.13.

here the reiser part from the kernel config of 2.6.13=20

CONFIG_REISERFS_FS=3Dy
# CONFIG_REISERFS_CHECK is not set
CONFIG_REISERFS_PROC_INFO=3Dy
CONFIG_REISERFS_FS_XATTR=3Dy
CONFIG_REISERFS_FS_POSIX_ACL=3Dy
CONFIG_REISERFS_FS_SECURITY=3Dy
# CONFIG_JFS_FS is not set
CONFIG_FS_POSIX_ACL=3Dy

here 2.6.15

CONFIG_REISERFS_FS=3Dy
# CONFIG_REISERFS_CHECK is not set
CONFIG_REISERFS_PROC_INFO=3Dy
# CONFIG_REISERFS_FS_XATTR is not set
# CONFIG_JFS_FS is not set
CONFIG_FS_POSIX_ACL=3Dy
# CONFIG_XFS_FS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_ROMFS_FS is not set


Anyway, I never set any attributes using chattr, so these seem to be random=
=20
attributes, nice.



>
> I saw very similar things going from 2.6.15.1 to 2.6.15.2.  2.6.15.2's
> changelog advertises a fix to reenable extended attributes on reiserfs.
> On one machine this is fine, and lsattr shows no attributes enabled
> (----------), but on another machine, I ended up with all sorts of crazy
> attributes set seemingly randomly -- compression, experimental flags,
> immutable, append-only, all over the map.
>
> I tried clearing them (chattr -R =3D /var ...etc), but I still found a
> file here and there which refused to be removed, even though lsattr
> showed no flags for it.  After a restart or 2, I saw some attributes
> revert back and I started having trouble removing files from /var/run
> and other places again.
>
> I ended up reverting back to 2.6.15.1 until I have a chance to
> investigate further and try to come up with something reportable.  In
> 2.6.15.1, attributes didn't work at all, giving an ioctl error, though
> the same kernel options were used.  I suspect this is the fix to which
> the Changelog is referring.
>
> I must wonder if I'm suffering from some sort of fs corruption which
> only manifests itself in the attribute settings, and which a reisefsck
> doesn't recognize or correct.  I could be tempted to recreate the
> filesystems from scratch to see if they still have issues.

=2D-=20
Bernd Schubert
PCI / Theoretische Chemie
Universit=E4t Heidelberg
INF 229
69120 Heidelberg

