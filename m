From: Sander <sander@humilis.net>
Subject: Re: mm vs. official for reiser4.
Date: Fri, 6 Feb 2004 18:58:48 +0100
Message-ID: <20040206175848.GA32486@favonius>
References: <16419.38404.592630.141335@laputa.namesys.com> <20040206140319.GC30481@favonius> <16419.41118.153096.216109@laputa.namesys.com> <4023D127.7030301@namesys.com>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16719-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4023D127.7030301@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Nikita Danilov <Nikita@namesys.com>, sander@humilis.net, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

Hi Hans,

Hans Reiser wrote (ao):
> Until we have removed all bugs that we can hit with internal testing,
> we will produce snapshots for use with only one kernel branch. I am
> guessing that more reiser4 testers will use Linus kernel than
> Morton's. Readers should correct me if I err.....

Well, I use -mm exclusively. Not only because it is more moving than the
standard kernel (it even has some extra trees which are not in the
standard kernel), but also because Andrew will be the 2.6 maintainer
after Linus opens 2.7.

Also, your plans are to get Reiserfs4 into the -mm tree first, right?
Then IMHO it makes more sense to move the current snapshots to -mm now,
as people can test it and tell Andrew it works great. And then when it
gets included in -mm, people don't have to switch from standard kernel +
snapshot patch, to a (quite different from standard) -mm tree.

Also, because -mm and standard are so different, if people switch from
standard+snapshot to -mm, it might be hard to tell if a bug is because
of the different tree, of because of Reiserfs4.

But you are the chief of course :-)

With kind regards, Sander

-- 
Humilis IT Services and Solutions
http://www.humilis.net
