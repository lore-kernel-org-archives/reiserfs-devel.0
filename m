From: Jan Kara <jack@ucw.cz>
Subject: Re: is quota functional in 2.6.12.3 ?
Date: Tue, 23 Aug 2005 13:53:43 +0200
Message-ID: <20050823115343.GC31783@atrey.karlin.mff.cuni.cz>
References: <200508182055.38674.cbaegert@europeanservers.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25616-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200508182055.38674.cbaegert@europeanservers.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cbaegert@europeanservers.net
Cc: reiserfs-list@namesys.com

  Hello,

> I tried to use quota with ReiserFS and a stock kernel 2.6.12.3.
> 
> Everything seems to work fine, except that it doesn't work : the user can use 
> as much space he wants ! However the repquota seems OK.
> 
> Any idea ?
  You probably forgot to turn quotas on using quotaon(8) command.

> [root@gibraltar linux-2.6.12.3]# repquota /home
> *** Report for user quotas on device /dev/sda7
> Block grace time: 00:00; Inode grace time: 7days
>                         Block limits                File limits
> User            used    soft    hard  grace    used  soft  hard  grace
> ----------------------------------------------------------------------
> root      --  127242       0       0           4155     0     0
> chris     +-   83201   10240   20480   none     320     0     0


										Honza
