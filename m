From: Jordan Breeding <jordan.breeding@attbi.com>
Subject: Reiserfs labels/uuid in 2.5.X
Date: Thu, 16 May 2002 00:45:36 -0500
Message-ID: <3CE34780.603@attbi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10321-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello,

   I noticed that reiserfstune can now generate uuids and place labels 
in the superblock.  When will the reiserfs code in 2.5.X be able to use 
those fields to do things like `mount -L "/usr" /usr`?  Right now that 
command simply states that it can not find a suitable partition.  Thanks 
for any information.

Jordan

