From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: Re: Reiser4 Upstream Git Repositories on GitHub
Date: Thu, 29 Sep 2016 00:50:03 +0300
Message-ID: <1475099403.10051.5.camel@intelfx.name>
References: <57E6DF37.1050702@gmail.com>
                 <1474927548.10826.6.camel@intelfx.name> <57E9A32D.3000108@gmail.com>
                 <1474944195.1773.15.camel@intelfx.name>
                 <1921c810-5d7f-1de0-ec3d-48d123dba41f@gmail.com>
                 <1475001384.1609.2.camel@intelfx.name> <57EAE900.8060301@gmail.com>
                 <1475013062.1621.5.camel@intelfx.name>
                 <b2b6b412-6a80-37d3-0055-3fe84a195afd@gmail.com>
                 <1475058981.10051.1.camel@intelfx.name>
                 <5aba3b45-ccd5-35bb-96a9-335c78022f92@gmail.com>
                 <3d1f6d29-b3a8-1e14-d622-a3e158ec79d1@gmail.com>
         <1475074980.10051.3.camel@intelfx.name> <57EC20E7.8030906@gmail.com>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-kBQGQrqQSL7OmtKg71El"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:date:in-reply-to:references
         :mime-version;
        bh=aGKfcxETXsLYA3nBOomd6ivtLaO7Jc8ncR9Z6C6vXi0=;
        b=ThrfpW+rhdxfw5R2iPmyWYx9oa960P9JSTe1KWmjUN689N2Msrbrb1x5ajTHA1x+sD
         NYJ2kEXvL0ukqGjJ7JQUnsfKH7lVyxln7P0R4YqKjn7J+IYbYzMv8VqsTr0wVeot6ore
         DCD7z3ezBU/Dt0QhlsFvhQndaTWelZK65D09s=
In-Reply-To: <57EC20E7.8030906@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


--=-kBQGQrqQSL7OmtKg71El
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2016-09-28 at 21:58 +0200, Edward Shishkin wrote:
>=20
> On 09/28/2016 05:03 PM, Ivan Shapovalov wrote:
> > On 2016-09-28 at 16:44 +0200, Edward Shishkin wrote:
> > > On 09/28/2016 03:56 PM, Edward Shishkin wrote:
> > > >=20
> > > > On 09/28/2016 12:36 PM, Ivan Shapovalov wrote:
> > > > > On 2016-09-28 at 12:17 +0200, Edward Shishkin wrote:
> > > > > > On 09/27/2016 11:51 PM, Ivan Shapovalov wrote:
> > > > > > > On 2016-09-27 at 23:47 +0200, Edward Shishkin wrote:
> > > > > > > > On 09/27/2016 08:36 PM, Ivan Shapovalov wrote:
> > > > > > > > > On 2016-09-27 at 16:13 +0200, Edward Shishkin wrote:
> > > > > > > > > > On 09/27/2016 04:43 AM, Ivan Shapovalov wrote:
> > > > > > > > > > > On 2016-09-27 at 00:37 +0200, Edward Shishkin
> > > > > > > > > > > wrote:
> > > > > > > > > > > > On 09/27/2016 12:05 AM, Ivan Shapovalov wrote:
> > > > > > > > > > > > > On 2016-09-24 at 22:16 +0200, Edward Shishkin
> > > > > > > > > > > > > wrote:
> > > > > > > > > > > > > > Hello everyone,
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > I have set up the updated Namesys
> > > > > > > > > > > > > > repositories
> > > > > > > > > > > > > > at my
> > > > > > > > > > > > > > Github
> > > > > > > > > > > > > > page.
> > > > > > > > > > > > > > Those repositories are supposed to contain
> > > > > > > > > > > > > > the
> > > > > > > > > > > > > > latest
> > > > > > > > > > > > > > updates
> > > > > > > > > > > > > > in
> > > > > > > > > > > > > > the (stable) master branch and in other
> > > > > > > > > > > > > > (experimental)
> > > > > > > > > > > > > > branches
> > > > > > > > > > > > > > that
> > > > > > > > > > > > > > I'll announce.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > 1) https://github.com/edward6/reiser4
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > This is a "standalone" reiser4 tree, which
> > > > > > > > > > > > > > doesn't
> > > > > > > > > > > > > > include
> > > > > > > > > > > > > > specific
> > > > > > > > > > > > > > changes of Linux kernel needed for reiser4
> > > > > > > > > > > > > > port. Such
> > > > > > > > > > > > > > changes
> > > > > > > > > > > > > > can
> > > > > > > > > > > > > > be
> > > > > > > > > > > > > > found at the project's page on Sourceforge:
> > > > > > > > > > > > > > https://sourceforge.net/projects/reiser4/
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > An example of work with the standalone
> > > > > > > > > > > > > > reiser4
> > > > > > > > > > > > > > tree:
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > . Patch the respective kernel with the
> > > > > > > > > > > > > > latest
> > > > > > > > > > > > > > available
> > > > > > > > > > > > > > stuff
> > > > > > > > > > > > > > from
> > > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0Sourceforge;
> > > > > > > > > > > > > > . cd to the "fs" directory;
> > > > > > > > > > > > > > . delete the directory reiser4;
> > > > > > > > > > > > > > . instead of the deleted stuff clone the
> > > > > > > > > > > > > > standalone
> > > > > > > > > > > > > > reiser4
> > > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0repository from Github;
> > > > > > > > > > > > > > . build and install as usual.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > 2) Libaal and Reiser4progs:
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > https://github.com/edward6/libaal
> > > > > > > > > > > > > > https://github.com/edward6/reiser4progs
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Before building Libaal and Reiser4progs
> > > > > > > > > > > > > > execute
> > > > > > > > > > > > > > the
> > > > > > > > > > > > > > ./prepare
> > > > > > > > > > > > > > script,
> > > > > > > > > > > > > > which will create files needed for build
> > > > > > > > > > > > > > process.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Thanks,
> > > > > > > > > > > > > > Edward.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Wow, finally.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Maybe we could avoid that "all changes for 10
> > > > > > > > > > > > > years"
> > > > > > > > > > > > > commit?
> > > > > > > > > > > >=20
> > > > > > > > > > > > Hi Ivan,
> > > > > > > > > > > > Sorry, don't have a time to granulate it.
> > > > > > > > > > > >=20
> > > > > > > > > > > > > I tried to keep track of all patches since
> > > > > > > > > > > > > 3.2...
> > > > > > > > > > > >=20
> > > > > > > > > > > > There will be "all changes for 6 years" commit.
> > > > > > > > > > > > Is it much better?
> > > > > > > > > > >=20
> > > > > > > > > > > So well, I finished splitting off all known diffs
> > > > > > > > > > > from that
> > > > > > > > > > > big
> > > > > > > > > > > commit.
> > > > > > > > > > > Tt was 12k(+)/8k(-), now it is 7k(+)/7k(-).
> > > > > > > > > > >=20
> > > > > > > > > > > The updated branch is here: https://github.com/in
> > > > > > > > > > > telf
> > > > > > > > > > > x/reis
> > > > > > > > > > > er4
> > > > > > > > > > > (unfortunately, not fast-forward).
> > > > > > > > > > >=20
> > > > > > > > > > > Moreover, my tree has accumulated quite a few
> > > > > > > > > > > differences
> > > > > > > > > > > from
> > > > > > > > > > > your
> > > > > > > > > > > one. I've dropped trivial discrepancies
> > > > > > > > > > > (comments,
> > > > > > > > > > > formatting
> > > > > > > > > > > etc.)
> > > > > > > > > > > and put the larger ones in separate branches:
> > > > > > > > > > >=20
> > > > > > > > > > > 1. https://github.com/intelfx/reiser4/tree/differ
> > > > > > > > > > > ence
> > > > > > > > > > > s/enot
> > > > > > > > > > > ty
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(unsu=
pported ioctls return -ENOTTY, not
> > > > > > > > > > > -ENOSYS)
> > > > > > > > > > >=20
> > > > > > > > > > > 2. https://github.com/intelfx/reiser4/tree/differ
> > > > > > > > > > > ence
> > > > > > > > > > > s/migr
> > > > > > > > > > > atep
> > > > > > > > > > > age
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(the =
->migratepage() implementation,
> > > > > > > > > > > which I
> > > > > > > > > > > still do
> > > > > > > > > > > not
> > > > > > > > > > > completely
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0understand, but it works)
> > > > > > > > > > >=20
> > > > > > > > > > > 3. https://github.com/intelfx/reiser4/tree/differ
> > > > > > > > > > > ence
> > > > > > > > > > > s/rena
> > > > > > > > > > > meat
> > > > > > > > > > > 2
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(rena=
meat2(RENAME_NOREPLACE)
> > > > > > > > > > > implementation,
> > > > > > > > > > > which
> > > > > > > > > > > you
> > > > > > > > > > > haven't
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0merged somewhy)
> > > > > > > > > > >=20
> > > > > > > > > > > 4. https://github.com/intelfx/reiser4/tree/differ
> > > > > > > > > > > ence
> > > > > > > > > > > s/adju
> > > > > > > > > > > st-t
> > > > > > > > > > > o-3.
> > > > > > > > > > > 15
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(part=
 of porting to 3.15 which, again,
> > > > > > > > > > > you
> > > > > > > > > > > haven't
> > > > > > > > > > > merged
> > > > > > > > > > > somewhy)
> > > > > > > > > > >=20
> > > > > > > > > > > These branches are on top of that granular
> > > > > > > > > > > "master".
> > > > > > > > > > > Anyway, please take a look.
> > > > > > > > > >=20
> > > > > > > > > > It was definitely useful work,
> > > > > > > > > > I'll look at those differences..
> > > > > > > > >=20
> > > > > > > > > Maybe you could also consider rebasing things on top
> > > > > > > > > of
> > > > > > > > > that
> > > > > > > > > extracted
> > > > > > > > > granular history?
> > > > > > > > >=20
> > > > > > > >=20
> > > > > > > > Interesting idea, but I am not able to estimate
> > > > > > > > complexity of such rebasing for now.
> > > > > > > >=20
> > > > > > >=20
> > > > > > > While we do not have any forks and can afford non-fast-
> > > > > > > forward
> > > > > > > updates
> > > > > > > of master, the complexity is almost nil.
> > > > > > >=20
> > > > > > > To rebase your format41 branch, one can do this:
> > > > > > >=20
> > > > > > > git rebase --preserve-merges --onto
> > > > > > > 3c7b3c5802e20381496f641fe64b6c1573228c6e
> > > > > > > 8a896fd48ed35c7dfa0188f9b7f4cbdfd469cacb format41
> > > > > > >=20
> > > > > > > where 8a896fd is merge-base of format41 and master (that
> > > > > > > big
> > > > > > > commit),
> > > > > > > and 3c7b3c5 is the corresponding commit of the
> > > > > > > synthesized
> > > > > > > history.
> > > > > > >=20
> > > > > > > Both commits have identical file content (`git diff
> > > > > > > 8a896fd
> > > > > > > 3c7b3c5`
> > > > > > > yields empty output).
> > > > > >=20
> > > > > > OK, everything went smoothly,
> > > > > > Thanks for scrupulously archiving things!
> > > > > >=20
> > > > > > Edward.
> > > > >=20
> > > > > Great. (In fact, I intended this to be `git push -f`-ed, not
> > > > > `git
> > > > > merge`-ed with original history, but well, git blame now does
> > > > > the
> > > > > right
> > > > > thing, so it's good enough as it is.)
> > > > >=20
> > > > > We do not use github pull requests and still send formatted
> > > > > patch
> > > > > series to the ML, correct?
> > > > >=20
> > > >=20
> > > > Yup, everything to the list, as usual..
> > >=20
> > > BTW, your fstrim-scanner is the first candidate to scrub ;)
> > > Actually, I think about a common multi-functional scanner, with 3
> > > modes:
> > > 1) discard only (handle only free blocks);
> > > 2) scrub only (handle only busy blocks);
> > > 3) combined (scan the whole partition; for free blocks call
> > > discard,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for busy ones call scrub).
> > > Any ideas?
> > >=20
> > > Thanks,
> > > Edward.
> > > PS: We have an own ioctl number: 0xCD inherited from
> > > ReiserFS(v3).
> >=20
> > I still have to finish the erase unit detection (which has
> > completely
> > stalled) to merge all this work. Moreover:
> >=20
> > For the fstrim, we have dropped all locking and serialization
> > issues
> > and declared that fstrim is best-effort: if it misses some blocks
> > due
> > to concurrent transactions allocating and freeing blocks, it
> > doesn't
> > matter.
> >=20
> > For the scrub, this won't fly...
>=20
> Indeed, the requirements to fstrim and scrub are different,
> but, as I remember, the last decision was to not miss:
> http://marc.info/?l=3Dreiserfs-devel&m=3D141391883022745&w=3D2
> so everything will fly just perfectly..
>=20
> Edward.

This is different thing, it's about grabbing space in bigger chunks...
If a concurrent transaction allocates some space and frees some space,
we don't care, because it will then be discarded "online".

But in case of the scrub, how do we protect from the storage tree
changing right beneath us?

How is it solved in btrfs? Do they take a temporary snapshot?

--=20
Ivan Shapovalov / intelfx /
--=-kBQGQrqQSL7OmtKg71El
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJX7DsLAAoJEHveF8jk4w6dVWgQAJnHncWcyZOqFIRi62cp18rC
57ae2Ck2EkfY74Pj9BB1XdM3KQZlzIhBYJsHAegBi2Xvz+gkRF/DwN6u+4esIqRm
1FWW9NsYvYKp2QkNDM+DzklWW6IVSj1HkoalAl3W8/BFaMDRC4H+DOCIigL9fPmP
auBVuv15Fe4fIKLQPHIn9KvrJyILZF+woLN04RPx88EXlRsbJ8+mtfwfZqs/a53x
XxDGLaIRFVLukF8ejBfZYUCct9WJv8Uoe3jiLkN4ruAf+IV6Fr0eSS9acYgeH0dY
fsDMi6/Lo7H3LV7osPOS3z7w8hZ5rs9QsAHu9S859yduh6C6nBKch7r8ULzREESC
z8kCmFtRNCmKXtb+MxYH0oth2v4FA0H3dyNLLDopNq/wf4dlcoiaMLikbpg/Fzkc
7C0a2yMfXeW34JO1ZbD7qEOOLT64d16qH/hrP2lWMXQIiAumCQ/aqpZCndv2F57K
L9CiNlZNgDKYctgXlzgX6kPs/ohY7KIu/sOAo6Jc7ucvh2EaqsGpksCHj911T+Nb
OHJ2syaeBjfPdNlio8u7rbAosEvDJbzJ7sdwNt3vjFxg4OSmUjfEBr4ujfiToc45
gUFFQA4JAWndAYTkDxx02uzudRfUk2wyE81C/0UfVl0G0OqXSpnJKLpI7vzcJ3i2
epPgXwdomO6a+xAdXLb1
=ra/6
-----END PGP SIGNATURE-----

--=-kBQGQrqQSL7OmtKg71El--

