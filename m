From: Rajeev Arora <rajeev_aurora@yahoo.com>
Subject: extending dir entry
Date: Mon, 27 Jan 2003 18:15:04 -0800 (PST)
Message-ID: <20030128021504.39790.qmail@web20514.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12522-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,
I am trying to expand the directory entry struct
(reiserfs_de_head) in order to put some fast
attributes to be used by my backup application.
After modifying both definitions of reiserfs_de_head
in the FS code and reiserfsprogs, I am unable to
create a new entry in the directory. I cause something
to go wrong in leaf_paste_entries().

I would appreciate if someone can tell me if I am
totally missing something obvious. In short, what do I
need to do to stuff 8 bytes in the dir. entry?

TIA,
Raj

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
