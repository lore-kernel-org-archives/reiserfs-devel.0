From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Question on how file tails are stored
Date: Mon, 13 Oct 2008 16:05:48 +0400
Message-ID: <48F3399C.4000907@gmail.com>
References: <Pine.A41.4.64.0809100203340.884914@stalin.acc.umu.se> <Pine.A41.4.64.0809131302350.548908@stalin.acc.umu.se>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <Pine.A41.4.64.0809131302350.548908@stalin.acc.umu.se>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Bo_Brant=E9n?= <bosse@acc.umu.se>
Cc: reiserfs-devel@vger.kernel.org

Bo Brant=E9n wrote:
>
> Hello,

Hello.

>
> I would like to ask you how file tails are stored on ReiserFs 3.6, am
> I right that they are stored as either one or two items but not more
> than two?

Yes, if you mean (default) "small" tail suppression policy.

Indeed, a data flow of size < blocksize can not be
split into more then 2 chunks, if you partition it by a lattice
which has a step =3D=3D blocksize.=20

>
> Also I found this statement on the Internet:
>
> "If a tail is larger than the maximum size of a file that can fit int=
o
> a formatted node but is smaller than the unformatted node size (4K),
> then it is stored in an unformatted node,=20

Right.
It fits perfectly the "small" policy .


> and a pointer to it plus a count of the space used is stored in an
> indirect item."

This looks like some not related calculation..

>
> Does this represent a third case not covered of what I said above, an=
d
> if so how does one detect this case and find the tail data?

There is no special interfaces to access tail data.
You can try to parse debugreiserfs -d output..

Thanks,
Edward.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
