From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: Basic interface for key management in reiser4 (DRAFT)
Date: Fri, 19 Aug 2005 03:16:09 -0400
Message-ID: <e692861c05081900162985adbc@mail.gmail.com>
References: <43034EC4.9040906@namesys.com> <43039594.3040300@namesys.com>
	 <4304D492.5010203@namesys.com> <43052842.6050505@namesys.com>
	 <e692861c05081821185566955d@mail.gmail.com>
	 <43056B7E.6030500@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25567-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43056B7E.6030500@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Edward Shishkin <edward@namesys.com>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Reiserfs List <reiserfs-list@namesys.com>, Nate Diller <ndiller@namesys.com>

On 8/19/05, Hans Reiser <reiser@namesys.com> wrote:
> I think it would make sense to put the keys as files in /proc:
> e.g.
> touch  /proc/1/keys/private/"0893410984328098094321"
> would give init (aka process with id of 1) a new key that its children
> would not inherit
> touch  /proc/1/keys/inheritable/"1893410984328098094321"
> would give init a new key that is children WOULD inherit.
>=20
> Not sure what the permissions on that keys directory would be, I guess 70=
0.

Eh, that would make leaks of key information easy..  Since most
applications don't assume that something visable in a file name could
be highly confidential information. :)

Better to have the file in proc be an abbriviated keyid (some kind of
smaller lossy hash of the key). To add you might echo "label:real key
data" > /proc/1/keys/private/keys, and a file would appear named
/proc/1/keys/private/label-123abcd which is a user defined label and
the hash.

Under no condition should a process be able to actually read the key
data.. they can get the ID.. delete keys based on IDs.. etc. But they
can't get the data.. otherwise a process could steal keys. If I take
away a processes key from proc, there should be no way for it to get
any further access to those files.. no chance that it could have
hidden away a copy of that key.

On 8/19/05, Hans Reiser <reiser@namesys.com> wrote:
> I think it would make sense to put the keys as files in /proc:
>=20
> e.g.
> touch  /proc/1/keys/private/"0893410984328098094321"
> would give init (aka process with id of 1) a new key that its children
> would not inherit
>=20
> touch  /proc/1/keys/inheritable/"1893410984328098094321"
> would give init a new key that is children WOULD inherit.
>=20
> Not sure what the permissions on that keys directory would be, I guess 70=
0.
>=20
> Hans
>=20
> Gregory Maxwell wrote:
>=20
> >On 8/18/05, Hans Reiser <reiser@namesys.com> wrote:
> >
> >
> >>but the idea is to use keys instead of standard unix permissions....
> >>
> >>I think you need to store keys in a per process place, and allow
> >>specifying whether children of a process inherit the keys somehow.
> >>
> >>
> >
> >Oh, slick!
> >
> >I did not previously catch what the advantage would be to using crypto
> >in the FS rather than just a crypted block device... minus some non
> >critical niceties (like being able to use a random & per file IV is
> >good from a security perspective.).
> >
> >Now I see what is possible, and I'm really excited.
> >
> >It will be interesting to see how a system with many keys performs..
> >most fast implementations of most crypto algs need a computationally
> >expensive key setup which produces a fairly large working set of
> >constants for encryption/decryption.
> >
> >With a per process structure there should be a way to revoke all
> >instances of a key from all the other running processes that carry
> >it.. or at least all processes of a specific user. Otherwise it will
> >be too easy to accidental leave keys laying around.
> >
> >This per process crypto in the FS fits very nicely with a lot of the
> >other recent security advances in the Linux world.
> >
> >Thanks for something new and exciting to talk about with my Linux
> >using friends! :)
> >
> >
> >
> >
>=20
>
