From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: nfs with reiserfs and ufs on freebsd
Date: Wed, 18 Feb 2004 21:03:05 +0100
Message-ID: <4033C4F9.2070509@gmx.net>
References: <20040218193033.74513.qmail@web80012.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16839-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040218193033.74513.qmail@web80012.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cmc2slack-lvm@yahoo.com
Cc: reiserfs-list@namesys.com

cmc2slack-lvm@yahoo.com wrote:
> I'm using ReiserFS on Slackware 9.1 and would
> like to be able to nfs mount filesystems on
> my FreeBSD 4.8 system. From what I've read 
> ReiserFS doesn't do this now, is there a patch
> I can install to enable it or is it going to
> be available in a later version? Thanks,
> 

Your information must be wrong.
Reiserfs works very well with nfs since a long time ago.
I don't know the exact kernel version but the nfs bugs
were ironed out in the early 2.4.x kernel series.
I haven't tried the combination Linux -> FreeBSD, though.

-- 
lg, Chris

