From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: "Permission denied" during ls
Date: Fri, 26 Mar 2004 18:54:42 +0300
Message-ID: <200403261854.42013.vitaly@namesys.com>
References: <200403261012.34806.phma@webjockey.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17502-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403261012.34806.phma@webjockey.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pierre Abbat <phma@webjockey.net>, reiserfs-list@namesys.com

On Friday 26 March 2004 18:12, Pierre Abbat wrote:
> A few months ago I set up a mail server for my ISP and put the maildirs on
> a separate disk formatted in reiserfs. I just got a call saying that he's
> getting "permission denied" errors doing "ls" on the directory:
>
> [root@mail mail]# vdir
> mupli@example.com: Permission denied
> eg@example.com: No such file or directory
> drwx------ postfix postfix muster@example.com
> drwx------ postfix postfix naprimer@example.com
>
> The box is running Linux 2.4.20 and AFAIK reiserfsck has never been run on
> that disk. What could cause this, and is it likely to need anything more
> than reiserfsck --check?

do you see anything related in the syslog?
what does reiserfsck --check say?

-- 
Thanks,
Vitaly Fertman
