From: Hans Reiser <reiser@namesys.com>
Subject: Re: snapshot, checkpoints
Date: Thu, 10 Jun 2004 19:27:33 -0700
Message-ID: <40C91895.5090009@namesys.com>
References: <20040527065259.99429.qmail@web51306.mail.yahoo.com>	<1085641393.1915.199.camel@tribesman.namesys.com>	<20040527092727.GO4990@nysv.org>	<20040604131005.hmvps8wcw4sccgcs@www.wagland.net>	<200406041925.i54JPZgp025255@turing-police.cc.vt.edu>	<40C14E9C.4000706@slaphack.com>	<116CD3CA-B709-11D8-A933-000A95CD704C@kungfoocoder.org>	<40C78D86.2060305@slaphack.com> <20040610065427.622450fb@rayanne> <40C7EFB9.1040609@namesys.com> <40C8DD73.7080100@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19141-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40C8DD73.7080100@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Pierre Etchemaite <petchema@concept-micro.com>, reiserfs-list@namesys.com

David Masover wrote:

>
>
> Hans Reiser wrote:
> | Pierre Etchemaite wrote:
> |
> |> Le Wed, 09 Jun 2004 17:21:58 -0500, David Masover=20
> <ninja@slaphack.com> a
> |> =E9crit :
> |>
> |>
> |>
> |>> Good, then we don't have to immediately rewrite the wheel.  But I=20
> still
> |>> would rather that we do this eventually.  My concept has the changes
> |>> stored on the same partition, seems like it may be faster, and=20
> opens the
> |>> door for a filesystem-based cvs.
> |>>
> |
> | This phrase made me thing you might want to be aware of
> | http://www.namesys.com/blackbox_security.html which got darpa funding
> | recently....
>
> Looks cool, I sort of understand it, but what's it got to do with what I
> said?  What "phrase"?  Filesystem-based cvs?
>
Yes, views are an important step towards "Filesystem-based cvs", see=20
clearcase as an example.  Transaction infrastructure, substantially=20
present in reiser4 (see our (long) main page on reiser4 design,=20
somewhere near the middle I think), is also an important component. =20
Currently we support atomic sets of fs operations, although this is=20
immature code (meaning reiser4 works reliably but the api is still in=20
progress, etc.).
