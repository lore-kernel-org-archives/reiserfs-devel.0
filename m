From: David Masover <ninja@slaphack.com>
Subject: Re: somewhat OT query on journalling
Date: Wed, 19 Jul 2006 14:09:15 -0500
Message-ID: <44BE835B.7020806@slaphack.com>
References: <20060719152744.GA26155@tranquility.scriptkitchen.com> <BAYC1-PASMTP07DA447E0F0B88B3C634ECBF600@CEZ.ICE>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29077-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <BAYC1-PASMTP07DA447E0F0B88B3C634ECBF600@CEZ.ICE>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Toby Thain <toby@smartgames.ca>
Cc: reiserfs-list@namesys.com

Toby Thain wrote:
> 
> On 19-Jul-06, at 11:27 AM, Payal Rathod wrote:
> 
>> Hi, ...
>> And lastly don't the journalling fs give a false sense of security to
>> the user, saying that the data is written to disk when in reality only an
>> entry is made in journal and data is still not committed to disk.
> 
> This last one is easy to answer: No. Regardless of the filesystem you're 
> using, there is no guarantee your data hits the disk until you fsync(). 
> Journalling filesystems don't change this. (And even after that, it 
> depends on the device doing the right thing :)

Interestingly, most modern IDE hard drives can not turn off write 
caching.  But, I'm guessing they have a big enough capacitor to flush 
that if you lose power.

I often turn off fsync, because it gets too abused.  There was a bug in 
Evolution where, when dragging columns, every time the display refreshed 
(as you were dragging), it would flush and fsync.  Now tell me, do I 
really need to be absolutely sure that, when recovering from a crash, my 
Evolution column widths are EXACTLY where they were while I was dragging 
the columns?

My philosophy is, unless you have a UPS device, loss of power will 
always result in lost data.  Crashes will also more often than not 
result in lost data.  So do frequent backups and have a 
managed/monitored UPS, so that when you lose power, your system flushes 
everything to disk and shuts down.
