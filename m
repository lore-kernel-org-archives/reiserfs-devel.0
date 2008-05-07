From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 0/3] eliminate struct semaphore from reiserfs
Date: Wed, 7 May 2008 01:51:35 +0000 (UTC)
Message-ID: <20080508063557.757413878@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Date: Thu, 08 May 2008 02:35:57 -0400
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: reiserfs-devel@vger.kernel.org

 Reiserfs uses sems for a few different locks, but only uses them as
 mutexes. The following three patches replace the semaphores with
 mutexes.

 -Jeff

--
Jeff Mahoney
SuSE Labs


