From: Anders Widman <andewid@tnonline.net>
Subject: Sleeping harddrives?
Date: Sun, 2 Jun 2002 02:34:06 +0200
Message-ID: <19839880843.20020602023406@tnonline.net>
Reply-To: reiserfs-list@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10478-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


   How  would  ReiserFS  react  when  a user/program/anything tries to
   access a file on a harddrive that is spin down?

   I  remember that I tested this about a year ago, and it didn't work
   very well. The filesystem timeout was shorter than the time to spin
   up the drive.

   //Anders

