From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 0/7 (take 2)] reiserfs fixes patch set
Date: Thu, 18 Oct 2007 14:24:02 -0400
Message-ID: <20071018182402.819638928@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: ReiserFS Development Mailing List <reiserfs-devel@vger.kernel.org>

 Hi Andrew -

 Here's the same queue I sent yesterday, but cleaned up a bit:

 * Added the missing memset 0->0xff chunk to reiserfs-remove-first-zero-hint.
 * reiserfs-ignore-on-disk-s_bmap_nr-value uses static inlines instead of
   macros.
 * The patches all pass checkpatch.pl now.
 * Fixed missing ; in bitmap.c from reiserfs-remove-first-zero-hint. This
   got through because a later patch in my queue removes that line.

 Please replace the patches in -mm with these versions.

 Thanks.

 -Jeff

--
Jeff Mahoney
SUSE Labs

