From: "Patrick.Le-Dot@bull.net" <Patrick.Le-Dot@bull.net>
Subject: SetPageReferenced usage
Date: Fri, 14 May 2004 13:31:54 +0200
Message-ID: <200405141131.NAA159118@alpha12.frec.bull.fr>
Return-path: <reiserfs-list-return-18679-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


Hi list,

I'm interested to understand why fs/reiserfs/file.c use SetPageReferenced
instead of the mark_page_accessed function (like in all others FS) ?

Thanks to reply to me directly as I'm not on the list.
Patrick
