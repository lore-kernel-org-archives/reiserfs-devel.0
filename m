From: Joshua Wise <joshua@joshuawise.com>
Subject: reiserfsck does not actually fix bitmap
Date: Wed, 06 Jul 2005 23:25:38 -0400
Message-ID: <42CCA0B2.6030701@joshuawise.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25023-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi folks,

I just set up a new system, and all was well, but on a boot of the
system a few days later, I was greeted with reiserfsck complaining that
the number of free blocks was incorrect, and that it wished to run
itself with --fix-fixable. It did so, noting that the on-disk and
correct bitmaps differ. It said that they will be fixed later, as shown:

Comparing bitmaps..vpf-10630: The on-disk and the correct bitmaps
differs. Will be fixed later.

The system rebooted, and it ran reiserfsck -p (or -a, I dunno which)
once more. Again, it said that the on-disk and correct bitmaps differed,
and that they would be fixed "later". This repeated until I booted into
a liveCD and ran reiserfsck from there.  A -p from there shows that
"Some corruptions on the filesystem were detected. Switching to the
--fix-fixable mode". When it entered --fix-fixable mode, it again
mentioned taht the on-disk and correct bitmaps differed, and that it
would fix them later, but at the end, it said "No corruptions found" and
made no sign that it actually fixed the bitmaps. Running reiserfsck -p
again showed no difference, so it seems to me like reiserfsck didn't fix
the bitmap when it told me it would.

Does anyone have any insights as to how to get reiserfsck to actually
fix the problem?

Thanks,
joshua
