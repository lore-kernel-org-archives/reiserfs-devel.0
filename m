From: Martin List-Petersen <martin+debian-devel@list-petersen.net>
Subject: RE: Fwd: reiser4 non-free?
Date: Mon, 03 May 2004 19:38:43 +0100
Message-ID: <1083609523.9661.14.camel@loke>
References: <3DF9165145FACB4C96977FF650C1E9040C469F16@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18402-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DF9165145FACB4C96977FF650C1E9040C469F16@its-mail1.its.corp.gwl.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Burnes, James" <james.burnes@gwl.com>
Cc: Hans Reiser <reiser@namesys.com>, Don Armstrong <don@donarmstrong.com>, debian-legal@lists.debian.org, reiserfs-list@namesys.com

On Mon, 2004-05-03 at 18:41, Burnes, James wrote:
> Is there any way to do an MD5 of either (1) each module in a software
> subsystem or (2) each software version and then have a central registry
> where interested developers and users can go to see the credits?
>
> That way you could simply do an MD5 of the current binary and use that
> fingerprint to see who wrote and contributed to it.  Much like the CDDB
> database takes a track/time fingerprint of CD's and then tells you which
> songs and artist made the CD.

Not an option, since the software is distributed in source and the look
of the binary varies based on operating system, library version, the
compiler used etc.

Also that would prevent you from modifying the source.

Freedom gone and not redistributable within Debian.

Debian actually does do checksums on the packages, but that is for security and prove of
origin reasons.

Kind regards,
Martin List-Petersen
--
"Now we'll have to kill you."
        -- Linus Torvalds


