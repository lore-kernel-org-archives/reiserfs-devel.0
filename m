From: Chris Mason <mason@suse.com>
Subject: Re: data-logging 2.4.23 patches: 1 reject in fs/inode.c in 2.4.25
Date: Fri, 20 Feb 2004 14:08:33 -0500
Message-ID: <1077304113.26934.8.camel@watt.suse.com>
References: <c12ap7$vor$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16871-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <c12ap7$vor$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Benecke <jens@spamfreemail.de>
Cc: reiserfs-list@namesys.com

On Thu, 2004-02-19 at 07:40, Jens Benecke wrote:
> Hi,
> 
> Chris' data-logging patches do not apply cleanly to 2.4.25, are they being
> updated?
> 
> I think the fix for inode.c is not very hard but I don't dare to fiddle
> around with file system code. ;)

Ok, I'll rediff the data logging + quota against 2.4.25.

-chris


