From: David Masover <ninja@slaphack.com>
Subject: Re: future r4 maintenance question
Date: Sat, 22 Jul 2006 14:32:47 -0500
Message-ID: <44C27D5F.3040405@slaphack.com>
References: <1992401892.20060722173244@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29143-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1992401892.20060722173244@wp.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pysiak Satriani <pysiak.satriani@wp.pl>
Cc: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Pysiak Satriani wrote:
> Hello,
> 
> one of the concerns of LKML folks about r4 is that namesys after
> finishing their work with r4 will "rush off" to reiser5 leaving
> r4 as "stable" in a "bugfix-mode only"

> But a question arises. Will namesys keep r4 in a bugfix-only mode
> (as with reiserfs v3) or will it have resources planned not only
> for bugfixes but for updates too ?

As I understand it, r4 is currently not finished, especially comparing 
the whitepaper with reality.  So, while the features that are finished 
are mostly stable, I can't imagine them rushing off to v5 without 
finishing the features originally planned for v4.

Examples would be pseudofiles, custom plugins (per-file and 
per-directory, also), a repacker, fsync optimization, a 
crypto/compression plugin...

Ultimately, this may happen, but by then, I expect v4 would be fairly 
stable and complete.  Besides, bugfix-only does imply bugfixes, which is 
about all most other filesystems get these days...

Disclaimer:  I don't work here.  If you want a definitive answer, wait 
for someone at Namesys to confirm or deny what I've just said.
