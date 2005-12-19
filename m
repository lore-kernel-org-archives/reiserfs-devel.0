From: Linux Tard <linuxtard@yahoo.com>
Subject: Trying to mount ReiserFS file system read only results in change
Date: Sun, 18 Dec 2005 16:37:16 -0800 (PST)
Message-ID: <20051219003716.25457.qmail@web34605.mail.mud.yahoo.com>
References: <43A27033.1060109@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-27428-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43A27033.1060109@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I'm trying to mount a ReiserFS file system read only
from a SATA drive.  Unfortunately the mount results in
a change to the file system (the journal count is
incremented?).  

Is there a way to mount a ReiserFS file system truly
read only, such that *no* changes occur (IE, the
authentication, MD5/SHA1 matches pre and post
mounting)?

Perhaps an undocumented mount option?  Or are we
forced to change the mount_id increment in the
journal.c code to '0'?  IF we change this code, how
dangerous is this?

kind regards,
-lt


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
