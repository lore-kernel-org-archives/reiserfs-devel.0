From: David Masover <ninja@slaphack.com>
Subject: Re: reiser acceptance (was Re: Atomic filesystem or not)
Date: Wed, 21 Jul 2004 00:10:09 -0500
Message-ID: <40FDFAB1.9050300@slaphack.com>
References: <200407151434.23082.marcel@hilzinger.hu> <200407151354.47063.ctpm@ist.utl.pt> <40F6DE4A.2070103@slaphack.com> <40F6E06B.1080505@namesys.com> <40F73370.2090600@slaphack.com> <40FB876E.1050200@namesys.com> <40FC3730.80908@slaphack.com> <20040720065253.GW4990@nysv.org> <40FCCC4F.6040709@slaphack.com> <20040720080357.GX4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19713-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040720080357.GX4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Hans Reiser <reiser@namesys.com>, Claudio Martins <ctpm@ist.utl.pt>, reiserfs-list@namesys.com, Marcel Hilzinger <marcel@hilzinger.hu>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Markus T=F6rnqvist wrote:
| On Tue, Jul 20, 2004 at 02:39:59AM -0500, David Masover wrote:
|
|>Unless, that is, you've already made it so modular that people who call
|>sys_reiser on reiser4 won't find it broken on reiser5.  If you can do
|>that without cruft, you are amazing, and the number should go.
|
|
| But if the syscalls get extended, we have the same situation in
| sys_reiser4, right?

Wrong.  sys_reiser5 could require a totally different set of arguments
than sys_reiser4.  Suppose it's like this:

// It's been awhile since I've done serious C. I hope my syntax is sane.
sys_reiser4 (int, reiser4_struct)
sys_reiser5 (reiser5_struct)

You cannot just do a "s/reiser4/reiser5" on all your source files.  You
have to actually change your code to use the new interface everywhere.
If I didn't have the version number in there, whenever someone upgraded
to reiser5, your program would neither compile nor run until it was updated.

Yet sys_reiser4 could probably still be implemented -- as a separate
system call, or even as a library function which calls sys_reiser5,
passing its first argument inside the reiser5_struct somehow.

Once it becomes a standard, there will probably be one system call, with
one name, forever.  It would be as ubiquitous as open().  When that
happens, no versioning will be needed, and we will be shackled into
backwards compatibility.  And I do mean "shackled".  Feel the asbestos.

| So it has to be somehow forward-compatible, I think. But if it's all

That's better, of course.  Is it forwards compatible enough to call it
sys_reiser?  Anyone?

| in libaal or some equivalent, it's just enough to upgrade the library?

If only, if only.  But we discussed libraries, and it seems Hans wants
apps patched to use sys_reiser4 directly.  Right?

|>Possibly.  My point is Tesla was a genius who died poor and Edison was a
|>hard worker who won.  My guess is that Edison understood business and
|>people a bit better than Tesla, who understood electricity a bit better
|>than Edison.
|
| Yeah, but I'm pretty sure I don't mis-remember Edison using a few
| very dirty tricks to prove his superiority...

Imagine if Tesla had been able to play that game.  This is why democracy
currently sucks -- the honest people won't be able to play the game, so
of course there are mostly dishonest politicians!

Oops, offtopic :X

|>What about Gentoo?  (I just mentioned this in an email, probably sent
[...]
| Debian is basically flexible enough for me, and I abhor the notion
| of compiling more than what I have to.

Why, when it's automated, stable, and ultimately makes your box faster?

And I abhor the notion of having packages excluded because someone else
doesn't like the license.

But I wasn't trying to sell Gentoo as a distro to actually use, only one
to send patches to.

|
|>What one distro does, others are more likely to do.
|
|
| But still I think upstream penetration would be best.

If you can do it.  But this kind of administrivia is not a big deal.
Send it to everyone!  Put patch code on mousepads and teacups!
|
|
|>Not really.  Best thing?  A Gentoo SYNC mirror or a Debian source, or
|>the Fedora equivalent (if there is one).  That is, the next best thing
|>to a Gentoo USE flag.  A lot of work for us, but users who want the
|>latest reiser4 can get it, using a package manager, not patch and make.
|
| Sure, I could gladly maintain a Debian mirror with reiser4-patched
| packages for woody, sarge and sid, but I probably wouldn't have time
| to thoroughly test all these setups, which means someone may poison
| their stable Debian with these. So maybe just testing in sid
| would be enough for starters.

Just tell them that you are a (woody|sarge|sid)-based very unstable
reiser4-powered distro.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQP36sXgHNmZLgCUhAQJQAw/+JDN9Qqls9qNZgTxOoeOmbfdONYghPe8m
U7kTIZb4FfYL3NM7Fwq3Chx7Bh8Ch2uZjBzE0Qw1T+6PrSau8XUWIZdbBbKRd+wb
xzKk/CdaNkTXmRryLzfgpXGImBZkGJO/ueEYriT9pztNOMcdYi+sP68cPhizrCtP
Zgsar1lSBC88DhKbBMhC8ff54vMumQkUtVkdNwsWVtyAUGQnw8YkeC3UZEmqWz97
vbGumcmPiQRExqxf/kchvNZqlGJrRDpmz61L37jhNEaXkcLKTssRjNTERUp2/1IK
mq11s9Nw1FbZAL7RcasSfLYrvrhSe/e2Fm8lsUXmdCmMsDjUNoRe8QkkL68kC4DI
Q6fYwB7zykf5f8cc2A5ZigBmHtuCAy6qYqa3HHIajN8p1grtIRmZVSgSmXKFXcPN
ZchhcaduScTLoOMGI+1yHcNEroA/K1wUwcfYY6/3ReQ+ZVfFZuqkNo1aRS95Weta
xcqw/Xd8L1V0zHbQnTMZ8mBV4irvRu2vwvl1TqQ8i0nTTwWVyrYqONdrF/S3jIiM
hdRug+0JMly91yPZAsSxmzkto7PfYAF/d5ezIaSIKdl8cexBFIckmFja3iveGwRS
eLIJc/6w9ZQ82/fmWL6Mhe5BrUJ/aHVXrb3QCXiy8DPmuAIRA33KUKg29KlhIgT5
nf/b/9wDOgU=3D
=3D3goJ
-----END PGP SIGNATURE-----
