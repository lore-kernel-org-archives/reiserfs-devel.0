From: Chris Mason <mason@suse.com>
Subject: [PATCH] data logging update to 2.4.21-pre4
Date: 04 Feb 2003 19:04:52 -0500
Message-ID: <1044403491.15680.737.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12649-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello everyone,

I've updated the data logging code to 2.4.21-pre4, which includes the
iput deadlock fix, and Andrew Morton's sync_fs race fix, so you no
longer need 01-akpm-sync_fs-fix-2.diff

Only the data logging patch changed, it includes a fix to kick
kreiserfsd after an async commit.  It fixes a stall (especially in
data=ordered mode) that comes from having to call flush_commit_list on
that async transaction later with the journal lock held.

You can get the updated patches from:

ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21

They should appear their within 30 minutes or so.

-chris


