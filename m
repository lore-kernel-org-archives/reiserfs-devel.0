From: Oleg Drokin <green@namesys.com>
Subject: Re: Fwd: Re: [reiserfs-list] best reiserfs mount options for generic benchmarking
Date: Sat, 14 Sep 2002 23:54:24 +0400
Message-ID: <20020914235424.A29361@namesys.com>
References: <200209141335.43329.bofh@coker.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11449-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200209141335.43329.bofh@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell Coker <bofh@coker.com.au>
Cc: reiserfs-list@namesys.com

Hello!

On Sat, Sep 14, 2002 at 01:35:43PM +0200, Russell Coker wrote:

> You'll never want a 400M journal on a real system (unless you've got many
> terabytes of disk space and the journal is striped across several spindles).

For data journaling modes 400M+ journals might be useful not to
force often journal flushes.
Also if journal blocks may easily become real data blocks without real data
moving (called wandered logs in reiser4), limiting journal in size is 
just gives you no benefit.
Also there are filesystems that are consist of journal only
(jffs and jffs2 is what coming to my mind immmediately) and there journal
size is equal to filesystem size.

Bye,
    Oleg 
