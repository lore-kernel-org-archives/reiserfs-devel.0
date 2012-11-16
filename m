From: Jan Kara <jack@suse.cz>
Subject: [PATCH 0/4] Fix reiserfs deadlocks with quotas
Date: Fri, 16 Nov 2012 12:33:36 +0100
Message-ID: <1353065620-27279-1-git-send-email-jack@suse.cz>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org


  Hello,

  recent user report brought to my attention that quota on reiserfs is
rather easy to deadlock. This is a fallout from BKL conversion. This
series should fix the issue (at least fsstress runs now on reiserfs with
quotas enabled without any lockdep warnings and reported deadlocks are
solved as well). I'll push these patches to Linus soon if noone complains.

								Honza
