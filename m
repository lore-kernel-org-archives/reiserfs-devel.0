From: Chris Mason <mason@suse.com>
Subject: Re: Chris: mason/patches/data-logging/experimental/2.6.1 upside
	down?
Date: Tue, 13 Jan 2004 16:56:25 -0500
Message-ID: <1074030984.32707.989.camel@tiny.suse.com>
References: <3171912.lEEDWjxvxS@spamfreemail.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16490-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3171912.lEEDWjxvxS@spamfreemail.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Benecke <jens-usenet@spamfreemail.de>
Cc: reiserfs-list@namesys.com

On Tue, 2004-01-13 at 16:32, Jens Benecke wrote:
> Hi,
> 
> the "journal-writer.gz" in the above dir starts with
> 
> diff -Nur --exclude=RCS --exclude=CVS --exclude=SCCS --exclude=BitKeeper
> --exclude=ChangeSet linux.dammit/fs/reiserfs/do_balan.c linux.25.1/fs
> reiserfs/do_balan.c
> --- linux.dammit/fs/reiserfs/do_balan.c Fri Jan  9 15:18:17 2004
> +++ linux.25.1/fs/reiserfs/do_balan.c   Thu Dec  4 14:20:19 2003
> 
> and only REMOVES code, doesn't add anything.
> 
> Any chance you patched the wrong way round? ;-)

No, it's supposed to remove code ;-)  It's getting rid of some old
debugging cruft that should have been shot long ago.

> oh yes... and is the "data-logging.gz" on the state of the 2.4.23 patches
> that are also in your directory (ie. can I mount with journal=ordered etc)?

Full data=ordered/logging patches are still only in use privately, where
they happily hose filesystems.  I'm getting there ;-)

-chris


