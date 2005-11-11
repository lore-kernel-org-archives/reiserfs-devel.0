From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: More from the Weekday Warriors
Date: Thu, 10 Nov 2005 21:37:41 -0500
Message-ID: <87hdajrjt6.fsf@evinrude.uhoreg.ca>
References: <200511092347.32743.pvh@uvic.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26856-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511092347.32743.pvh@uvic.ca> (Peter van Hardenberg's message
	of "Wed, 09 Nov 2005 23:47:32 -0800")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Wed, 09 Nov 2005 23:47:32 -0800, Peter van Hardenberg <pvh@uvic.ca> said:

[...]

> Hans, I like the idea that files should be (for those who want it)
> treatable indistinguishably from directories. The contained-by would
> get very tedious with deep nesting, as that is already how the /
> translates for me.

> I propose this:

> files /are/ a normal directory (for resources) and /have/ an invisible
> subdirectory (for attributes) (perhaps "fivedot"?).

I don't know how hard it would be, but I think it would be best to make
your code as generic as possible, so that it can be changed to make
subfiles accessible as robert/hat-size, robert/...../hat-size, etc.
(I'm not saying that it should be accessible by those names at the same
time, but it should be possible to, say, make a 10-line change in the
code to switch it from one to the other.)

Intuition is great, and I don't want to downplay it, but IMHO sometimes
it may be more revealing to actually try things out and see how it
works.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

