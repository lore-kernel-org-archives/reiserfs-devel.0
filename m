From: Ivar Bergman <ivarbergman@yahoo.com>
Subject: Beginner questions about meta data and plugins
Date: Thu, 1 Apr 2004 07:08:00 -0800 (PST)
Message-ID: <20040401150800.68309.qmail@web10005.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17643-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


Hi all!

Over the last weeks I have been experementing with 
Reiser4, so far I have managed to build the kernel,
created a mountable Reiser4 partition, and played
around with the file system via the shell. 

To learn how Reiser4 work, I planed to implement the
following two programs:

1, Write a simple C program that list the value of a 
   specific file meta data. Like the way you can list 

   the value of a attibute by using cat.

   cat myfile/..pseudo

2, Write a simple plugin that adds a new file 
   attribute.

I tried to read the kernel source code for help, but I
guess it was a bit to much for me. So, does anybody
have some source code that could help me on the way,
or perhaps point out some part of the resier4 kernel 
source code that could be helpfull.

Some general quiestion about plugins: 

 o Does a file belong to one plugin only, or does it 
   have a list of plugins?
 
 o Can I, as a plugin writer, introduce new operations

   on a file? In other words extend the file
interface.
   And if that is possible, how do I invoke that   
   operation from a C program?

Best regards
Ivar Bergman


__________________________________
Do you Yahoo!?
Yahoo! Small Business $15K Web Design Giveaway 
http://promotions.yahoo.com/design_giveaway/
