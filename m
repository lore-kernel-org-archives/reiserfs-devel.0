From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Horrible ftruncate performance
Date: Fri, 11 Jul 2003 17:32:49 +0200
Message-ID: <200307111732.49524.Dieter.Nuetzel@hamburg.de>
References: <20030710052931.GA17957@namesys.com> <200307111716.56823.Dieter.Nuetzel@hamburg.de> <20030711152431.GF17180@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14891-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030711152431.GF17180@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com, Chris Mason <mason@suse.com>

Am Freitag, 11. Juli 2003 17:24 schrieb Oleg Drokin:
> Hello!
>
> On Fri, Jul 11, 2003 at 05:16:56PM +0200, Dieter N?tzel wrote:
> > OK some "hand work"...

Where comes this from?
I don't find it my tree:

fs/eiserfs/inode.c

-            if (un.unfm_nodenum)
                 inode->i_blocks += inode->i_sb->s_blocksize / 512;
             //mark_tail_converted (inode);

Thanks,
	Dieter

