From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Tue, 18 Feb 2003 23:05:08 +0300
Message-ID: <200302182305.08021.vitaly@namesys.com>
References: <3E4AA902.86F15815@interface-ag.com> <200302151600.35675.vitaly@namesys.com> <3E528EA1.60604@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12827-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E528EA1.60604@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Andreas Dilger <adilger@clusterfs.com>, Oleg Drokin <green@namesys.com>, Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

> >If fix-fixable finds fatal corruptions it sets FS_FATAL what means that
> > the second run of fix-fixable will not help to avoid another fsck run at
> > the next boot.
>
> Can you repeat what you said (more clearly).

If fs was not fixed, you do not want to have another run of fsck at 
the next boot. you already know that there are fatal corruptions and
you need to run rebuild-tree manually. So a special flag saying that 
would be helpful.

-- 

Thanks,
Vitaly Fertman
