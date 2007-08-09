From: jeffm@suse.com
Subject: [patch 0/3 (right version)] reiserfs: support for file systems > 8 TiB (right version)
Date: Wed, 08 Aug 2007 21:32:47 -0400
Message-ID: <20070809013247.791820925@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development Mailing List <reiserfs-devel@vger.kernel.org>
Cc: Vladimir Saveliev <vs@namesys.com>

 Hi all -

 Grumble. I managed to send the wrong versions. Of course it didn't
 remove the cached bitmap.

 When I was integrating my reiserfsprogs patches into 3.6.20, I realized
 that it already understands larger bitmaps. Not only that, it zeroes them
 out just as my patches did. Since that revision has been released for
 nearly a year, I'd call that "standard."

 This set of patches should be the final one. Rather than caching the
 bitmap count in the superblock, we calculate it on the fly like
 reiserfsprogs does.

 I've integrated this patch set into the openSUSE 10.3 kernel, but I'm
 confident they'll survive some heavier testing.

 -Jeff

-- 
Jeff Mahoney
SUSE Labs

