From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 0/3] eliminate struct semaphore from reiserfs
Date: Wed, 7 May 2008 01:52:33 +0000 (UTC)
Message-ID: <20080508063557.757413878__25838.3290995427$1210125196$gmane$org@suse.com>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756939AbYEGBwR@vger.kernel.org>
Date: Thu, 08 May 2008 02:35:57 -0400
Sender: linux-kernel-owner@vger.kernel.org
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

