From: Antonie Nygma <darkenigma80@yahoo.com>
Subject: mounting reiserfs from win98
Date: Fri, 16 Aug 2002 20:46:45 -0700 (PDT)
Message-ID: <20020817034645.7861.qmail@web21402.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11217-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

hi!

i recently reformatted all my linux
(reiserfs)partitions on a dual-boot hdd, leaving only
the /home partition intact. during fresh installation
it stalled and i'd like to backup some files in /home
to win98 partition so i can remove the old partitions
& re-created them again.

consulting filesystems HOWTO, i found some tools
(LTOOLS) that could mount linux FS (ext2fs)
transparently from win9x, but it doesn't work properly
(gives error like: bad magic number). i suspect this
is because i use reiserfs instead.

i'm not sure whether further works are being done for
LTOOLS; and i'm interested to make it work for
reiserfs. is there any other tools that have already
been written to do this?

thanks,
antonie

__________________________________________________
Do You Yahoo!?
HotJobs - Search Thousands of New Jobs
http://www.hotjobs.com
