From: Anders Widman <andewid@tnonline.net>
Subject: Re: Bad Blocks?
Date: Wed, 30 Oct 2002 23:22:11 +0100
Message-ID: <17384992609.20021030232211@tnonline.net>
References: <1035999303.1204.31.camel@preston>
 <200201020842.58067.degerrit@web.de>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11847-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200201020842.58067.degerrit@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> -----BEGIN PGP SIGNED MESSAGE-----

> Often hard drive manufacturers provide utilities to check their disks and 
> remap bad blocks, I was able to get rid of mine using Maxtor's Powermax or 
> something. After that you can reiserfsck --rebuild-tree and you should end up 
> with a mountable fs.

Bad blocks are alsu subject to warranty. Maxtor has on-site service.
They will send you a new drive with UPS so you can make backup. Then
you send the broken drive back.

Use their "Advanced RMA" on www.maxtor.com.

> However, you should see this as a temporary measure (to mount your fs, and 
> make a good backup) - in my experience with this one disk, more bad blocks 
> keep appearing after a while. (Against my own advice, I'm still using my 
> disk, though)

> Also see http://namesys.com/bad-block-handling.html

> Cheers,
> - - Gerrit


> On Wednesday 30 October 2002 18:35, Preston Lord wrote:
>> I am running the latest reiserfsprogs 3.6.4
>>
>> I came home last week to find my Linux pc was locked up. After rebooting
>> the root partition would not mount. All other partitions are fine. I
>> have the failed hard drive in another linux pc now and am trying to
>> recover the data from the failed partition. When I run
>>
>> reiserfsck --check /dev/hda5
>>
>> I get this:
>>
>> The problem has occurred looks like a hardware problem.
>> Check your hard drive for badblocks.
>>
>> bread: Cannot read the block (16).
>>
>>
>> how can I fix this bad block?
>>
>> Linux Kernel 2.4.18
>>
>> Thanks
>>
>> Preston
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.0 (GNU/Linux)

> iQCVAwUBPDK59wtVJ+MDouLxAQGS1QP/WuEvM/TwRkHbtueD6P6usviVhMQu7RnE
> mfT1fSzpb0cyVOmStIRp1c8KNLhaaZRJs747ZtJjPXJV5lqO7N4cJ8sVa2hm/PwY
> uBrFdEA/6cQaWBu2Kt9H3CPOhrrJYWwYXHow3qaYJUhhmAVWphNQEALEQU15A5iG
> LPwM7Z3HQpk=
> =VqVJ
> -----END PGP SIGNATURE-----

