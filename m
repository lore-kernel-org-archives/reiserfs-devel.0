From: "Sascha Fleiss" <sfleiss@mfsconsulting.de>
Subject: rebuild-trre Fails
Date: Sun, 15 Sep 2002 15:12:56 +0200
Message-ID: <004601c25cb9$9ba85280$fe01a8c0@sfhome>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11452-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi List,

I have a corrupted Reiserfs and trying to fix something using rebuild-tree.

But this fails every time because some blocks can't be read. I think is
because SCSI-Problems, because it stop's every time on another block.

Is there a way to tell reiserfsck to keep retrying without aborting ?

Regards,

Sascha Fleiss




