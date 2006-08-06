From: Lexington Luthor <Lexington.Luthor@gmail.com>
Subject: Re: Another article abour Reiser4 on linux.com
Date: Sun, 06 Aug 2006 18:06:53 +0100
Message-ID: <eb57je$cll$1@sea.gmane.org>
References: <87bqqzbaug.fsf@baldur.nicundtas.de> <200608061304.42692.bernd-schubert@gmx.de> <eb4o19$5ik$1@sea.gmane.org> <200608061515.28467.bernd-schubert@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29513-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608061515.28467.bernd-schubert@gmx.de>
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Bernd Schubert wrote:
> Well, by having a FUSE port just more users would use reiser4, which might 
> increase the force to the linux distributors to include reiser4 into their 
> kernel versions. 
> 

I don't think reiser4 would gain many users if it is crippled by being 
in userspace. All the lazy flushing and aggressive caching become 
useless if it cannot interact directly with the pagecache and respond to 
memory pressure. Would you tolerate a 2GB process just to run a 
filesystem? Thats what reiser4 can do if it is in the kernel, and 
silently give back memory only when needed.

> Regarding the speed, I understand that its slower with FUSE, I was also deeply 
> impressed when I read this  
> (http://sourceforge.net/mailarchive/forum.php?thread_id=23836054&forum_id=2697)
> 
> 	But being twice as fast as ext3 is enough currently. It's even faster than 
> 	xfs what I use. Sometimes I'm quite suprised why something is so fast when
> 	I realize that it was actually ntfs-3g :-)
> 

Those micro-benchmarks do not represent anything like normal use. NTFS 
is probably the most complicated filesystem on the planet, so there is 
zero chance that a *working* implementation of it can outperform 
something like XFS... even reiser4 barely beats XFS in many situations 
(actually slower than XFS for heavy local rsync activity).


- LL

