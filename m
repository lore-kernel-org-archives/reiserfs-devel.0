From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Re: [PATCH CFT] tons of logging patches
Date: Mon, 17 Jun 2002 02:31:42 +0200
Message-ID: <3D0D2DEE.7080909@mb.tu-ilmenau.de>
References: <1023076301.22608.1778.camel@tiny>	<3CFC1CB5.8040102@mb.tu-ilmenau.de>	<1023	 157228.31475.38.camel@tiny>	<3CFC33F2.7080009@mb.tu-ilmenau.de>	<1023196345.31682.81.camel@tiny>	<3CFE7EFB.6080203@mb.tu-ilmenau.de> 	<3CFE8234.7010006@mb.tu-ilmenau.de>	<1023322167.2920.772.camel@tiny>  <3D07CBE7.5080701@mb.tu-ilmenau.de> <1024274859.11086.68.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10752-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 06/17/2002 02:47 AM, Chris Mason wrote:
> On Wed, 2002-06-12 at 18:32, Manuel Krause wrote:
> 
>>On 06/06/2002 02:09 AM, Chris Mason wrote:
>>
>>>Ok, ftp.suse.com/pub/people/mason/patches/data-logging has my latest
>>>updates, which have more optimizations for many threads all doing
>>>synchronous transactions.
>>>
>>>-chris
>>>
>>
>>Mmh. I recompiled with the new one when it appeared on the server and 
>>kept the kernel append line with the obvious problem not to be able to 
>>easily reboot to my ext2 maintenance partition.
> 
> 
> Hmmm, I might have found it, but this isn't a new bug to the 07 patch. 
> Have you been able to reproduce, or have you fallen back to the older
> patches?
> 

You mean 03-beta-data-logging-7.diff.gz when saying "07 patch"? Then I 
didn't go back according to my disk content.

When I boot up I read on screen and in boot.msg:
  ...
  EXT2-fs: Unrecognized mount option data
  reiserfs: using ordered data mode
  reiserfs: found format "3.6" with standard journal
  reiserfs: checking transaction log (ide0(3,7)) for (ide0(3,7))
  (...)
  Using r5 hash to sort names
  ...

Addon is: I use the ReiserFS pending patches that apply as I mentionned 
previously(?).

No, it looks o.k. here.


> -chris
> 

Manuel


