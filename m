From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: Sun, 13 Oct 2002 01:55:03 +0400
Message-ID: <3DA89A37.2070801@namesys.com>
References: <Pine.LNX.4.33L2.0210100853240.1670-100000@localhost.localdomain> <200210121052.22603.bofh@coker.com.au> <20021012150028.G14731@vestdata.no> <200210121600.39712.bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11665-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Russell Coker <bofh@coker.com.au>
Cc: =?ISO-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>, reiserfs-list@namesys.com

Russell Coker wrote:

>On Sat, 12 Oct 2002 15:00, Ragnar Kj=F8rstad wrote:
> =20
>
>>>I think that's about to change (if it hasn't already).  3ware sells RAID
>>>controllers that do 8 or 12 drives.  200G ATA drives are now on sale, and
>>>320G drives will be available soon.
>>>
>>>12 * 320G should solve the disk space issue for most people...
>>>     =20
>>>
>>The disk-space / cabeling-issue is mostly an IDE-problem anyway. If you
>>go SCSI/FC there is practically no limit on how much storage you can put
>>on a single server. (performance-issues aside)
>>
>>Sure, IDE is less expensive, but when comparing to NetApp there is
>>plenty of room to go for SCSI/FC - so diskspace should defenitively not
>>be an argument for going for NetApp.
>>   =20
>>
>
>Actually the problem then becomes case space.  On the linux IDE arrays lis=
t=20
>there are a few people having 2 or more 3ware cards, they have 16 or more =
IDE=20
>drives in a system.  With 24 inch cables they can get by with regular IDE =

>cabling (and S-ATA will solve this properly soon).  3ware cards allow supp=
ort=20
>for enough disks.  The problem then becomes what to house the disks in and=
=20
>how to supply enough power.
>
>Here's the URL for subscribing to the IDE arrays list, I think that many=20
>people here will be interested (Ragnar - you might want to make 3ware not =
be=20
>the only IDE RAID hardware that's supported on the list).
>http://lists.math.uh.edu/cgi-bin/mj_wwwusr
>
> =20
>
When I referred to disk space bound, I meant that users rarely have as=20
many gigabytes as they need given the dollars that they are willing to=20
spend.  One can always buy three servers if case space is limited.

Someday not too long from now, it will look like one filesystem even=20
though it is in multiple cases.  Whether that is in reiser5 or reiser6=20
depends on what sponsors fund first.

Hans


