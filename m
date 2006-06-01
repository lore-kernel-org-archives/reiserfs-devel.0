From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: fsck not working right on large partition?
Date: Thu, 01 Jun 2006 13:00:47 +0400
Message-ID: <1149152447.6348.31.camel@tribesman.namesys.com>
References: <54673.70.88.218.169.1149096645.squirrel@webmail.xanoptix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28714-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <54673.70.88.218.169.1149096645.squirrel@webmail.xanoptix.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ken D'Ambrosio <kend@cubicwafer.com>
Cc: reiserfs-list@namesys.com

Hello

On Wed, 2006-05-31 at 13:30 -0400, Ken D'Ambrosio wrote:
> I've got a system with several partitions, once of which is a 2.5 TB LVM
> array.  On boot, fsck runs through all the partitions, and they all report
> back "Filesystem is clean" -- except the big one; I then get dumped into
> single-user mode.  Running fsck manually turns up nothing, though it, too,
> never reports back that the filesystem is clean.  I've run a "strace" on
> fsck.reiserfs, and don't see anything particularly alarming.
> 
> Any ideas as to why it's not working?
> 

please provide exact reiserfsck output on that partition. Is it empty?

> Thanks,
> 
> -Ken D'Ambrosio
> 
> 

