From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Sun, 28 Mar 2004 22:22:39 -0500 (EST)
Message-ID: <20040329032239.35950.qmail@web25005.mail.ukl.yahoo.com>
References: <200403281957.57226.filipe@rnl.ist.utl.pt>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17549-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403281957.57226.filipe@rnl.ist.utl.pt>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Filipe Almeida <filipe@rnl.ist.utl.pt>, reiserfs-list@namesys.com
Cc: Hans Reiser <reiser@namesys.com>, Piotr Neuman <sikkh@wp.pl>

Filipe Almeida wrote:

> On Sunday 28 March 2004 17:40, Hans Reiser wrote:
> > Piotr Neuman wrote:
> > >The new naming scheme for plugins ("metas" in
> snapshot 2004.03.26) may on
> > >certain occasions cause name clashes. This patch
> changes "metas" into
> > >"..metas" which should avoid this problem in most
> cases.
> >
> > The name clashing is less important than the
> greater user friendliness.
> > Users on the mailing list convinced me of this.
> 
> Isn't this is introducing the kind of side effects
> that existed in windows 
> machines with the "con" and "aux" special filenames?
> IMHO, it doesn't seem wise to introduce a special
> filename called metas into 
> unix.

I agree 100% (at least!).  As a user, I strongly
dislike  systems that impose unnecessary rules on me
(eg. don't allow me to name my file "metas", or
"..<whatever>").  There is no question that ReiserFS
is brilliant; it provides a unified, clean,
user-friendly namespace.  This is why sullying that
namespace with special exceptions is, in my opinion,
"clutching defeat from the jaws of victory".

Again, I point to my original idea of corralling _all_
"meta" files (MIME type, etc.) into a more
specially-named, non-localized directory ("+" or
somesuch).  Inside that directory, they can be named
anything, without dot prefixes or whatever.  There is
a thread here somewhere about this... it contains the
full rationale.

As far as user friendliness goes: the less rules the
user has to remember, the better.  Thus, the more
"special directories" there are, the less user
friendly the namespace is.  My recommendation to have
only one special directory, given an easy-to-remember
name, is the most user friendly option.

I will be happy to implement my special directory
idea, but I haven't had the time to do the requisite
background work yet (sorry...).

> About the user user friendliness issue, would novice
> users be messing with the 
> metadata exposed by reiser4 pseudo files? I think
> this will be a feature for 
> software and advanced users.

The namespace is sullied for all users, regardless of
whether they go inside the "metas" directory.


______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca
