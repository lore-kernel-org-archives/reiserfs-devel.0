From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] reiserfs: fix broken xattr handling (heap corruption, bad
 retval)
Date: Mon, 13 Aug 2018 14:39:14 -0400
Message-ID: <482907a9-5db1-37fe-e3e5-d85ea3cbd089@suse.com>
References: <20180802151539.5373-1-jannh@google.com>
 <CAG48ez0GhqL=z+UuxgGeEVcR6HBcsTHg2EmcZHLZMmedhH3fXw@mail.gmail.com>
 <20180813174237.GB25548@arm.com>
 <CAG48ez0XHPVY7=xcgBUcsy19jUZM1jd1uc64r6sk7HB=jU_m5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KPemxRUFTIQn3YccjaWgfrv7O8b4v0QgW"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAG48ez0XHPVY7=xcgBUcsy19jUZM1jd1uc64r6sk7HB=jU_m5w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Jann Horn <jannh@google.com>, Will Deacon <will.deacon@arm.com>
Cc: reiserfs-devel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, security@kernel.org, Al Viro <viro@zeniv.linux.org.uk>, kernel list <linux-kernel@vger.kernel.org>, Eric Biggers <ebiggers@google.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KPemxRUFTIQn3YccjaWgfrv7O8b4v0QgW
Content-Type: multipart/mixed; boundary="teD9ZOF6pGpwWHKmVxSgKONNapKy88bSd";
 protected-headers="v1"
From: Jeff Mahoney <jeffm@suse.com>
To: Jann Horn <jannh@google.com>, Will Deacon <will.deacon@arm.com>
Cc: reiserfs-devel@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, security@kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, kernel list
 <linux-kernel@vger.kernel.org>, Eric Biggers <ebiggers@google.com>
Message-ID: <482907a9-5db1-37fe-e3e5-d85ea3cbd089@suse.com>
Subject: Re: [PATCH] reiserfs: fix broken xattr handling (heap corruption, bad
 retval)
References: <20180802151539.5373-1-jannh@google.com>
 <CAG48ez0GhqL=z+UuxgGeEVcR6HBcsTHg2EmcZHLZMmedhH3fXw@mail.gmail.com>
 <20180813174237.GB25548@arm.com>
 <CAG48ez0XHPVY7=xcgBUcsy19jUZM1jd1uc64r6sk7HB=jU_m5w@mail.gmail.com>
In-Reply-To: <CAG48ez0XHPVY7=xcgBUcsy19jUZM1jd1uc64r6sk7HB=jU_m5w@mail.gmail.com>

--teD9ZOF6pGpwWHKmVxSgKONNapKy88bSd
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/13/18 2:04 PM, Jann Horn wrote:
> On Mon, Aug 13, 2018 at 7:42 PM Will Deacon <will.deacon@arm.com> wrote=
:
>>
>> Hi Jann,
>>
>> On Fri, Aug 10, 2018 at 05:19:38AM +0200, Jann Horn wrote:
>>> On Thu, Aug 2, 2018 at 5:16 PM Jann Horn <jannh@google.com> wrote:
>>>>
>>>> This fixes the following issues:
>>>>
>>>>  - When a buffer size is supplied to reiserfs_listxattr() such that =
each
>>>>    individual name fits, but the concatenation of all names doesn't
>>>>    fit, reiserfs_listxattr() overflows the supplied buffer. This lea=
ds to
>>>>    a kernel heap overflow (verified using KASAN) followed by an
>>>>    out-of-bounds usercopy and is therefore a security bug.
>>>>  - When a buffer size is supplied to reiserfs_listxattr() such that =
a name
>>>>    doesn't fit, -ERANGE should be returned. But reiserfs instead jus=
t
>>>>    truncates the list of names; I have verified that if the only xat=
tr on
>>>>    a file has a longer name than the supplied buffer length, listxat=
tr()
>>>>    incorrectly returns zero.
>>>>
>>>> With my patch applied, -ERANGE is returned in both cases and the mem=
ory
>>>> corruption doesn't happen anymore.
>>>>
>>>> Credit for making me clean this code up a bit goes to Al Viro, who p=
ointed
>>>> out that the ->actor calling convention is suboptimal and should be
>>>> changed.
>>>>
>>>> Fixes: 48b32a3553a5 ("reiserfs: use generic xattr handlers")
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Jann Horn <jannh@google.com>
>>>
>>> +security@
>>> Ping. I have not received any replies to this patch, which fixes a
>>> kernel security bug, for a week.
>>> Whose tree should this go through? reiserfs is marked as "supported",=

>>> but does not have a maintainer or a git repo listed, just a
>>> mailinglist, so I guess it probably has to go through either Al Viro'=
s
>>> or akpm's tree? Looks like akpm signed off on the last commits in
>>> reiserfs...
>>
>> I think Andrew's tree makes the most sense for this,
>=20
> Yeah, Andrew has already merged it. :)
> http://ozlabs.org/~akpm/mmots/broken-out/reiserfs-fix-broken-xattr-hand=
ling-heap-corruption-bad-retval.patch
>=20
>> but perhaps we should
>> also patch MAINTAINERS so mark it as "Orphan"? Patch below.
>=20
> Either that, or get someone to step up as maintainer? If I read
> https://marc.info/?l=3Dreiserfs-devel&m=3D153214303506948&w=3D2#0 corre=
ctly,
> there's still an intent to fix things in reiserfs, even though no
> maintainer is listed. (Jeff Mahoney, who wrote that message and is
> CC'ed on this thread, seems to have been out of office last week - when=

> I sent the "Ping" message a few days ago, I got a vacation
> autoresponder "I'll be out of the office until 13 August" from him.)

I suppose I can take a more active role here.  I'm probably the person
with the most experience with reiserfs who still has a role where I need
to care about it.

-Jeff

>> Will
>>
>> --->8
>>
>> From 07fbb021d5bbfe623fad10073b55704bda8e1f3d Mon Sep 17 00:00:00 2001=

>> From: Will Deacon <will.deacon@arm.com>
>> Date: Mon, 13 Aug 2018 18:31:50 +0100
>> Subject: [PATCH] MAINTAINERS: Mark reiserfs as Orphan
>>
>> Reiserfs has no Maintainer and random fixes tend to be merged through
>> with Andrew or Al's tree. Demote the filesystem to "Orphan", since it'=
s
>> clear no longer supported by anybody.
>>
>> Reported-by: Jann Horn <jannh@google.com>
>> Signed-off-by: Will Deacon <will.deacon@arm.com>
>> ---
>>  MAINTAINERS | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 544cac829cf4..b4fcc19cfb52 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -12077,7 +12077,7 @@ F:      include/linux/regmap.h
>>
>>  REISERFS FILE SYSTEM
>>  L:     reiserfs-devel@vger.kernel.org
>> -S:     Supported
>> +S:     Orphan
>>  F:     fs/reiserfs/
>>
>>  REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM
>> --
>> 2.1.4
>=20

--=20
Jeff Mahoney
SUSE Labs



--teD9ZOF6pGpwWHKmVxSgKONNapKy88bSd--

--KPemxRUFTIQn3YccjaWgfrv7O8b4v0QgW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE8wzgbmZ74SnKPwtDHntLYyF55bIFAltx0FIACgkQHntLYyF5
5bKAtw/8Dk9vtXN4f0Z1HZXNXryd4+FfyFjJts7MNJ7wycld/nEyXhVr9xI8QB0k
NfbtwiHr0bIs/p0pi9rW2C+SPhnt6rlDKjDuLFlQW0LbDkqaocneKAguXpUENHJl
VYpbFqB5XBp66E9/YzVVD+jfKvRejavbFhRVUnr2yPxDnxTJea7tRcSKe+Tr1H0i
606t1jO+nsEOh20P2fMv/d96inu5yShlhaXe8ixXcEf3EmQer0NnIDbKDGItg/6L
uUyFMdJ8luAPyKFkni5khkc8Gu5+w+mNHazH6nV5HlICgYreSciZ7oIu3ODkyUt7
gqkITHLCrqJ+FIx8gtKMBJf5/IlLzev3FM9MMnvcpRixDFMGrDW+rtmqDuKPkXlO
usy7kIc7V811cjEtD7NKBdWphPKHeI4wfSDlVUzQopA3672eWbDGnateLwfLbQ4B
vNnVJoRM/2fP1DegTty0lmPJAISLZxOVHAvJSZqF2Cyl/A6UAPibOsnRH+E/dbtU
uzyRfE1LxWltUXccjF4wvTFLpP0iC0UDr26dP7exzkoq7cpq/bIC+ET/G+RJbi18
/Ej3D4SQpxisgtHFyGOKV3l2z9e9a1OMeIW/M8Meemyj7YLO11qcopcfgpGZD5Yg
YJu24HLNpry5kcQjAvI2If1gXpeLbdlXrafd/mLY4qNvtLGzAfs=
=uSdT
-----END PGP SIGNATURE-----

--KPemxRUFTIQn3YccjaWgfrv7O8b4v0QgW--
