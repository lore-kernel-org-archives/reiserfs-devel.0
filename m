From: Damien Wyart <damien.wyart@free.fr>
Subject: Re: Error messages while moving files to reiser4 fs
Date: Fri, 22 Apr 2005 14:36:47 +0200
Message-ID: <874qdz3s4g.fsf@brouette.noos.fr>
References: <20050422064825.GA1528@localhost.localdomain>
	<1114159400.3975.412.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23917-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1114159400.3975.412.camel@tribesman.namesys.com> (Vladimir
	Saveliev's message of "Fri, 22 Apr 2005 12:43:20 +0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

> > While moving some iso images from a jfs partition to a reiser4 one
> > (very recently created with latest reiser4progs), I got a bunch of
> > errors looking like these : [...]

> > I do not know at all what they mean... I stupidly reformatted the
> > partition without doing a fsck :( so I can't provide much more
> > information, I'm afraid.

* Vladimir Saveliev <vs@namesys.com> [050422 10:43]:
> Can you reproduce this problem?

Unfortunately, no. Tried to copy the same isos again (after reformating
the reiser4 partition), and got no problem. Retried several times, and
also from and to the xfs and ext3 partitions, no problem at all.

> did you do: cp /tmp_jfs/* /tmp_reiser4/?

No, my iso images were in a subdirectory of /tmp_jfs so I did cp
/tmp_jfs/isos/* /tmp_reiser4 (which was completely empty at start, btw).
 
-- 
Damien Wyart
