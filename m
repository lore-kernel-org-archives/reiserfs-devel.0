From: Peter Nelson <pnelson@andrew.cmu.edu>
Subject: Re: Again, some bad Reiser4 (ReiserFS) 'reviews'
Date: Mon, 02 Aug 2004 12:09:22 -0500
Message-ID: <410E7542.70602@andrew.cmu.edu>
References: <200407150025.30908.Dieter.Nuetzel@hamburg.de> <40F6C548.7030805@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19917-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40F6C548.7030805@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Dieter N=FCtzel wrote:

> http://rufus.hackish.org/wiki/2.6FileSystemBenchmarks
>
> Greetings,
>     Dieter

Hi, sorry for the late reply, but I've been on vacation for the past=20
month.  When I originally ran these benchmarks a few months ago I had=20
posted them to the LKML and this list, but it was linked to a different=20
website (which has been renamed a few times now).  After a good amount=20
of discussion on the LKML, this benchmark was actually what prompted=20
Hans "to add a nice little optimization for compiles to Reiser4 as a=20
result of thinking about compile benchmarks" (sorting by the last=20
character).  Anyway, I'm going to be building a new system in around 1=20
months time which will be the perfect opportunity to rerun all these=20
benchmarks.  If anyone has suggestions on how to make the test better,=20
feel free to pass them along.  The thing I'd be most interested in=20
testing is if there's a way to flush file caches to see how much of a=20
difference having the file cached in ram compared to reading off disk makes.

-Peter Nelson

