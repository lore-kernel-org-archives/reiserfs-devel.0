From: Toby Dickenson <tdickenson@geminidataloggers.com>
Subject: Re: mailing list daemon doesn't like my proposal, so here is a URL
Date: Thu, 15 Jan 2004 11:53:36 +0000
Message-ID: <200401151153.36892.tdickenson@geminidataloggers.com>
References: <400676E2.2090400@namesys.com> <200401151138.11001.tdickenson@geminidataloggers.com> <40067DBB.4090507@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16516-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40067DBB.4090507@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

On Thursday 15 January 2004 11:47, Hans Reiser wrote:
> Toby Dickenson wrote:
> >On Thursday 15 January 2004 11:17, Hans Reiser wrote:
> >>it seems we have some annoying filter settings that need changing....
> >>but for now
> >>
> >>www.namesys.com/blackbox_security.html
> >
> >It looks alot like systrace, which Im currently having alot of fun with.
>
> you mean you are doing the strace and chroot routine?  

No. systrace!=strace

http://www.citi.umich.edu/u/provos/systrace/
http://www.citi.umich.edu/u/provos/papers/systrace.pdf

> That's a lot of
> work, yes?  I think it can be made a lot easier....

It was. Ive replaced all my chroots over the last year with systrace because 
they were so much work to maintain.

-- 
Toby Dickenson

