From: Ookhoi <ookhoi@humilis.net>
Subject: new reiserfs4 snapshots?
Date: Mon, 23 Dec 2002 12:49:18 +0100
Message-ID: <20021223124918.A17993@humilis>
References: <3E06F360.7000708@namesys.com>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12200-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E06F360.7000708@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS <reiserfs-list@namesys.com>

Hans Reiser wrote (ao):
> We were discussing how to optimize reiser4 best, and came to realize
> that us developers did not have a good enough intuition for what users
> do that stresses their filesystem enough that they care about its
> performance.
> 
> If you just do edits of files it probably does not matter too much
> what fs you use.
> 
> Booting the machine seems like one activity that many users end up
> waiting on the FS for.  Yes?
> 
> Starting up complex and big applications like xemacs and mozilla would
> be another.  Yes?
> 
> Others?

find?
(un)tar sources/backups/etc?
mail? (mbox/maildir; large mailboxes)

> Hans
> 
> PS
> 
> reiser4 performance is up a lot recently, and within two weeks I think
> cp -r will have been optimized as much as is worth doing.  cp -r
> accesses files in readdir order, and that does indeed seem worth
> optimizing, but soon we will need to optimize more sophisticated
> access patterns than that.....

Can you please make new reiserfs4 snapshots available for testing? The
last one is from December 4.

I tried to pull the linux kernel bk and the reiserfs ones, got a kernel
that compiled and booted, but the fs went bellyup pretty fast. I don't
think a report is useful as the bk pulls are moving targets. Am I right?

Also I'm not sure I did it the right way as I couldn't find it
documented. Can you please point me to some documentation or provide
quick instructions in a reply?

Thank you and the team for these great filesystems.
