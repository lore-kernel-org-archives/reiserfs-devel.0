From: Oleg Drokin <green@namesys.com>
Subject: Re: Horrible ftruncate performance
Date: Fri, 11 Jul 2003 19:38:14 +0400
Message-ID: <20030711153814.GH17180@namesys.com>
References: <20030710052931.GA17957@namesys.com> <200307111716.56823.Dieter.Nuetzel@hamburg.de> <20030711152431.GF17180@namesys.com> <200307111732.49524.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14896-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200307111732.49524.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>
Cc: reiserfs-list@namesys.com, Chris Mason <mason@suse.com>

Gello!

On Fri, Jul 11, 2003 at 05:32:49PM +0200, Dieter N?tzel wrote:
> > > OK some "hand work"...
> Where comes this from?

It was there for a lot of time. Like for not less than 2 years, I'd say.

> I don't find it my tree:

reiserfs quota patch got rid of it.
Here's relevant part of my diff:
            if (retval) {
-               reiserfs_free_block (th, allocated_block_nr);
+               reiserfs_free_block (th, inode, allocated_block_nr, 1);
                goto failure;
            }
-           if (done) {
-               inode->i_blocks += inode->i_sb->s_blocksize / 512;
-           } else {
+           if (!done) {
                /* We need to mark new file size in case this function will be
                   interrupted/aborted later on. And we may do this only for
                   holes. */

Bye,
    Oleg
