From: Alexander Lyamin <flx@msu.ru>
Subject: Re:  Indicating filtered spam?
Date: Tue, 25 Feb 2003 15:44:43 +0300
Message-ID: <20030225154443.A7125@t-raenon.nmd.msu.ru>
References: <f6be6b0a0529$4b908c9d$dd22db58@aejhxx.j> <00ab01c2da74$0dda7f80$6400a8c0@twister> <20030222161410.A28885@namesys.com>
Reply-To: flx@msu.ru
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12908-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030222161410.A28885@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Szabolcs Szasz <sz@szasz.hu>, reiserfs-list@namesys.com

Sat, Feb 22, 2003 at 04:14:10PM +0300, Oleg Drokin wrote:
> Hello!
> 
> On Sat, Feb 22, 2003 at 02:12:29PM +0100, Szabolcs Szasz wrote:
> > Wouldn' it be better to put (back? was it there? I can't
> > recall) to the Subject header an indication for filtered
> > spam?
> > The fact that now there is Spamassasin at work, actually
> > changes the behavior of my organic brain-embedded spam filter
> > so that I now find myself opening mails I had been deleting
> > before.
> 
> Seems our filter that directs spam to /dev/null have broke again.
> I'll see what can be done with it.

its a bug in 822header util from DJB.
i clearly identified it, and now seems like i have to FIX it.
sometimes it fails to parse for X-Spam correctly :(



-- 
"Cache remedies via multi-variable logic shorts will leave you crying."(cl)
Lex Lyamin
