From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: Longhorn FS being removed to Blackcomb (end of decade)
Date: Fri, 09 Apr 2004 15:26:15 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <877jwp54x4.fsf@uhoreg.ca>
References: <3DF9165145FACB4C96977FF650C1E9040C469DD0@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17819-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "James" == Burnes, James <james.burnes@gwl.com> writes:

James> Just thought this might be interesting to some of you.  The
James> database-like FS for Longhorn has just been delayed until the end
James> of the decade.  That's great.  It means that Microsoft's attempt
James> to copy the BeOS filesystem is not meeting with much success.

From the article[1]:

  The current plan calls for the file system to work on PCs but not
  extend to files shared over a corporate network.

[1] http://yahoo.businessweek.com/magazine/content/04_16/b3879009_mz001.htm

So it looks like WinFS will still be in Longhorn, but with scaled-back
capabilities.  (Of course, with Microsoft, you never really know what to
expect.)  So it sounds like Reiser6, without the Reiser5 stuff (IIRC,
Reiser6 adds the database capabilities, and Reiser5 is a distributed
filesystem, and the order in which they will appear depends on
funding).

Given how long it took Reiser4 to materialize, I'm not too confident
that Reiser6 will appear before Longhorn.  But then again, Reiser4 was
a complete rewrite, while Reiser6 should be mostly just new plugins.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

