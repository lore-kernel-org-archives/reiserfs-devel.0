From: Yury Umanets <umka@namesys.com>
Subject: Re: Gnu Parted error, Kernel Panic, Reiserfs
Date: Fri, 16 Apr 2004 13:00:14 +0300
Message-ID: <1082109613.30899.19.camel@firefly>
References: <Pine.LNX.4.21.0404161030320.13317-100000@mlf.linux.rulez.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17986-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.21.0404161030320.13317-100000@mlf.linux.rulez.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Szakacsits Szabolcs <szaka@sienet.hu>
Cc: Alan Chu <alanchu@MIT.EDU>, Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com, bug-parted@gnu.org

On Fri, 2004-04-16 at 11:57, Szakacsits Szabolcs wrote:
> On Fri, 16 Apr 2004, Alan Chu wrote:
> 
> > My / partition is officially borked.  I would highly recommend NOT using
> > Gnu Parted, btw.  It's screwed up my partitions twice now.  Guess I'm
> 
> Many people reports constantly Parted/QTparted, well actually
> progsreiserfs what's a reimplementation of reiserfsprogs, thrashes
> reiserfs for a while.
> 
> Yury V. Umanets only comments were "nobody ever reported such to him". You
> can see more on several forums, mailing lists (parted, qtparted, etc), I
> also pointed out to him these corruptions on the parted list several
> times. But I don't know for who Yuri works now, recently I've seen using
> both clusterfs and namesys email addresses, so maybe its not his "job"
> anymore.
> 
> But definitely nobody cares about the issue for about half or one year. At
> least reiserfs support should have been disabled in parted until somebody
> would investigate/fix these corruptions.
> 
> 	Szaka

Hi!

I'm on-like, but seems missed mentioned emails somehow.

Specking about the problem. Yes, I know that there is something bad in
progsreiserfs with resizefs part. 

But I should say that I have no any details and moreover, nobody was so
kind to send me at least something but complains that it does not work,
nevertheless somebody promised to give more details of crashes.

So guys, I say again. I will fix bugs if I will know more about.

What I need to know is the following:

(1) was reiserfs consistent before resizing or not (what last reiserfsck
said before resizing).

(2) what version of reiserfs was used.
(3) sequence of actions or/and detailed description of what was done.
(4) is it visible using both parted and qtparted?
(5) more any details.

Thanks.

-- 
umka

