From: Chris Mason <mason@suse.com>
Subject: [PATCH] finally... data logging for 2.4.20-pre10
Date: 15 Oct 2002 15:24:42 -0400
Message-ID: <1034709883.5053.920.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11698-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello all,

I've uploaded new data logging code against 2.4.20-pre10 to 

ftp.suse.com/pub/people/mason/patches/data-logging/2.4.20

The mirror might take a little while to update.

This code is lightly tested, use with caution for a few days.  The
journal relocation patches are not complete yet, I haven't integrated
them with the new options parsing code in 2.4.20-pre, so you can't pass
-o jdev= when mounting the FS.

Aside from merging into the latest kernel, there are a few bug fixes for
corner case oopsen hit during suse testing.

-chris




