From: Rutger Swarts <ikkeswar@dds.nl>
Subject: Overwritten files
Date: Tue, 16 Apr 2002 10:53:25 +0200
Message-ID: <20020416105325.2a854a19.ikkeswar@dds.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10074-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list <reiserfs-list@namesys.com>


Hi all, 

I do not know if this is the right place to post this, but I can't think of any better place, so here goes:

I recently discovered that one of my files was overwritten somehow. It resides on a reiserfs partition which is mounted read-only. The contents of the file where overwritten with parts of other files on seemingly random places and bits of ASCII text.

Looking over it now I see it contains parts of win32 applications (strings like "This program can not be run in dos mode") and XML files. I do not know if there are any other files affected by this (quite a lot of files on that partition) but I will check each file before I backup. 

Now my question:

Is this a known issue? if yes: what can I do about it? if no: what information do you need to reproduce/solve this problem? (stop it from happening again, that is)

Rutger Swarts
