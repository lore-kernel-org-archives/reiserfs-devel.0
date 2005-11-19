From: michael chang <thenewme91@gmail.com>
Subject: Re: Fragmentation / repacker / append-performance
Date: Sat, 19 Nov 2005 04:50:52 +0000
Message-ID: <b14e81f00511182050m3a613303u39a3a683040d4319@mail.gmail.com>
References: <437E02A9.2050107@isg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27024-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <437E02A9.2050107@isg.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lutz Vieweg <lkv@isg.de>
Cc: reiserfs-list@namesys.com

On 11/18/05, Lutz Vieweg <lkv@isg.de> wrote:
> Hans Reiser wrote:
>
>  > 6% fragmentation is enormous.  You very much need the
>  > repacker we have not yet written.....
>
> There has been talk about such a feature for a long time -
> did anybody already write a concept on how to do this?
> Has an effort been estimated? Is somebody already assigned
> to that task?

I believe there used to be an implementation, although right now a lot
of things have sort of dissapeared and been put on hold for Kernel
Merge. [In any case, the repacker has been gone for a while - there
was mention of it on the Reiser4 Wikipedia page for a while but that
was severely outdated, apparently.]

Hans has it on the top of his list; I believe they're just trying to
get priorities straight (kernel acceptance first).

> It's not too difficult for us to implement de-fragmentation
> mechanisms on the application level, but if the file
> system can do it - even better...

Definately.

[...]

> PS: I'm still glad we sponsored the 64bit-port years
>      ago, as we're still using reiser3 on a lot of
>      systems that can really use it - and of course
>      newly bought systems are 64bit architectures... :-)

I feel sorry for all the unaware consumers being suckered out there
into buying two-year-old 32-bit machines.  I guess they do have to
sell them to somebody, though.

--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
