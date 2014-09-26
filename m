From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Non-deleted directories (Was Re: reiser4 (ccreg40)...)
Date: Sat, 27 Sep 2014 00:09:32 +0400
Message-ID: <3250460.uFvVlGa0Ho@intelfx-laptop>
References: <1466481.l6KPymqJEh@intelfx-laptop> <1681022.dqZonnvJOp@intelfx-laptop> <5425C519.1040905@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2845597.iobjWPoD70"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=CqQZZuMIYqs6Js2mZInFoo4a5LX7G4HlBA1BFDk1iyU=;
        b=BUKrMzfodEscMxYWLFrp8ZccH1xstTA6ZzlnbjUsJjD1GkVI0aYZKf+Hfcn72ZBs4e
         Go5yq1zMPXWjx7eBpVwR79wiCNlaIyDSnfs3sOwbTN+Q32OTo9yFYfC/vQW52UN25heG
         sQzJ4eq3oD01zQcSAii/paXs0PUeFmSJyJMm7+B5KCXhF05PbGBS6udH6ZoBPlG3D5B7
         9ReU0VNtd04KEM7bo7LkoDg6MD4a4eruuLo4DQGNW8K8yCyelecrnleDWae8oTL1D8AA
         XvBYV8lpozV5FSAee2KydpAD9hAYSg5A+gb0mniAVgCtJ+pyrUmZVHwKpz0/7faQbRCY
         F2MA==
In-Reply-To: <5425C519.1040905@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>


--nextPart2845597.iobjWPoD70
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Friday 26 September 2014 at 21:57:13, Edward Shishkin wrote:=09
>=20
> On 09/26/2014 07:27 PM, Ivan Shapovalov wrote:
> > On Wednesday 24 September 2014 at 21:51:53, Edward Shishkin wrote:=09=

> >> On 09/11/2014 07:16 PM, Edward Shishkin wrote:
> >>> On 09/10/2014 11:39 PM, Ivan Shapovalov wrote:
> >>>
> >> [...]
> >>
> >>>>>> 3a. I can reproduce the "directory not empty" bug :) Interesti=
ngly,
> >>>>>> it is
> >>>>>> always the same directory under the aforementioned huge hierar=
chy.
> >>>>>> (I've
> >>>>>> done the unpack-remove cycle a few times.)
> >>>>> I've made a conclusion that this is caused by unexpected disapp=
earing
> >>>>> of a record, which represents a directory entry in the director=
y item
> >>>>> (currently directory items are managed by cde ITEM plugin, aka
> >>>>> "compound
> >>>>> directory entries"). In the error path (ENOENT) the size of the=

> >>>>> directory is
> >>>>> not decremented, which makes the directory undeletable. I still=

> >>>>> don't know
> >>>>> who kills the entries. Special debugging info is needed to find=
/fix it.
> >>>> What kind of information is needed?
> >>>
> >>> We need to find all places, where the records are created / kille=
d
> >>> and insert a hook, which prints such events for the entry which
> >>> unexpectedly disappears. This will get us a chance to find the cu=
lprit.
> >>> I have to say: this is not a big fun...
> >>
> >> Ughhh, parse_cut (node40.c) is the culprit.
> >> If region to cut contains objects with non-unique keys (the case o=
f
> >> hash collisions), then this function evaluates the cut mode incorr=
ectly.
> >> non-unique keys
> > Wow.
> > (I wonder, how many else "what the..."-style things are there in re=
iser4?...)
>=20
>=20
> Currently I don't know open issues, which lead to data corruptions.
>=20
> There is a number of failed assertions when debug mode is on and
> partition is formatted with "create=3Dreg40". Specifically, they appe=
ar
> in paths of tail conversion. I believe they are false positives, howe=
ver,
> everything is possible..
>=20
>=20
> > So this becomes re-classified as kernel version agnostic bug, right=
? Then why
> > do you see it in 3.16 only?..
>=20
>=20
> Not really. The issue of non-deletable directories is very old.
> Now we know that it was caused by non-unique keys (because of
> hash collisions). However, having non-unique keys on the partition
> is not enough to reproduce this problem: the cut offset should be
> between objects with identical keys. Now let's assume that tree
> layout depends on the kernel version...
>=20
>=20
> >
> >> I think that this bug has been introduced implicitly ~11 years ago=

> >> after the design change in reiser4 (introducing non-unique keys).
> >>
> >> I'll provide the fixup later..
> > Great. Will be waiting for. /* also, what's with batch discard code=
 and the
> > second space allocation patchset? do you have any plans for reviewi=
ng it? */
>=20
>=20
> Discard support v8 looks OK, we'll include it to 3.6.X.

v8 is what? I don't see any PATCHv8 in the mailing list...
Actually, by "second space allocation patchset" I've meant this:
http://www.spinics.net/lists/reiserfs-devel/msg04180.html

BTW, it should be [RFC]: I'm completely unsure if it's OK...

> As to FITRIM ioctl: I'll try to review it at the end of my vacations
> (weekends 11, 12 Oct).

OK, will be waiting, thanks.
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart2845597.iobjWPoD70
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlQlyAEACgkQxUKljSIMAnDrOQD8CFni76Ms7UnnuQLBAWUPYsII
omNCE2Oe8Lyxhaib96oA/iwh4egMCjHR0c4DN4lTrxQyQi74+TnxMIlqKHMQRinf
=SBUA
-----END PGP SIGNATURE-----

--nextPart2845597.iobjWPoD70--

