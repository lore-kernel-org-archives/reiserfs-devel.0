From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 0/3] reiserfs xattr fixups
Date: Tue, 05 May 2009 15:30:14 -0400
Message-ID: <20090505193014.926371851@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Devel <reiserfs-devel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Al Viron <viro@ZenIV.linux.org.uk>

 This series consists of three patches:

 1) rework the bit of locking after Al's privroot lookup patch
 2) Fix up security xattrs so they don't apply to other xattrs
 3) Clean up the privroot hiding since we now cache the privroot early

 -Jeff


