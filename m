From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 performance
Date: Mon, 08 Aug 2005 19:02:19 -0500
Message-ID: <42F7F28B.7010602@slaphack.com>
References: <dd7cbn$kbg$1@sea.gmane.org> <200508081409.03814.rmeijer@internet.gr> <42F7B8F4.80101@slaphack.com> <42F7D77E.5080108@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25364-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42F7D77E.5080108@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: "Raymond A. Meijer" <rmeijer@internet.gr>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>

Hans Reiser wrote:
> David Masover wrote:
> 
> 
>>Raymond A. Meijer wrote:
>>
>>
>>>On Monday 8 August 2005 13:32, Hemiplegic Menehune wrote:
>>>
>>>
>>>
>>>>Its already as stable as any other fs on my systems and recovers
>>>>better than most when my battery runs out. Any idea when it will make
>>>>it into the stable 2.6 kernel?
>>>
>>>
>>>
>>>If only it had a resizer :(
>>
>>
>>Resizer isn't such a big deal.  I can usually find enough backup for
>>enough of what I want, and I usually get sizes right the first time.
>>
>>What I want is the repacker, beacuse performance does steadily degrade
>>on my Reiser4 systems, eventually getting worse than Reiser3, 
> 
> 
> I am skeptical that it gets worse than V3, unless it is because we
> haven't put in all the bitmap optimizations we did for V3.  I wish I
> knew how to measure it.....

Me too.  It's fairly subjective on my part, so maybe not.  After all, 
I've gone from lots-of-tiny-partitions to one-huge-root-partition at the 
same time as I switched from v3 to v4, and I know that most of this is 
probably /usr/portage.  With a repacker, Reiser4 would be the best FS 
for /usr/portage -- it's over a hundred thousand shell scripts and text 
files which get updated usually once a day or once a week with rsync -- 
but without a repacker, it's best kept on a separate partition.

