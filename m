From: =?UTF-8?B?R3J6ZWdvcnogSmHFm2tpZXdpY3o=?= <gj@pointblue.com.pl>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 03 Sep 2004 06:43:21 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <4137F669.2000505@pointblue.com.pl>
References: <112698263.20040826005146@tnonline.net> <Pine.LNX.4.58.0408251555070.17766@ppc970.osdl.org> <1453698131.20040826011935@tnonline.net> <20040825163225.4441cfdd.akpm@osdl.org> <20040825233739.GP10907@legion.cup.hp.com> <20040825234629.GF2612@wiggy.net> <1093480940.2748.35.camel@entropy> <20040826044425.GL5414@waste.org> <1093496948.2748.69.camel@entropy> <20040826053200.GU31237@waste.org> <20040826075348.GT1284@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040826075348.GT1284@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?UTF-8?B?TWFya3VzIFTDtnJucXZpc3Q=?= <mjt@nysv.org>
Cc: Matt Mackall <mpm@selenic.com>, Nicholas Miell <nmiell@gmail.com>, Wichert Akkerman <wichert@wiggy.net>, Jeremy Allison <jra@samba.org>, Andrew Morton <akpm@osdl.org>, Spam <spam@tnonline.net>, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Markus T=C3=B6rnqvist wrote:

>On Thu, Aug 26, 2004 at 12:32:00AM -0500, Matt Mackall wrote:
> =20
>
>>Find some silly person with an iBook and open a shell on OS X. Use cp
>>to copy a file with a resource fork. Oh look, the Finder has no idea
>>what the new file is, even though it looks exactly identical in the
>>shell. Isn't that _wonderful_? Now try cat < a > b on a file with a
>>fork. How is that ever going to work?
>>   =20
>>
>
>Then I guess OS X ships a broken implementation of cp, yes?
>
> =20
>
Nope, GUI handles it perfectly. it's maybe 0.1% of users of MacOS that =
acctually care about cp being broken.

--
GJ=20

-
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
