From: Jeff Breidenbach <jeff@jab.org>
Subject: Re: fast approximate file count
Date: 22 Sep 2002 19:30:27 -0700
Message-ID: <1032748227.30721.5.camel@yodel>
References: <E17scwJ-0003ij-00@yodel.jab.org> 
	<20020923020703.GA4570@tapu.f00f.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11517-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020923020703.GA4570@tapu.f00f.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Wedgwood <cw@f00f.org>
Cc: reiserfs-list@namesys.com

df -i does not work for reiserfs, at least under Debian 3.0.
For example, the following partition is actually more than 10% 
full.

Filesystem            Inodes   IUsed   IFree IUse% Mounted on
/dev/sdb1            4294967295       0 4294967295    0% /home/archive

From responses so far, my understanding is there may be
a partition-wide file counter possible in the future.

However, it also sounds like there is little to no chance of a
reiserfs-specific fast approximate file counter that will work on a
directory subtree, even if that subtree is very wide and shallow.

-Jeff


On Sun, 2002-09-22 at 19:07, Chris Wedgwood wrote:
> On Fri, Sep 20, 2002 at 10:36:23PM -0700, Jeff Breidenbach wrote:
> 
> > Now that I have millions of small files on my reiserfs partition,
> > I'd like to know if there is reiserfs specific way to count them
> > very quickly.
> 
> Does df -i work?
> 
> 
>   --cw
> 


