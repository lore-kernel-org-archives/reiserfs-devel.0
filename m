From: Nikita Danilov <Nikita@Namesys.COM>
Subject: [ANNOUNCE]: reiser4
Date: Tue, 29 Oct 2002 20:45:52 +0300
Message-ID: <15806.51536.985203.709475@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11825-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Kernel Mailing List <Linux-Kernel@Vger.Kernel.ORG>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hello,

Snapshot of reiser4 source code can be found at 
http://www.namesys.com/snapshots/2002.10.29/.

It is set of patches against current Linus BK tree (2.5.44).

Reiser4 is the next version of ReiserFS file system. It was re-written
from the scratch. It supports:

 - full data journalling with "wandered logs" ("shadows" in DB
   parlance);

 - extent-based files;

 - delayed allocation of disk space and on-line optimization of disk
   layout across file boundaries;

 - plugins: infrastructure for easy extention of file system and utils
   functionality;

 - and a lot more, see http://www.namesys.com/v4/v4.html

Snapshot contains reiser4 proper (fs_reiser4.diff), set of patches
(described in READ.ME) with necessary changes to the core kernel, and
utils package (in particlar, mkfs.reiser4).

It is still crasheable. Do not put critical data on it.

Nikita.
