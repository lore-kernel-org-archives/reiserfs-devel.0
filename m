From: Anders Widman <andewid@tnonline.net>
Subject: Fsck over Telnet is slow.
Date: Fri, 31 May 2002 10:21:30 +0200
Message-ID: <1073646515.20020531102130@tnonline.net>
Reply-To: reiserfs-list@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10461-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


   Is  it just me, but I think reiserfsck is slow over telnet, or even
   slower   over  ssh. It seems as it would be better to not print the
   progress as fast, if the connection to the terminal is slow.

   Of course, I could use a log file instead.

   //Anders

