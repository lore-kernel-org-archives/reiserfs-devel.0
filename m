From: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Subject: Re: read-only drive with reiserfs partiton not mountable
Date: Sat, 05 Jul 2003 22:25:06 -0400
Message-ID: <pan.2003.07.05.22.25.04.781785.16446@umail.hungrycats.org>
References: <3F046341.8000408@ncsu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-14836-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thu, 03 Jul 2003 13:09:21 -0400, Joel Ebel wrote:
> Ok.  I've got an unusual problem.  My hard drive decided yesterday to
> turn read-only.  I can't write anything to it.  The data seems to be all
>   there and readable, but any write to the drive fails.  

Have you by any chance tried 'hdparm -r0 /dev/whatever'?  IDE disks have
a software read-only mode which may be turned on or off by hdparm or
similar commands.
