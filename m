From: "Toomas Laasik" <t008@ut.ee>
Subject: History plugin in ReiserFS?
Date: Sun, 30 Oct 2005 20:50:05 +0200 (EET)
Message-ID: <52152.80.235.110.72.1130698205.squirrel@mailhost.ut.ee>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-26728-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

I was wondering if reiserfs has some sort of history plugin. I want a
filesystem that manages files similar to CVS or SVN so that I can say for
example that "I want asdasd.txt file exactly as it was on 15.10.2005
14:20:05" and I can get it. Of cource keeping that kind of "changelog"
takes much room on disk, but I assume one could set a percentage of disk
space for history and/or max days to keep history from.

It is one of my university projects to make this kind of filesystem or
modify some existing filesystem eg ReiserFS.

Any sugestions how to implement or where to start? Is something like that
made already? Do you think that extending ReiserFS would be a good option?
I searched Google trying to find some material about writing ReiserFS
plugins, but found very little useful. Maybe it's easier to start from
scratch? The goal is not to make production safe filesystem, but just
accomplish my task. Of cource if it is possible I would like that what I
do is useful not only to me but for others who might want something
similar too.

Thanks in advance,

Toomas

