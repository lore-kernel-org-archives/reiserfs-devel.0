From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: what do you do that stresses your filesystem?
Date: Mon, 23 Dec 2002 22:04:17 +0100
Message-ID: <3E077A51.8000401@mb.tu-ilmenau.de>
References: <3E06F360.7000708@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12231-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list <reiserfs-list@namesys.com>

On 12/23/2002 12:28 PM, Hans Reiser wrote:
> We were discussing how to optimize reiser4 best, and came to realize 
> that us developers did not have a good enough intuition for what users 
> do that stresses their filesystem enough that they care about its 
> performance.
> 
> If you just do edits of files it probably does not matter too much what 
> fs you use.
> 
> Booting the machine seems like one activity that many users end up 
> waiting on the FS for.  Yes?
> 
> Starting up complex and big applications like xemacs and mozilla would 
> be another.  Yes?
> 
> Others?

Anyone already mentioned VMware sessions? ;-)

Running VMware on a Linux host would be an example. The application 
itself is no problem for the fs. But maybe the case when the VMware's 
guest OS is under high memory usage and disk i/o and VMware swaps out to 
a file in /tmp on the host OS. Usually this happens at the same time 
when Linux swaps out the "unneeded" things, on here: parts of KDE and 
Netscape7+.
So it is no fs only stress test at all. I can suggest running SpeedDisk 
on your fragmented Win98 disks from within VMware to have this scenario. 
(Then, switching to a mail composer window under Linux and waiting for 
the cursor ... takes ... some time...)

Regards,

Manuel

> 
> Hans
> 
> PS
> 
> reiser4 performance is up a lot recently, and within two weeks I think 
> cp -r will have been optimized as much as is worth doing.  cp -r 
> accesses files in readdir order, and that does indeed seem worth 
> optimizing, but soon we will need to optimize more sophisticated access 
> patterns than that.....
> 
> Hans

