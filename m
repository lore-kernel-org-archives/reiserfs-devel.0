From: Lars Marowsky-Bree <lmb@suse.de>
Subject: Re: reiser4 data journalling?
Date: Wed, 3 Sep 2003 12:52:11 +0200
Message-ID: <20030903105211.GC5762@marowsky-bree.de>
References: <3F4E3AF9.2060100@tupshin.com> <16206.16138.72832.920045@laputa.namesys.com> <3F4E6AA4.3030900@namesys.com> <20030829001814.GB9019@zero> <20030829131250.GU24767@marowsky-bree.de> <3F55170E.1080603@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15527-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F55170E.1080603@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>
Cc: Reiserfs List <reiserfs-list@namesys.com>

On 2003-09-03T02:17:50,
   Hans Reiser <reiser@namesys.com> said:

> No, isolation is not yet implemented and won't be unless we come up with =

> some more funding from somewhere.  The txnmgr seems to be structured to=20
> handle isolation, but....

Ah, okay. Sorry, I think I had older plans in mind and hadn't checked
how far the current roadmap matched up to them ;-)

> The new thing with reiser4 is that if you do that write of 1MB to a=20
> file, and perhaps updates to 63 other files as well, as part of an atom, =

> it will either all survive a crash, or none of it will.  We have=20
> considered using the term "transcrash" for this.

So it's ACD and not ACID ;-) Sounds good. How is this weak transaction
exported to userspace, ie how do I signal BEGIN and COMMIT/ABORT?



Sincerely,
    Lars Marowsky-Br=E9e <lmb@suse.de>

--=20
High Availability & Clustering		ever tried. ever failed. no matter.
SuSE Labs				try again. fail again. fail better.
Research & Development, SuSE Linux AG		-- Samuel Beckett

