From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsprogs-3.6.12 release
Date: Thu, 12 Feb 2004 17:10:19 +0300
Message-ID: <200402121710.19639.vitaly@namesys.com>
References: <200402102010.04479.vitaly@namesys.com> <200402121431.26019.vitaly@namesys.com> <200402121317.53245.henning-04@die.informatik.uni-siegen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16776-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200402121317.53245.henning-04@die.informatik.uni-siegen.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Cc: reiserfs-list@namesys.com

>   File: ,,/"
>   Size: 536             Blocks: 2          IO Block: 131072 Verzeichnis
> Device: 1607h/5639d     Inode: 2           Links: 21
> Access: (0755/drwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)
>
>   File: ,,/dev/hdc7" -> ,,ide/host0/bus1/target0/lun0/part7"
>   Size: 33              Blocks: 0          IO Block: 1024   symbolische
> Verkn=FCpfung
> Device: ah/10d  Inode: 1322        Links: 1
> Access: (0555/lr-xr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)
>
>   File: ,,/dev/root" -> ,,ide/host0/bus1/target0/lun0/part7"
>   Size: 33              Blocks: 0          IO Block: 1024   symbolische
> Verkn=FCpfung
> Device: ah/10d  Inode: 676         Links: 1
> Access: (0555/lr-xr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)

so dev is devfs. ok, would you then
	stat ide/host0/bus1/target0/lun0/part7
?

looks like rdev of the device file on devfs does not match to dev of its
mount point.

=2D-
Thanks,
Vitaly Fertman

