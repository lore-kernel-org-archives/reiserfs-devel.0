From: Oleg Drokin <green@namesys.com>
Subject: Re: About direntries pointing to nowhere on reiserfs problem in 2.4
Date: Tue, 25 Feb 2003 15:31:10 +0300
Message-ID: <20030225153110.A13078@namesys.com>
References: <20030220175309.A23616@namesys.com> <b3dluc$n39$1@satsuki.furryterror.org> <20030225100459.A23204@namesys.com> <3E5B5B24.2040002@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12906-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E5B5B24.2040002@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

Hello!

On Tue, Feb 25, 2003 at 03:01:40PM +0300, Hans Reiser wrote:

> >>I don't suppose it's a quick or easy task to modify reiserfsck to just fix
> >>_one_ missing directory entry, or to allow the kernel to unlink missing
> >>direntries instead of returning EPERM?  Would it suffice to simply hack
> >Well, that is in fact may be easy. (but that would not be a kernel you want 
> >to run
> >every day ;) ).
> >Also GNU rm checks file's mode prior to unlinking, I believe.
> >And that won;t get rid on lost file you might have, too.
> I am confused.  What concrete solution are you emailing him?

None. I am just speculating about adding possibility to remove "direntries
pointing to nowhere" into kernel. I may be even do more research on this
later, after I fix another directio bug (the one referenced by IBM guys).

Bye,
    Oleg
