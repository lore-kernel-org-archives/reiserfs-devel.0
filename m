From: Hans Reiser <reiser@namesys.com>
Subject: My Dad suggests a redundant copies plugin
Date: Mon, 24 Oct 2005 22:48:04 -0700
Message-ID: <435DC714.6000505@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26620-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>
Cc: dad <ramon.reiser@us.army.mil>

This would not be (at least in theory) useful for RAID devices, but for
a user with a single disk drive, it might be useful to have a plugin
that creates two (or N) copies, and tries to allocate the two copies at
opposite ends of the disk.  Anyone out there still looking for a plugin
to write?

Hans
