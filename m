From: David Masover <ninja@slaphack.com>
Subject: Re: Fwd: reiser4 non-free?
Date: Fri, 30 Apr 2004 17:53:21 -0500
Message-ID: <4092D8E1.3010607@slaphack.com>
References: <20040424193246.GA2490@raptus.homelinux.org> <4091DAFE.5030809@namesys.com> <20040430055619.GD7487@archimedes.ucr.edu> <40923D1C.3090003@namesys.com> <878ygdk10n.fsf@wasp.nowan.org> <409287BC.10405@slaphack.com> <87isfh73gb.fsf@uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18340-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87isfh73gb.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com, debian-legal@lists.debian.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

|>>>>>"David" == David Masover <ninja@slaphack.com> writes:
|
|
| [...]
|
| David> Basically, by having "free" and "non-free", you lump everything
| David> together into "free" as in absolutely, strictly, lilly-white,
| David> no-strings-attached freedom, while "non-free" covers everything
| David> from reiser (free, as above, with the restriction that there must
| David> be attribution) to microsoft (you pay a huge license fee and
| David> basically sign away your soul).
|
| Actually, things Microsoft would most likely not even get into
| non-free.  Things in non-free must still be freely distributable, which
| most Microsoft things are not.

Most of them.  I wonder if all of them technically require a Windows
license?

| So there is "free", "non-free", and "not-even-packaged-because-we-can't-
| distribute-it".

Still not a whole lot of options.

| Also, non-free is technically not a part of Debian -- it is only
| maintained as a convenience to users.  Putting something in non-free
| basically means, "we can't put this into Debian proper because it
| conflicts with our Social Contract, but we recognize that users may
| still want to use it."

So it'd be a convenience to users (or maybe users should add this
themselves?) to allow for more selective allowing or disallowing of
licenses.

I don't have much personal investment in this -- I use Gentoo, and it's
fairly likely that when I get some free time, I'm going to configure it
to deal with licenses better.  This is because Gentoo already has the
foundation laid for that (and a lot of things) but no actual interface.
~ Every ebuild has a line like this:

LICENSE="GPL"

And in /usr/portage/licenses is a copy of every single license.  So what
would be nice is a way for Portage to, when given a list of packages,
prompt the user to read and agree to licenses:

Do you accept license "GPL" for package "sys-devel/gcc"?
(yes/no/always/never/read):

That wouldn't be too hard to implement for Gentoo.  I'm not sure about
Debian.  Either way, it would involve little or no maintenance on the
part of the package maintainers -- in fact, you could say that Debian
only officially supports a particular list of licenses, but let the user
go ahead and read each one and decide to agree/disagree.  It'd create a
config file that can be copied from machine to machine.

This is getting fairly offtopic for reiserfs-list, and I am losing
interest.  At least, I find Debian to be too strict about stability and
licensing, and I would use reiser4 regardless of the distro.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQJLY33gHNmZLgCUhAQKJgA/+MRFYUTDw9Stk/yygWDTDUD9+hU3bwxLo
fLZVrCWuwTMUzpgsaechxeIdn1r5fUhUFPjg6VHs8TjZYYAMf1Aie8cvmmEy09ao
IFGR1gyrdLRlVXIkXRGou3478P94mIJCLeBqwIXrZzZep+uvRLk19A2/3nuzZEZl
LnpCSJfoAXsa6qlCZsIgpD/7KB0NHqdfcHvdKiAdniAIIGQtSdXGC36tpkOeLrIl
ogFCLG3vvu59tEW4hOdGc43cS7k2hP24e8bGl79YIXf6ZO6h9IOU6CnPPFQfH6LJ
uxjWElR7tpiDQ9LuROG9kWdm8TRsvKrg5W2G6Jk5CcUJntT4TOp59/3kFhlTpoFO
mNLC6r3COSU+G12opp4wcMjxKYqSPhnsFOVo8udPaiSWmxa9L9v8CVKPCshmb2r1
vQ/lF0Kgs3ie1N+T9vgqlq6R0yl3hxsr/rTGIric0NwDIJ97foLdc6yuYo5hlfR9
aMwxjuH2zL0hWk5hyphEr/QW43Fk7EIk8KaOzN07Q3Jo24yCK2dKkFrxsNGrjSRy
GoKAb/qEiM3r1dMjejZBoM13Het3yE2JzNBCo74cICdZ3lpoy9R4yvR+b0J4003G
l1ac9GavY2+J/5E0xqVkzESSNF7eZdMQEqY/BQk6kHhIGqpgYFd1xIkDdkoakr4X
LnYRL9WjQt8=
=lOX4
-----END PGP SIGNATURE-----
