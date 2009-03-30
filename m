From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 00/35] Jeff's ReiserFS Patch Queue
Date: Mon, 30 Mar 2009 14:02:15 -0400
Message-ID: <20090330180215.951354436@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Hi all -

I'd like to submit my reiserfs patch queue for inclusion into 2.6.30. I've
received a bunch of requests from Christoph asking me to do this over the
past two years. They needed some cleaning up (done), and there was one final
crash that prevented me from submitting to 2.6.27 and 2.6.28, which has now
been fixed. These patches have been in several openSUSE releases and, outside
of the now-fixed crash, they've been stable. Once this is applied, I expect
reiserfs to be in deep maintenance-only mode.

There are 35 patches in several groups:

- Quick fixes
  - Implement mount count and expiry in the superblock.
  - Audit commit id's to always be unsigned ints
- Better error handling and reporting
  - Standardizes error output
  - Adds more robust error handling where it will currently panic
- Extended attribute rework
  - Cleans up the code
  - Improves locking
  - Journals extended attributes
  - Adds selinux support
  - Uses generic xattr helpers
- Code cleanups
  - Simplifies the buffer_info struct usage
  - Kills off decrement_bcount and cleans up surrounding code
  - Strips whitespace
  - Kills off the stupid variable name prefixing

Please apply.

-Jeff

--
Jeff Mahoney
SUSE Labs

