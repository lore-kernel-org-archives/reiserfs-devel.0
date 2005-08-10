From: michael chang <thenewme91@gmail.com>
Subject: Re: Distributions with out-of-the-box Reiser4 support?
Date: Wed, 10 Aug 2005 13:12:35 -0400
Message-ID: <b14e81f005081010125d5a6fa4@mail.gmail.com>
References: <194f6255050810094849b3164e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25392-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <194f6255050810094849b3164e@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Cc: reiserfs-list@namesys.com

On 8/10/05, Clemens Eisserer <linuxhippy@gmail.com> wrote:
> I hope this questions hasn't been asked too often (since it seems to
> be a perfect example for this), but I'm not too long on this list and
> for what I've seen it hasn't ... so please don't kill me ;-)

Nonsense... I haven't seen it yet... but I think it's _supposed_ to be
on the site somewhere.

> Does anybody know a number of distrbibutions which support reiser4 out
> of the box (installer, grub, reiserfs4-utils, ...)?
> Is opensuse planned to include reiser4?

Not sure; although IIRC, many distros plan to support it in the
_future_.  Apparently, that's why Hans is trying to hard to get it
into the vanilla kernel -- so distros can support it.  There should be
a Gentoo Live CD that supports it...

I believe at the moment Reiser4 root partitions are unsupported, so
you are advised to use another filesystem for storing other files,
especially /boot.  [Some versions of GRUB support Reiser4, but there
have been issues; others don't; there's supposed to be a patch for
GRUB in order to support Reiser4, etc. etc.]

Does Lindows support Reiser4 roots?

> For now I am using Fedora but since a long time I feel uncomfortable
> with their use-what-we-tell-you policy, they tell me to use ext3 or
> gnome for example and if I want to make a different choice a get
> anything but not a perfect installation.

Consider using ReiserFS 3.6 in the meantime; and use either Debian or
Ubantu [or stick with FC, if you need to].  Former gives you more
control; I haven't used the latter but I hear it's rather popular.
Gentoo has also been suggested -- but I don't know how it works or
anything.  I believe the consensus for most users is "while it's
there, root/boot support isn't in yet, and there could be unsolved
bugs, so use it to debug, or wait" or something.  Iunno.  *shrugs*

Hans, or anyone from Namesys, might know better.

--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
