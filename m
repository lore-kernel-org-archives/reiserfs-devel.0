From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsprogs 3.6.5 release
Date: Tue, 25 Mar 2003 14:22:25 +0300
Message-ID: <200303251422.25804.vitaly@namesys.com>
References: <200303251108.11938.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13372-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200303251108.11938.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?utf-8?q?N=C3=BCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>


Hi,=20

On Tuesday 25 March 2003 13:08, Dieter N=C3=BCtzel wrote:
> Hello all,
>
> after my update to reiserfsprogs-3.6.5 no partition would be mounted duri=
ng
> boot ;-( It started with the reiserfsprogs-3.6.5-pre2 release.
> reiserfsprogs-3.6.5-pre1 is fine and what I currently use.
> The latest final is much faster and smooth during --check,
> --clear-attributes, --rebuild-sb, --rebuild-tree but the boot thing
> wouldn't go away after all my search.
>
> ---
> Checking all file systems...
> fsck 1.24a (02-Sep-2001)
> Reiserfs super block in block 16 on 0x803 of format 3.6 with standard
> journal Blocks (total/free): 26105/6638 by 4096 bytes
> Filesystem is cleanly umounted
>
> flush_buffers: device is not specifed

Trying to reproduce the problem, no success yet.
Could you run reiserfsck -a /dev/sda3 and tell me what it says?


Thank you for spelling and other corrections!

--=20

Thanks,
Vitaly Fertman
