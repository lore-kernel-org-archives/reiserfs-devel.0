From: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Subject: Re: reiserfsprogs-3.6.12 release
Date: Thu, 12 Feb 2004 13:18:18 +0100
Message-ID: <200402121317.53245.henning-04@die.informatik.uni-siegen.de>
References: <200402102010.04479.vitaly@namesys.com> <20040211230435.GB8237@lostlogicx.com> <200402121431.26019.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16774-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200402121431.26019.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Vitaly Fertman <vitaly@namesys.com>

Am Donnerstag, 12. Februar 2004 12:31 schrieb Vitaly Fertman:
>
> hm, interesting, would you run
> 	stat /dev/hda3 (Henning, put here your root partition please)
> 	stat /dev/root
> 	stat /
> at bootup and when booted.

Thank you for the reply, sure, no problem.

=2D from an emergency shell

  File: `/'
  Size: 536             Blocks: 2          IO Block: 131072 directory
Device: 1607h/5639d     Inode: 2           Links: 21
Access: (0755/drwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)

  File: `/dev/hdc7' -> `ide/host0/bus1/target0/lun0/part7'
  Size: 33              Blocks: 0          IO Block: 1024   symbolic link
Device: ah/10d  Inode: 1322        Links: 1
Access: (0555/lr-xr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)

  File: `/dev/root' -> `ide/host0/bus1/target0/lun0/part7'
  Size: 33              Blocks: 0          IO Block: 1024   symbolic link
Device: ah/10d  Inode: 676         Links: 1
Access: (0555/lr-xr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)


=2D from a shell after bootup

  File: ,,/"
  Size: 536             Blocks: 2          IO Block: 131072 Verzeichnis
Device: 1607h/5639d     Inode: 2           Links: 21
Access: (0755/drwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)

  File: ,,/dev/hdc7" -> ,,ide/host0/bus1/target0/lun0/part7"
  Size: 33              Blocks: 0          IO Block: 1024   symbolische=20
Verkn=FCpfung
Device: ah/10d  Inode: 1322        Links: 1
Access: (0555/lr-xr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)

  File: ,,/dev/root" -> ,,ide/host0/bus1/target0/lun0/part7"
  Size: 33              Blocks: 0          IO Block: 1024   symbolische=20
Verkn=FCpfung
Device: ah/10d  Inode: 676         Links: 1
Access: (0555/lr-xr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)

Best regards,

Henning

