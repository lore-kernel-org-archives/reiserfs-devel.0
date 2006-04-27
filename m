From: "Gregory Maxwell" <gmaxwell@gmail.com>
Subject: Re: reiserfs performance on ssd
Date: Thu, 27 Apr 2006 13:25:49 -0400
Message-ID: <e692861c0604271025t8b60d9cn9aa47d68de55df5a@mail.gmail.com>
References: <20060427151655.8b771812.pegasus@nerv.eu.org>
	 <20060427134702.GA8202@favonius>
	 <e692861c0604270728p2aa4a4e0i70d1ad43a3da2fcf@mail.gmail.com>
	 <BAYC1-PASMTP050C1EF12709BADAABFDBEBFBD0@CEZ.ICE>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28536-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <BAYC1-PASMTP050C1EF12709BADAABFDBEBFBD0@CEZ.ICE>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Toby Thain <toby@smartgames.ca>
Cc: reiserfs-list@namesys.com

On 4/27/06, Toby Thain <toby@smartgames.ca> wrote:
> Sure ECC would be nice, but how does this differ from disk? Silent
> failures are certainly possible.
>
> The fact that error detection and propagation doesn't really happen
> in modern disk subsystems is why systems like Sun's ZFS are coming
> into being.

Um. Because *every* cosmic ray hit (of which you can expect one to two
every week or so with 2+ gigs of ram) will result in data corruption.

It's claimed that disks don't do a great job propagating hard errors,
which is true to an extent. But they *do* manage to handle soft
errors. Without the coding gain provided by block ECC your modern high
density would be nearly useless.

ZFS wouldn't make iram seriously useable... because AFAIK, raidz will
not work on a single device... so even if can detect a bad block, it
can't correct it.

The problem goes further than that because the cost of computing block
checksums in software will greatly reduce the performance of the fast
ram device..

Not that better integrity features are bad.. The iron filesystem paper
has a lot of great suggestions that go beyond what ZFS provides, and
it would be wonderful to see them in reiser4 someday.  But things need
to progress one step at a time.
