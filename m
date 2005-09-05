From: michael chang <thenewme91@gmail.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Mon, 5 Sep 2005 08:14:28 -0400
Message-ID: <b14e81f0050905051426605bdc@mail.gmail.com>
References: <4317FD1B.504@namesys.com>
	 <Pine.GSO.4.44L.0509021620380.23379-100000@unix2.cc.ksu.edu>
	 <b14e81f005090318046ee67d7e@mail.gmail.com>
Reply-To: thenewme91@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25862-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f005090318046ee67d7e@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Stegman <matts@ksu.edu>
Cc: reiserfs-list@namesys.com

On 9/3/05, michael chang <thenewme91@gmail.com> wrote:
> long as it remembers to try and repack free space too).  As for the 5%
> error; a warning is safer.  Either that, or put in a force option to
> get around the "error".

To clearify, I was referring to being able to bypass a potential
warning on less than 5% free ON TOP OF THE 5% THAT IS RESERVED BY
REISER4 in the REPACKER.

Of course, the 5% already reserved, I believe, is important -
reserving 7.5 or 10% wouldn't kill anyone either, IMO, unless they're
on an embedded system (but that has it's own issues entirely anyhoo).

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
