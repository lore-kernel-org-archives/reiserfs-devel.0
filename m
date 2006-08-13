From: Justin Piszcz <jpiszcz@lucidpixels.com>
Subject: Re: A Word of Warning about Linux Software Raid
Date: Sun, 13 Aug 2006 07:20:32 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0608130720030.6949@p34.internal.lan>
References: <1155319786.8121.43.camel@localhost.localdomain>
 <20060811213450.cf67e32e.reiser4@blinkenlights.ch>
 <20060812123342.BEFC03BE@philou.gramoulle.local>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-1463747160-152109910-1155468032=:6949"
Return-path: <reiserfs-list-return-29588-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060812123342.BEFC03BE@philou.gramoulle.local>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe@gramoulle.com>
Cc: reiserfs-list@namesys.com

---1463747160-152109910-1155468032=:6949
Content-Type: TEXT/PLAIN; charset=X-UNKNOWN; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE



On Sat, 12 Aug 2006, Philippe Gramoull=E9 wrote:

>
> Hello,
>
> On Fri, 11 Aug 2006 21:34:50 +0200
> Adrian Ulrich <reiser4@blinkenlights.ch> wrote:
>
>  | > It seems that the kernel does not check the integrity of the data on=
 mirrored raid,
>  |
>  | It does if you tell the kernel to do so:
>  |
>  | # echo check > /sys/block/md0/md/sync_action
>
> I have just upgraded from an older kernel to be able to use such a functi=
onality but :
>
> boogie:~# cat /proc/mdstat
> Personalities : [linear] [raid0] [raid1] [raid5] [raid4] [raid6] [multipa=
th]
> md0 : active raid0 sde1[0] sdk1[6] sdj1[5] sdi1[4] sdh1[3] sdg1[2] sdf1[1=
]
>      501773440 blocks 64k chunks
>
> unused devices: <none>
>
> boogie:~# echo check > /sys/block/md0/md/sync_action
> -bash: /sys/block/md0/md/sync_action: Permission denied
>
> boogie:~# mount | grep sys
> sysfs on /sys type sysfs (rw)
>
> What am i missing here ?
>
> Thanks,
>
> Philippe
>

There is no parity with raid0, so there should be nothing to check?


---1463747160-152109910-1155468032=:6949--
