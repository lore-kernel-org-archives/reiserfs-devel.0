From: Hans Reiser <reiser@namesys.com>
Subject: Re: file as a directory
Date: Mon, 29 Nov 2004 07:41:48 -0800
Message-ID: <41AB433C.2030705@namesys.com>
References: <2c59f00304112205546349e88e@mail.gmail.com> <1101287762.1267.41.camel@pear.st-and.ac.uk> <4d8e3fd304112407023ff0a33d@mail.gmail.com> <200411241711.28393.christian.mayrhuber@gmx.net> <1101379820.2838.15.camel@grape.st-and.ac.uk> <41A773CD.6000802@namesys.com> <20041127124937.GO26192@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22616-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041127124937.GO26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>, Christian Mayrhuber <christian.mayrhuber@gmx.net>, reiserfs-list@namesys.com, Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>, linux-kernel@vger.kernel.org

Markus T=F6rnqvist wrote:

>On Fri, Nov 26, 2004 at 10:19:57AM -0800, Hans Reiser wrote:
>
> =20
>
>>For the case Peter cites, yes, it does add clutter to the pathname to=20
>>say "..metas" (actually, it is "...." now in the current reiser4, not=20
>>"..metas").  This is because you aren't looking for metafile=20
>>   =20
>>
>
>"...." shound like something that could be an alias for ../..
>so not much better than reserving the word "metas" from the namespace.
>
>I guess I'll still go with ..metas here, as it's the best compromise
>showed. Or maybe even ..meta (as there is no need for the plural imo)
>
>Just re-opening a damned useless, old, tired and daft can of worms :P
>
> =20
>
I agree that ..metas is much less likely to cause a namespace collision,=20
but I also think that if we called it "john" it would not be a major=20
problem, and since the issue is causing us political problems in getting=20
into the kernel, "...." is more PR right (as it does not slight Finnish=20
women named meta by suggesting they are too obscure to count), and so=20
"...." wins.    "...." also has the advantage that it is elegant in=20
extending the Unix convention, in that we already have a ".." and a "."=20
and hidden files that start with ".".
