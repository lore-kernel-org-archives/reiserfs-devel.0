From: Job Bob <yzhang2004@yahoo.com>
Subject: programs hang
Date: Sat, 14 Aug 2004 10:23:21 -0700 (PDT)
Message-ID: <20040814172321.70248.qmail@web50903.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20289-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

  Hi. I have recently started using reiser4 as the
primary file system for my laptop. Everything has been
fine so far except for the following problems:

1. When using the rpm command with certain operations
(I think with -i or -e), the program hangs
indefinitly.
This problem goes away when /var/lib/rpm is not on a
reiser4 file system.

2. Half Life also hangs indefinitly at the command
line with the command wine hl.exe. It was working
before
when I had it on an ext3 file system.

Any ideas on what the problem is. If so, when might
they
be fixed?
                                   Thanks for any
help,
                                           Yale

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
