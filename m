From: Heinz-Josef Claes <hjclaes@web.de>
Subject: hard linking in reiserfs 4
Date: Tue, 18 Nov 2003 07:53:32 +0100
Sender: hjclaes@web.de
Message-ID: <1069105166.3206.3.camel@schlappix.schnulli.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16109-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I read the following in the man page of ln:

(ln (coreutils) 5.0    March 2003   LN(1))

   -d, -F, --directory
          hard link directories (super-user only)

This is not possible with reiserfs 3.6.
Will it be possible with reiserfs 4?
I'm really interested in this feature - does anybody know an existing
filesystem supporting hard links to directories? (I know ext2 does not
support them either.)

Best regards,



-- 
Heinz-Josef Claes                     hjclaes@web.de
project: http://sourceforge.net/projects/storebackup
      -> snapshot-like backup to another disk



