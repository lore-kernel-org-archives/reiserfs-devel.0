From: Anders Widman <andewid@tnonline.net>
Subject: Lost+Found
Date: Sun, 5 May 2002 20:57:05 +0200
Message-ID: <176050375.20020505205705@tnonline.net>
Reply-To: reiserfs-list@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10248-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


   Hello again =)

   With the release of Kernel 2.4.19-8 I hoped that my damaged
   filesystem, that was repaired with the reiserfs tools a while ago
   could be used.

   The problem was that it wasn't possible to change anything in the
   lost+found folder. If I tried to move or rename a file/folder the
   kernel would crash and a dump was printed.

   Now, with kernel 2.4.19-8 It seems as at least some folders are
   movable. However, some aren't and some strange errors occur. I do
   not get any crashes, or not even a error in /var/log/messages. The
   errors are that all files suddenly vanish from lost+found and I
   have to reboot to be able to even fsck. If I do not reboot I can
   still access and read all other folders, except lost+found.

   What can be wrong?

   //Anders

