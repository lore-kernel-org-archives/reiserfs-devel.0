From: Lars Marowsky-Bree <lmb@suse.de>
Subject: Re: reiser4 data journalling?
Date: Fri, 29 Aug 2003 15:12:50 +0200
Message-ID: <20030829131250.GU24767@marowsky-bree.de>
References: <3F4E3AF9.2060100@tupshin.com> <16206.16138.72832.920045@laputa.namesys.com> <3F4E6AA4.3030900@namesys.com> <20030829001814.GB9019@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15493-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030829001814.GB9019@zero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Reiserfs List <reiserfs-list@namesys.com>

On 2003-08-28T20:18:14,
   Tom Vier <tmv@comcast.net> said:

> and shell builtins would have to be modded to insure page alignment. it
> would be neat if all the regular builtins (cp, mv, ln) were atomic.

mv (ie, rename), ln and rm have always been atomic. That's a POSIX
requirement.

The new thing with reiserfs4 seems to be that if you do a write of, say,
1M size in the atomic way, another reading process will either see all
of the write or none of the write to have taken place.

(Right now, you could see a 'partial' read, where some pages from the
write have been written already while others return the old data.)

And apparently, you can say "begin transaction" and "commit / abort
transaction" to achieve the same for multiple operations as a group.

Hans, does that support nested transactions, too?

And one thing has slipped from my mind: How do I enter a transaction? is
it like chroot(), or a task-specific thing, how can child processes
participate in the transaction etc?


Sincerely,
    Lars Marowsky-Br=E9e <lmb@suse.de>

--=20
High Availability & Clustering		ever tried. ever failed. no matter.
SuSE Labs				try again. fail again. fail better.
Research & Development, SuSE Linux AG		-- Samuel Beckett

