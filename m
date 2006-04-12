From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: "warning("vs-44", "out of memory?");" --[Saveliev]--
Date: Wed, 12 Apr 2006 14:26:59 +0400
Message-ID: <200604121427.00106.zam@namesys.com>
References: <20060412074243.73274.qmail@mail.httpdnet.com> <200604121306.58199.zam@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28487-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200604121306.58199.zam@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Roy Lanek <lanek@novenine.com>

On Wednesday 12 April 2006 13:06, Alexander Zarochentsev wrote:
> Hello
>
> On Wednesday 12 April 2006 11:42, Roy Lanek wrote:
> > I have managed to save a copy of my
> > /var/log/socklog-klog/others/current
> > before the next complete freezing happened.
>
> Please use the latest reiser4 patch reiser4-for-2.6.16-2 from
> ftp.namesys.com.

and apply the following patch:

Index: linux-2.6.17-rc1-mm1/fs/reiser4/plugin/item/extent_file_ops.c
===================================================================
--- linux-2.6.17-rc1-mm1.orig/fs/reiser4/plugin/item/extent_file_ops.c
+++ linux-2.6.17-rc1-mm1/fs/reiser4/plugin/item/extent_file_ops.c
@@ -807,7 +807,7 @@ extent_balance_dirty_pages(struct inode 
 		if (excl)
 			get_exclusive_access(uf_info);
 		else
-			get_nonexclusive_access(uf_info, 0);
+			get_nonexclusive_access(uf_info, 1);
 	}
 	return 0;
 }
Index: linux-2.6.17-rc1-mm1/fs/reiser4/plugin/item/tail.c
===================================================================
--- linux-2.6.17-rc1-mm1.orig/fs/reiser4/plugin/item/tail.c
+++ linux-2.6.17-rc1-mm1/fs/reiser4/plugin/item/tail.c
@@ -510,7 +510,7 @@ tail_balance_dirty_pages(struct address_
 		if (excl)
 			get_exclusive_access(uf_info);
 		else
-			get_nonexclusive_access(uf_info, 0);
+			get_nonexclusive_access(uf_info, 1);
 	}
 	return 0;
 }


>
> > Here it is, included (just the part of the logs of
> > interest, i.e., from "--//--[ cut here ]--//--" on).
> >
> > I observe that polipo, a caching web proxy, is involved
> > (or mentioned, as a minimum) again ... like the last time.
> >
> > Cheers,
> >
> > /Roy Lanek
> >
> >
> > P.S. sorry for a previous mistake [email sending]
> >  --
> > ########################         bagai telur diujung tanduk
> > ##### . slackware ######       as an egg on the tip of a horn
> > ##### +-----linux ######  [very critical situation, as the egg will
> > ########################           soon tip-over and fall]

-- 
Alex.
