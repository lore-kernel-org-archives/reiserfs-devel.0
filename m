From: Chris Mason <mason@suse.com>
Subject: Re: fast approximate file count
Date: 23 Sep 2002 09:07:53 -0400
Message-ID: <1032786474.3489.370.camel@tiny>
References: <E17scwJ-0003ij-00@yodel.jab.org> 
	<20020923020703.GA4570@tapu.f00f.org>  <1032748227.30721.5.camel@yodel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11518-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1032748227.30721.5.camel@yodel>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Breidenbach <jeff@jab.org>
Cc: Chris Wedgwood <cw@f00f.org>, reiserfs-list@namesys.com

On Sun, 2002-09-22 at 22:30, Jeff Breidenbach wrote:
> df -i does not work for reiserfs, at least under Debian 3.0.
> For example, the following partition is actually more than 10% 
> full.
> 
> Filesystem            Inodes   IUsed   IFree IUse% Mounted on
> /dev/sdb1            4294967295       0 4294967295    0% /home/archive
> 
> >From responses so far, my understanding is there may be
> a partition-wide file counter possible in the future.
> 
> However, it also sounds like there is little to no chance of a
> reiserfs-specific fast approximate file counter that will work on a
> directory subtree, even if that subtree is very wide and shallow.

Correct, that information isn't really stored.  Not very hard to deal
with from an application point of view though

ln -s 8,765,432 num_files

8765432 doesn't have to exist, you can just read the symbolic link.

Note that if each file name has a fixed size, you can deduce the number
of files in the directory from the directory size.

-chris


