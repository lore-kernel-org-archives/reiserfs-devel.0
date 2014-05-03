From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: discard support
Date: Sun, 04 May 2014 00:32:29 +0400
Message-ID: <2562062.LWrRe7vaEB@intelfx-laptop>
References: <1496741.djsd6PJ1Ae@intelfx-laptop> <1461643.AZxFf0Q2dH@intelfx-laptop> <53654FE6.7030408@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1923474.3vQVlIQ2BD"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=4GkqXS4yHs6UzAYtdP/EdfZCjYRiGsH6VPxPVtPBI2Q=;
        b=CH0DQusn1UQvF5wAIEujNbvOWCHYSkMgNvhdx8JyBWQYI51ETVF/YMcqc7k1+D+2IS
         t0O8RzzLdCSBbxU2e1pudMDL7VVk8zh/o614mDztosr/BmA/UTXwkuHwTqc2hpOhiHs/
         hBXDnhjLtlLVbWjHPxq+jqfpn35QCuPRF+zYq3VvKd3T1cLMcN1HuG55byAdbIWgCyfh
         +jeuSfUqkntY9VJSzh8St5fMUj+uxjElCWwEQ03gwvFCiOvHrGW5nCwVSZ9D+gpdVGYO
         7/qezHXUWD9hWTtWZATGs8ZfyGyuJtW0mb+wZmjSwGLsa969qYNzOmpcPmc/jhbhCSUf
         REvg==
In-Reply-To: <53654FE6.7030408@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart1923474.3vQVlIQ2BD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Saturday 03 May 2014 at 22:21:58, Edward Shishkin wrote:=09
> On 05/03/2014 08:48 PM, Ivan Shapovalov wrote:
> > On Friday 02 May 2014 at 20:10:16, Edward Shishkin wrote:
> >> On 05/02/2014 04:32 PM, Ivan Shapovalov wrote:
> >>> On Friday 02 May 2014 at 16:07:21, Edward Shishkin wrote:
> >>>> On 05/02/2014 03:36 PM, Ivan Shapovalov wrote:
> >>>>> On Friday 02 May 2014 at 13:48:28, Edward Shishkin wrote:
> >>>>> [...]
> >>>>=20
> >>>> We can perfectly populate different "discard trees" in parallel =
on
> >>>> different CPUs.
> >>>> As to sorting the list: I don't know how to perform it in parall=
el :)
> >>>> Default assumptions, that everything is serialized, usually lead=
 to
> >>>> various
> >>>> bad-scalable solutions...
> >>>=20
> >>> Ah, now I understand what do you mean. If that's about doing less=
 work
> >>> under the tmgr mutex,
> >>=20
> >> No. This is about minimizing real time.
> >> We don't know about mutexes. We want to decide, what is preferable=
:
> >> populating trees, or sorting the list. There is a chance that the =
first
> >> will be faster in systems with many CPUs, so I suggest to use tree=
s.
> >> That's all!
> >=20
> > OK.. well, I've started with lists anyway. The data structure is (o=
f
> > course) under an abstraction layer, so we can change it.
> >=20
> >>>    then yes, trees are better than lists.
> >>>=20
> >>> BTW, I've seen that reiser4 releases atom lock before allocating =
another
> >>> node for a blocknr_set, and that leads to a "do { } while (ret =3D=
=3D
> >>> -E_REPEAT)" loop around the blocknr_set_add_extent() calls. Is th=
is the
> >>> preferred way of attaching a dynamic data structure to an atom?
> >>=20
> >> TBH, I have never looked at the deallocation paths in reiser4: eve=
rything
> >> worked fine there.. BTW, why not to use atom's delete_set to disca=
rd
> >> things? Could you please take a look?
> >=20
> > Blocks used for the journal (wander.c) are deallocated without BA_D=
EFER
> > set
> > and thus they never hit delete_set. However, we want to discard the=
se.
>=20
> This happens in error paths. Don't be so scrupulous ;)

I don't think so:
=2D wander.c:485
  dealloc_tx_list() <- reiser4_write_logs()
=2D wander.c:505
  dealloc_wmap_actor() <- dealloc_wmap() <- reiser4_write_logs()

> Also users will use copy-on-write transaction model for their SSDs(*)=
,
> and in this mode journals are tiny: they contain only system blocks.
> In short, there is nothing to discard..
>=20
> (*) http://marc.info/?l=3Dreiserfs-devel&m=3D139449965000686&w=3D2
>=20
> >>>>> [...]
> >>>>=20
> >>>> what explanation do you mean?
> >>>>=20
> >>>> Edward.
> >>>=20
> >>> A general explanation of how does it work :)
> >>=20
> >> I think this is because of historical reasons.
> >> Such good explanation costs a lot of time and efforts.
> >> Namesys was a small company, we couldn't afford to have a technica=
l
> >> writer.
> >> Hans insisted on good comments in the source code..
> >=20
> > But there aren't much comments there. ;)
> >=20
> > I'm now coding the last part - bitmap querying - and I've got a que=
stion:
> > how do we pass reiser4_block_nr parameters?
> > Many places use pointers, but I do not really understand why (to op=
timize
> > for stack frame size on 32-bit archs?)
>=20
> I think, yes: 12 years ago 64-bit archs looked like exotic..
>=20
> >   and there is a place
> >=20
> > (reiser4_dealloc_blocks_bitmap()) where this convention is apparent=
ly
> > broken.
> I suspect that even the author of the bitmap code doesn't know, why i=
t
> is broken ;)
>=20
> Edward.
>=20
> > And this is tedious, because public interfaces seem to pass start+l=
en, but
> > in some places it's more convenient to use start+end...

Ok, so I'll follow the convention.

And oh, blocks !=3D sectors... It looks like I really need to make a ba=
ckup of:
=2D the last good reiser4.ko
=2D my /home

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart1923474.3vQVlIQ2BD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EABEIAAYFAlNlUmIACgkQxUKljSIMAnBkygD+K8kzVhfEyf7YXPDufAIV2V2D
q7GICtp97WFMD13jlpwA/0tWTowq2OoSl7bXJeqlc4a6/Rs76fafHlt1ot5m+s+V
=VEzj
-----END PGP SIGNATURE-----

--nextPart1923474.3vQVlIQ2BD--

