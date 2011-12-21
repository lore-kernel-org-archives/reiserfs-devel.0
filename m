From: Jan Kara <jack@suse.cz>
Subject: [PATCH 0/2] Two reiserfs mount options fixes
Date: Wed, 21 Dec 2011 20:23:54 +0100
Message-ID: <1324495436-11203-1-git-send-email-jack@suse.cz>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org

  Hello,

  I have fixed two problems with mount options on reiserfs (a bug in quota
option parsing and the fact that mount options were not properly displayed in
/proc/mounts which matters for newer quota tools) and carry following fixes
in my tree. If noone objects, I'll push them to Linus in the next merge window.

									Honza

