From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: fsck.reiserfs on a frotzed partition image.
Date: Wed, 11 Aug 2004 20:31:55 +0200
Message-ID: <200408112031.55088.christian.mayrhuber@gmx.net>
References: <200408111820.i7BIK417013810@all-night-tool.mit.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20209-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408111820.i7BIK417013810@all-night-tool.mit.edu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wednesday 11 August 2004 20:20, Omri Schwarz wrote:
> Hi, everyone,
>
> I have an image of a reiserfs partition from a bad drive. The beginning
> 1GB of the partition are where data corruption occurred, which makes my
> chances of recovering data to be less than good. Nevertheless, it is worth
> a shot.
> I have the image living somewhere safe, and can rewrite it to a drive and
> re-fsck it as many times as it takes, with whatever options might be
> worth a try, in whatever combination. So far, a plain fsck --rebuild-tree
> fills up lost+found with files whose contents are mixed together. I've
> only found 5 files that were complete. But, when I do it I get a filesystem
> that is 50% in use (out of 47GB).
>
> I'm willing to try a shotgun approach, because there are some manuscripts
> and source code versions in there that I would like to rescue. So if there
> are more incantations I should try, please let me know. I'll try'em all.
>
> Thanks in advance,
>
> Omri Schwarz

Sounds bad.
Maybe the experts can help you recover some more files:
http://www.namesys.com/support.html

-- 
lg, Chris
