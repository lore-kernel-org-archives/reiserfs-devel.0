From: Filipe Almeida <filipe@rnl.ist.utl.pt>
Subject: security issue with metas/readdir in reiser4
Date: Sun, 28 Mar 2004 21:43:14 +0100
Message-ID: <200403282143.14376.filipe@rnl.ist.utl.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17546-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

There is a security problem with the implementation of dir/metas/readdir.
This file is readable even if the directory isn't readable by the current 
user. This is against traditional unix behavior and is a security issue in 
many configurations (apache user dir setups, spool directories of some MTA's, 
etc).

There are other minor issues, like metas/* appearing owned by the current uid 
and not the actual file owner, and not returning EACCES while changing rwx 
when you don't have permissions. Just silently ignoring the action.

Regards,
Filipe Almeida

--
Filipe Almeida <filipe@rnl.ist.utl.pt>
http://mega.ist.utl.pt/~filipe/

