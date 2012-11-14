From: Jeff Mahoney <jeffm@suse.de>
Subject: Re: [PATCH] reiserfscore/hashes.c
Date: Wed, 14 Nov 2012 18:38:21 -0500
Message-ID: <50A42B6D.8090306@suse.de>
References: <20121106154905.GA11281@bom.nom.co> <5099694F.8060502@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <5099694F.8060502@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: "Michael W. Bombardieri" <mb@ii.net>, reiserfs-devel@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11/6/12 2:47 PM, Edward Shishkin wrote:
> On 11/06/2012 04:49 PM, Michael W. Bombardieri wrote:
>> Hi Edward,
>>=20
>> I was browsing the git repository for reiserfs...=20
>> https://git.kernel.org/?p=3Dlinux/kernel/git/jeffm/reiserfsprogs.git=
;a=3Dsummary
>>
>>
>>=20
This code is entirely new to me.
>>=20
>> I have a patch which simplifies the yura_hash function in=20
>> reiserfscore/hashes.c. Here is what it does:

Hi Michael -

Can you send the patch directly to me (or the list) so I can just git
am it? It should have a subject like [PATCH] reiserfscore: clarify
yura_hash or something.

- -Jeff

>> 1. Remove temporary variable 'c' 2. Remove two nested loops which
>> always set pow=3D1
>>=20
>> I tested this using the following code on i386 and amd64.
>>=20
>> int main(void) { char *test[] =3D { "a", "bb", "ccc", "dddd",=20
>> "eeeee", "ffffff", "ggggggg", "red leather", "yellow leather",=20
>> NULL }; size_t n; int i; u32 x;
>>=20
>> for (i =3D 0; test[i] !=3D NULL; i++) { n =3D strlen(test[i]);=20
>> printf("input=3D\"%s\" len=3D%u ", test[i], n); x =3D
>> yura_hash(test[i], (int)n); printf("hash=3D%lu\n", x); } return
>> (0); }
>>=20
>> The results between my version and the original yura_hash are
>> identical:
>>=20
>> input=3D"a" len=3D1 hash=3D4084352 input=3D"bb" len=3D2 hash=3D41484=
80=20
>> input=3D"ccc" len=3D3 hash=3D4802688 input=3D"dddd" len=3D4 hash=3D1=
1472896=20
>> input=3D"eeeee" len=3D5 hash=3D79455104 input=3D"ffffff" len=3D6
>> hash=3D772077312 input=3D"ggggggg" len=3D7 hash=3D3531332224 input=3D=
"red
>> leather" len=3D11 hash=3D959593472 input=3D"yellow leather" len=3D14
>> hash=3D410631168
>>=20
>> I'm not sure if the yura_hash function is used heavily, or at
>> all. I'm sending this patch in case you are interested to take a
>> look.
>=20
>=20
> Hello Michael,
>=20
> Your changes look OK to me.
>=20
> TBH, I don't like the fact that the pow is set to 1 by such tricky
> ways in the mentioned nested loops: it might indicate mistakes in
> the original code.
>=20
> Generally I think that this hash is not heavily used: everyone uses
> either r5, or tea hash, so... A=D1=81ked-by: Edward Shishkin
> <edward.shishkin@gmail.com>
>=20
> Thanks, Edward. P.S. This is a git repository of Jeff Mahoney, the
> reiserfs maintainer, so don't forget cc him ;)
>=20
>=20
>=20
>> - Michael
>>=20
>>=20
>> --- hashes.c    Tue Nov  6 23:21:09 2012 +++ hashes_new.c    Tue
>> Nov  6 23:26:26 2012 @@ -175,37 +175,26 @@ u32 yura_hash (const
>> signed char *msg, int len) { -    int j, pow; -    u32 a, c; -
>> int i; - -    for (pow=3D1,i=3D1; i < len; i++) pow =3D pow * 10; - =
-
>> if (len =3D=3D 1) -    a =3D msg[0]-48; -    else -    a =3D (msg[0]=
 -
>> 48) * pow; - -    for (i=3D1; i < len; i++) { -    c =3D msg[i] -
>> 48; -    for (pow=3D1,j=3Di; j < len-1; j++) pow =3D pow * 10; -    =
a =3D
>> a + c * pow; -    } - -    for (; i < 40; i++) { -    c =3D '0' -
>> 48; -    for (pow=3D1,j=3Di; j < len-1; j++) pow =3D pow * 10; -    =
a =3D
>> a + c * pow; -    } - -    for (; i < 256; i++) { -    c =3D i; -
>> for (pow=3D1,j=3Di; j < len-1; j++) pow =3D pow * 10; -    a =3D a +=
 c *
>> pow; -    } - -    a =3D a << 7; -    return a; +    int i, j,
>> pow; +    u32 a; + +    a =3D msg[0] - 48; +    if (len !=3D 1) { +
>> for (i =3D 1, pow =3D 1; i < len; i++) +            pow *=3D 10; +
>> a *=3D pow; +    } +    for (i =3D 1; i < len; i++) { +        for (=
j
>> =3D i, pow =3D 1; j < len - 1; j++) +            pow *=3D 10; +
>> a +=3D pow * (msg[i] - 48); +    } +    for (; i < 40; i++) +
>> a +=3D '0' - 48; +    for (; i < 256; i++) +        a +=3D i; +    a
>> <<=3D 7; +    return a; }
>>=20
>=20
> -- To unsubscribe from this list: send the line "unsubscribe=20
> reiserfs-devel" in the body of a message to
> majordomo@vger.kernel.org More majordomo info at
> http://vger.kernel.org/majordomo-info.html


- --=20
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.18 (Darwin)
Comment: GPGTools - http://gpgtools.org
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iQIcBAEBAgAGBQJQpCtsAAoJEB57S2MheeWyonwP/iFfh06TBivRigIsKui1lEsR
Qu440GPB96WBr6TGSCcEgRb9GirVy0yPx/lNTmpyi2m27hn2RivMEgy6r8uVx+4K
S7+FRaZ7ysKhmrcX44KBsoIvvDqKIFaOpaTpGWlPK5kfYnRZJ47y0hSWyQgL1C2x
Bx2iiGo06wvUIv/tCSKcL95+wWHBYHbd7ouxZ3zZU4orrP40rtxjSxNJoa3PUrhE
gNUZfnksQjlYWu5voNbbyR2RXfx5DCZrbag/Wjkr0/VaFv+SDi1vWKaFuYHA4K60
VfsJdJ08xqkPRczCNE+KrqhobDM6hDDisnSek1fWQF3nOLnrF+Gz6FsvhZ2WKkrj
sLHP304B+Apcx1S8+exaq58Yap0k24WwCQ8brT6CobgSBcwNph0OhC7FdHVnmvtg
0VqGc6KVQMcWw6x7ktuXpN5zm7RilFDzdSCL2Np/a0ohsVKYB+LACmeMn01rOjrt
hMZ44Ac+b0WdomwCVvp38f7P2TBLckpglWwyUVwaK0fcPi0Tv5bznKC4wXYiMIVu
uuoDxHBLt1AFUoQB3ND4/PfCHHzThJreVpROd3U50lgJBkIRm6+E5PSUKyixZOjO
DRGqhaSHV8Hf4vs3x9I3VSQog94cBTwscg/cnCQZZ4KBNVSffA8DdC4f5AkSazZg
TZPsbMbSPKhaIICEmoJ7
=3Dp/We
-----END PGP SIGNATURE-----
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
