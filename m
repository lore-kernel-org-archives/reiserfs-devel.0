From: "David Masover" <jedi@ninja.dynup.net>
Subject: fsck.reiser4 error
Date: Tue, 23 Dec 2003 10:07:15 -0600
Message-ID: <20031223160715.26652.qmail@ninja.dynup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16395-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: reiserfs-list@namesys.com

# fsck.reiser4 /dev/hda8
*** lots of warnings ***
Fscking the /dev/hda8 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Continue?
(Yes/No): Yes
***** Openning the fs.
umka-2198: Assertion (oid != NULL) at oid.c:161 in function 
reiser4_oid_layout() failed.
Aborted 

Can this fs be saved easily?
