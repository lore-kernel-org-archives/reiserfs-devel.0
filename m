From: Chris Mason <mason@suse.com>
Subject: Re: quota support ?
Date: 20 Aug 2002 10:39:03 -0400
Message-ID: <1029854343.12471.468.camel@tiny>
References: <5.1.1.6.2.20020819155611.01ff7af0@pop.tvnet.hu>
	<20020819195906.A19984@namesys.com> <3D614477.8050500@namesys.com>
	<m3u1lpx4l0.fsf@merlin.emma.line.org> <3D6211FA.3010500@namesys.com>
	<20020820101309.GA26839@merlin.emma.line.org>
	<018401c2484b$3112fbf0$6501000a@kolodez>
	<20020820171539.A19402@namesys.com> 
	<01b201c24855$51b19dd0$6501000a@kolodez>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11255-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <01b201c24855$51b19dd0$6501000a@kolodez>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Serge Kolodeznyh <mysubscribes@paradigma.ru>
Cc: reiserfs-list@namesys.com

On Tue, 2002-08-20 at 10:24, Serge Kolodeznyh wrote:
> 
> Last patch doesn't apllied :-(
> 
> [root@helios linux-2.4.19]# gzip -cd kinoded-8-2.4.19-pre3.diff.gz |
> patch -p1
> patching file fs/inode.c
> Hunk #4 FAILED at 698.
> Hunk #5 succeeded at 1119 (offset -1 lines).
> Hunk #7 succeeded at 1278 (offset -1 lines).
> 1 out of 7 hunks FAILED -- saving rejects to file fs/inode.c.rej

I'll release an updated set of patches later this week.

-chris


