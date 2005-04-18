From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Bad superblock
Date: Mon, 18 Apr 2005 13:08:24 +0400
Message-ID: <1113815304.3781.42.camel@tribesman.namesys.com>
References: <20050416191336.14054.qmail@gawab.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23891-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050416191336.14054.qmail@gawab.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mahmoud Al Gammal <mahmoudfg@gawab.com>
Cc: reiserfs-list@namesys.com

Hello

On Sat, 2005-04-16 at 23:13, Mahmoud Al Gammal wrote:
> Hello,
> I'm using ReiserFS 3.6.19 on a partition whose superblock has
> been swept away due to a sudden attack of bad sectors. I'm
> wondering if ReiserFS keeps backup copies of the superblock...If
> yes, then where?

no, it does not

>  Or is there some other means to retrieve the
> data?
> 

copy partition with bad blocks to a good one with dd_rescue

reiserfsck --build-sb /dev/good-partition (use default answers if you
did not do anything specific with that filesystem like converting 3.5 to
3.6, journal relocation, etc)
reiserfsck --rebuild-tree /dev/good-partition

If this helps you - you may take a look at namesys.com/support.html

