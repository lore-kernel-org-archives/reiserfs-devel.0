From: Chris Mason <mason@suse.com>
Subject: Re: Strange errors with 2.4.22 patches (from Chris) and bonnie++
Date: Mon, 01 Dec 2003 08:30:25 -0500
Message-ID: <1070285425.12810.2.camel@tiny.suse.com>
References: <bq8f7u$ufn$1@sea.gmane.org>  <3FC8F31A.7000501@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16185-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FC8F31A.7000501@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list@namesys.com

On Sat, 2003-11-29 at 14:27, Christian Mayrhuber wrote:
> Jens Benecke wrote:
> > Hi,
> > 
> > I applied the 2.4.22 patches from Chris Mason's SuSE FTP directory for data
> > logging etc:
> > 
> > available at 
> > http://mirrors.mathematik.uni-bielefeld.de/pub/linux/suse/people/mason
> > patches/data-logging/2.4.22/ or
> > mirror.mcs.anl.gov/suse-people/mason/patches/data-logging/2.4.22/
> > 
> > root         3109 Jul 11 21:10 02-akpm-b_journal_head-1.diff
> > root        17133 Jul 11 21:10 04-reiserfs-sync_fs-4.diff
> > root       155659 Jul 11 21:09 05-data-logging-39.diff
> > root          650 Jul 11 21:10 06-write_times.diff
> > root        41276 Jul 11 21:09 07-reiserfs-quota-28.diff
> > root         3275 Jul 11 21:15 08-kinoded-9.diff
> > root         2653 Jul 11 21:10 10-reiserfs-quota-link-fix.diff
> > root          898 Oct 10 12:25 README
> 
> Huh! What has happened to 06-reiserfs-jh-3.diff on the ftp server?
> I've the above patches + jh-3 running for months. Without any problems 
> on servers and on clients.

I've had to remove reiserfs-jh-3, it caused problems in the suse kernel
and a week or so of hunting wasn't able to track it down.  All my effort
right now is on fixing it in my 2.6 branch.

-chris


