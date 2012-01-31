From: Joe Perches <joe@perches.com>
Subject: [PATCH 0/4] fs: Remove unnecessary OOM messages
Date: Tue, 31 Jan 2012 14:42:06 -0800
Message-ID: <cover.1328049542.git.joe@perches.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: codalist@coda.cs.cmu.edu, linux-mtd@lists.infradead.org, reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Joe Perches (4):
  coda: Remove unnecessary OOM messages
  jffs2: Remove unnecessary OOM messages
  reiserfs: Remove unnecessary OOM messages
  udf: Remove unnecessary OOM messages

 fs/coda/coda_linux.h  |   13 ++++++-------
 fs/jffs2/compr_lzo.c  |    1 -
 fs/jffs2/compr_zlib.c |    6 ++----
 fs/reiserfs/journal.c |    8 ++------
 fs/reiserfs/resize.c  |    1 -
 fs/udf/super.c        |    5 +----
 6 files changed, 11 insertions(+), 23 deletions(-)

-- 
1.7.8.111.gad25c.dirty

