From: Paolo Correnti <paolunix@yahoo.com>
Subject: Re: REISER4 "strange" partition size
Date: Fri, 23 Jan 2004 07:12:14 -0800 (PST)
Message-ID: <20040123151214.56545.qmail@web21503.mail.yahoo.com>
References: <16401.13637.883146.415372@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16618-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16401.13637.883146.415372@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: REISER LIST <reiserfs-list@namesys.com>


--- Nikita Danilov <Nikita@Namesys.COM> wrote:

>  > 
>  > Then making intensive writing test on this
> reiser4
>  > partition (for example: writing 1 million rows on
> an
>  > Oracle table in archivelog mode) on each test I
> obtain
>  > a corrupted redolog file [sometimes is
> recoverable,
>  > sometimes I've to rebuild the entire DB).
>  > 
> 
> Hmm...
> 
> It is not clear how to diagnose this. What oracle
> are you using? Is it
> available freely?
> 

I'm using Oracle 9.2 on Linux (Slackware 9.1)

> Also you can compile reiser4 with
> CONFIG_REISER4_CHECK and
> CONFIG_REISER4_DEBUG on, but it will run _much_
> _more_ _slowly_.
> 

OK, I'll try, also if like I've already wrote 
I've never had this kind of problem with kernel
2.6.0 and last 2003 snapshot

Best regards
 
Paolo



__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free web site building tool. Try it!
http://webhosting.yahoo.com/ps/sb/
