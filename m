From: evilninja <evilninja@gmx.net>
Subject: Re: SUSE 9.1 with ReiserFS:  / won't fsck, but is otherwise fine
Date: Tue, 28 Sep 2004 00:16:53 +0200
Message-ID: <41589155.1050405@gmx.net>
References: <1095996040.10293.18.camel@xserver.local.net>	 <200409241116.09066.vitaly@namesys.com>	 <1096032016.17001.4.camel@xserver.local.net>	 <200409271844.11580.vitaly@namesys.com> <1096301165.9096.14.camel@xserver.local.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21942-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1096301165.9096.14.camel@xserver.local.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Chris Worley <cworley@symbionsys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Chris Worley wrote:
> On Mon, 2004-09-27 at 08:44, Vitaly Fertman wrote:
> 
>>># ./fsck/reiserfsck  /dev/system/lvol0
>>>reiserfsck 3.6.18 (2003 www.namesys.com)
>>>
>>>Failed to open the device '/dev/system/lvol0': No such device or address
>>
>>it seems 
>>	open ('/dev/system/lvol0', O_RDONLY);
>>returns "No such device or address". You can check it with strace.
>>
>>what if you run
>>	reiserfsck /dev/mapper/system-lvol0
> 
> 
> 
>         The strace dies on the open:
> 
> ...
> open("/dev/mapper/system-lvol0", O_RDONLY|O_LARGEFILE) = -1 ENXIO (No such device or address)
> ...
> 
>         Not even dd can open it:
>         
> # dd if=/dev/mapper/system-lvol0 bs=1024 count=1024 | sum
> dd: opening `/dev/mapper/system-lvol0': No such device or address

ah, now this is funny. dd doesn't care about the filesystem and can't even
read the device. this does not seem like a (reiser-)fs issue, more like a
corrupted partition table / device (if the data on
/dev/mapper/system-lvol0 is not (!) important, you could play around with

  $ mkfs.{ext3|xfs|reiserfs} /dev/mapper/system-lvol0

and see what it gives. (probably won't work too)

good luck,
Christian.
- --
BOFH excuse #180:

ether leak
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBWI5oC/PVm5+NVoYRAhM1AJ9Vwr+oX8Z7SaiRqzK5TPDn2tnS3gCg7K3K
VFq2Eped9ceUjbCWyOi+/+k=
=qVnK
-----END PGP SIGNATURE-----
