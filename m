From: Steven Cole <elenstev@mesatop.com>
Subject: Re: mm vs. official for reiser4.
Date: Thu, 5 Feb 2004 21:16:01 -0700
Message-ID: <200402052116.01485.elenstev@mesatop.com>
References: <16419.38404.592630.141335@laputa.namesys.com> <16419.41118.153096.216109@laputa.namesys.com> <4023D127.7030301@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16721-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4023D127.7030301@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, Nikita Danilov <Nikita@Namesys.COM>
Cc: sander@humilis.net, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

On Friday 06 February 2004 10:38 am, Hans Reiser wrote:
> Until we have removed all bugs that we can hit with internal testing, we
> will produce snapshots for use with only one kernel branch.  I am
> guessing that more reiser4 testers will use Linus kernel than Morton's.
> Readers should correct me if I err.....

Only one kernel branch: Agree.
Linus vs Andrew's tree for reiser4: Andrew's tree.

If you look at the patch flow since 2.6.0, a large majority of patches 
come in via Andrew's -mm tree.  This has been the staging area for
new stuff, and this arrangement was explicitly addressed by Linus and
Andrew.

I've been doing testing lately _only_ with the -mm tree, and just today
got an oops while umounting a reiserfs v3 partition.  Andrew responded
with a one line fix within 30 minutes (the problem was not with reiserfs BTW).

I think you'll greatly increase the chances of getting reiser4 into 2.6 by making
it easy for Andrew to incorporate it into the -mm tree first.  Reiser4 may have to
sit in -mm for a couple of months, but at least it will be on Andrew's radar screen.

Steven
