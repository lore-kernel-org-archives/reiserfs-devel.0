From: "John D. Heintz" <jheintz@pobox.com>
Subject: Re: reiser acceptance (was Re: Atomic filesystem or not)
Date: Mon, 19 Jul 2004 17:07:21 -0500
Message-ID: <40FC4619.8070206@pobox.com>
References: <200407151434.23082.marcel@hilzinger.hu> 
	<200407151354.47063.ctpm@ist.utl.pt> <40F6DE4A.2070103@slaphack.com> 
	<40F6E06B.1080505@namesys.com> <40F73370.2090600@slaphack.com> 
	<40FB876E.1050200@namesys.com> <40FC3730.80908@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19689-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40FC3730.80908@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Hans Reiser <reiser@namesys.com>, Claudio Martins <ctpm@ist.utl.pt>, reiserfs-list@namesys.com, Marcel Hilzinger <marcel@hilzinger.hu>

I don't have a problem with a sys_reiser4 system call because this is 
still clearly innovation. Once the system is out there, used, tweaked, 
and refined it will be time to begin standardizing efforts on something 
that should be shared. That could very well be a libfsatom.

Unless there is already a well known file-like atomic operation API out 
there that matches the future semantics and performance targets of 
ReiserFS it's too early to even try for a standard for all linux 
filesystems. Innovate then standardize.

John Heintz


David Masover wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> 
> 
> 
> Hans Reiser wrote:
> [...]
> | David, none of the other linux filesystem development teams have any
> | interest in implementing innovative semantics.  If they support
> [...]
> | but I don't know who and hopefully MS does not know either;-).)  Look at
> | the  hassle they gave me over xattrs, which they want to do because
> 
> Do you know why they bothered you about xattrs?  xattrs already exists,
> is already used, and already works.  Not supporting it means that any
> apps which use it will have to be rewritten.  I'm all for rewriting apps
> to support reiser4, but I doubt the community feels the same way.
> 
> 
> | They are a wet noodle, and it is better to drag them by setting an
> | example their users tell them to imitate than to try to push them by
> | getting them to do what I say is the right API before the users are
> | using it.
> 
> I hope that it works -- I hope users notice reiser4 and pester everyone
> to support it.  I doubt it will, unless the developers feel comfortable
> supporting it.  As a developer, I wouldn't feel comfortable with what
> could turn into this:
> 
> switch (fs_type) {
>     case REISER4:        sys_reiser4(...)
>     case EXT3:        sys_ext3_atom(...)
>     case I_OWN_REISER:    sys_something_different(...)
> }
> 
> You are fooling yourself if you think we won't need that -- that reiser4
> is the only fs that will ever properly support transactions, or that
> every other fs will support the full sys_reiser4.  And I think it's
> seriously poor design to require such a switch statement in every app,
> and have to modify it to support every new and innovative fs that comes
> along.
> 
> Now, suppose there was a standard library, which contained such a switch
> statement -- so that this library has support for reiser4, some random
> other FS types, and even fakes it on filesystems like ntfs and fat32.
> 
> Or, look at how others have done it.  GNOME did not build in support for
> Linux's dnotify, they used FAM -- the File Alteration Monitor -- which
> could support Linux's dnotify, but could also support various other
> systems, including actual polling of files.  They only had to patch it
> once to support FAM, and technically, they could have removed all
> support for polling from GNOME and made FAM a requirement.
> 
> Based on that, I think GNOME would be much more likely to support
> "libfsatom" than "sys_reiser4".
> 
> | We have created a great storage layer, and if they were reasonable they
> | would start building on top of it because it is the fastest storage
> 
> What about JFS + hardware elevator sorting?  Or, more relevantly, can
> you afford to be so arrogant when you're trying to sell something?
> Being right isn't enough -- being right makes you Tesla, not Edison.
> 
> | We need to get some funding for pushing sys_reiser4() semantics out to
> | the most commonly used apps by writing patches for them.  That would be
> | nice....
> 
> Do you intend to have a reiser4 patch repository, so that end-users have
> to go and download a patch for each app?  Or are you actually looking
> for inclusion in things like Debian?  If the latter, then you really
> ought to do this my way -- make it look like you are creating a portable
> standard.  Make it so that each app only needs one patch to support any
> filesystem transactions, ever.
> 
> And even if you do reach your goal of being required by every major
> Linux distribution, what's the harm?
> 
> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.4 (GNU/Linux)
> Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org
> 
> iQIVAwUBQPw3MHgHNmZLgCUhAQKthA//bjg0XcODmmZqt8ExN+Br6wxWin/G/S6k
> /KaUrvBoxTIk08fCdVFsqbdmhWuNYY8OiUS/ctWEOtbUCOfOLlAgj2zD7UPry2/n
> rnIFPl+sum1kOuYVzNzht7LbgWTFT188lqqiI9HizMP9BERKLPe9jQdNarOYi6kI
> A3rSY4mXdwv6K3oVwjuBF2F7BvPCtTkCAn3wne+sNaT7RsZpBQyKUGhfHEa5dVVW
> 3gpApF14d0eC+6yl3UhYLU4GbQozzO92zAiq24oThtcxaI2i12WAnKTKjBft4TxE
> k6Xs4SvdTzEJh1qXUO/IMqMrJg/hEiuc3bvEYbetoXy/W9Dw36MlPq0mqHl3u7y3
> kfXPycFevtcVEPrKtGD/33DHlm5Q89aM8ApStF4tNE8LEUcC0+EInJ0gKCeKpgO4
> oRu1gEE0ZgFd9v+12oivoTyNIN34IvOXCzMWy3as+dMk/W3P97UVvarIisAqZQeX
> mkZPiffJGSU7Qdb5+DS5vVIxBoa8WtW1Uk5yAxDOaNfFd0N7tnw4tMhtm2SCD4oh
> EltDMEpIhS/61wh7tGBZ+lR5w/HPPwfzLb/cGjDvFHxlhBYU9j/8VjGxKI9H43/E
> MRfSteXcflZBlbwRbyaWlNfwShdlo0nzGY+UyeWYdTv5HqfFSQORn2vNuWmehazX
> f0kPk4KN5rg=
> =N2y2
> -----END PGP SIGNATURE-----
> 
> 

