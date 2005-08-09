From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: reiser4 performance
Date: Mon, 8 Aug 2005 20:58:45 -0400
Message-ID: <e692861c050808175818078a30@mail.gmail.com>
References: <dd7cbn$kbg$1@sea.gmane.org> <42F7A01A.7090209@namesys.com>
	 <e692861c05080816136f9d70bc@mail.gmail.com>
	 <42F7F6DC.2080706@slaphack.com>
Reply-To: Gregory Maxwell <gmaxwell@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25367-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42F7F6DC.2080706@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>, ReiserFS List <reiserfs-list@namesys.com>

On 8/8/05, David Masover <ninja@slaphack.com> wrote:
> Gregory Maxwell wrote:
> > On 8/8/05, Hans Reiser <reiser@namesys.com> wrote:
>=20
> > If ever you are looking for a killer app for Reiser4 that people who
> > don't care about the visionary stuff will care about:
>=20
> Define "visionary"?
>=20
> I can name a few things that work best in Reiser4, and very well in v3,
> simply because of efficient storage of small files and lazy allocation:
>=20
> webserver -- lots of small files, very few large ones, mostly reads

Given webserver horsepower from the same budget class as the Internet
pipe it is attached to, it is utterly trivial to saturate the pipe
with static content.. even if the files are small, larger than core in
total, and have poor locality.   (and those are very infrequently the
case).

So for most webserver cases, FS speed doesn't matter. For the few
cases where it does, locality is usually fairly good... so who cares
if the new FS is 2x faster, when it is still 200x slower than ram. Add
ram.

> mailserver -- especially IMAP+maildir, lots of small files, read/write
> and so on...

An interesting application space, no doubt. Although you can cure a
lot of sins tossing solid state disk at it. :) (or just battery backed
cache on a hardware raid controller).

> Gentoo box:
>         /usr/portage is over a hundred thousand very small files, updated=
 via
> rsync.  Since they are updated all at once, you get a boost out of lazy
[snip]

Rsync algo or the network is going to be your bottleneck there, for
the sync... Are you really getting disk bound for compile? if so
increase your -j N.


> These are all things that Reiser4 already does better than anything
> else.  So now we're going to get Postgres to run faster.  I can't wait
> until we have more people hacking on the plugin interface -- then we'll
> have some *real* killer apps.

I agree. Still it would be nice to have some really good bread and
butter improvements.. and a sufficient level of 'transaction' support
exposed to PostgreSQL could result in a huge performance improvement
while improving reliability. "Your database is more reliable on
reiser4" would be a compelling argument... even to those not convinced
by plugins and small files.
