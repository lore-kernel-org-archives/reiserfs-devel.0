From: Oleg Drokin <green@namesys.com>
Subject: Re: ReiserFS is not suitable for a root FS.
Date: Sat, 17 May 2003 15:40:07 +0400
Message-ID: <20030517114007.GA20790@namesys.com>
References: <200305172030.58775.russell@coker.com.au> <200305172109.53538.russell@coker.com.au> <20030517112446.GA20672@namesys.com> <200305172132.34865.russell@coker.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14141-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200305172132.34865.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell Coker <russell@coker.com.au>
Cc: ReiserFS <reiserfs-list@namesys.com>

Hello!

On Sat, May 17, 2003 at 09:32:34PM +1000, Russell Coker wrote:
> > > Having the kernel just trash system memory because of bad data on disk is
> > > a bug.
> > You cannot check all the on disk values, this is too bik performance
> > impact. Nobody does that in Linux, I think.
> I really doubt that.
> On 99.99% of all machines in use the data can be checked much faster than it 
> can be read from disk.  There is little benefit in not checking, but there 
> are huge problems when something goes wrong if you don't check.
> Corrupted disks are not uncommon.  Otherwise we wouldn't need fsck programs!

Turn on CONFIG_REISERFS_CHECK and notice how you became CPU-bound instead of disk bound
suddenly.
Nobody does this in general case in linux.

Bye,
    Oleg
