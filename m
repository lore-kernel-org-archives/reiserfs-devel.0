From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Confusing modification time changes
Date: Wed, 16 Jun 2004 15:08:21 -0600
Message-ID: <1087420100.21692.36.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19218-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

I am using Reiser4 from the March snapshot, which is still the last
snapshot that I know of meant for testing by regular folks.  Please
correct me if I'm wrong about that.  

Anyway, maybe this has been fixed since then.  What are the steps to
update to the latest stuff?

Here's the problem.  I'm seeing some strange things with file
modification times and gcc, and it messes up my kernel builds.  Here's
an example:

[jbriggs@oberon 14:56:14 (0) /home/linux/linux-2.6.7]
$ stat init/main.c
  File: `init/main.c'
  Size: 15846           Blocks: 31         IO Block: 65536  regular file
Device: 902h/2306d      Inode: 1141588     Links: 1
Access: (0644/-rw-r--r--)  Uid: (  500/ jbriggs)   Gid: (  500/ jbriggs)
Access: 2004-06-16 14:09:51.348205000 -0600
Modify: 2004-06-16 14:47:50.083785360 -0600
Change: 2004-06-16 14:47:50.083785360 -0600
[jbriggs@oberon 14:57:33 (0) /home/linux/linux-2.6.7]
$ gcc init/main.c >& /dev/null
[jbriggs@oberon 14:57:42 (1) /home/linux/linux-2.6.7]
$ stat init/main.c
  File: `init/main.c'
  Size: 15846           Blocks: 31         IO Block: 65536  regular file
Device: 902h/2306d      Inode: 1141588     Links: 1
Access: (0644/-rw-r--r--)  Uid: (  500/ jbriggs)   Gid: (  500/ jbriggs)
Access: 2004-06-16 14:09:51.348205000 -0600
Modify: 2004-06-16 14:57:42.143778560 -0600
Change: 2004-06-16 14:57:42.143778560 -0600

As you can see, init/main.c got a new modification time.  Now watch this:

[jbriggs@oberon 14:56:58 (1) ~/working/javabench/bin/cpp/athlon-xp]
$ stat ackermann.cpp
  File: `ackermann.cpp'
  Size: 853             Blocks: 2          IO Block: 65536  regular file
Device: 902h/2306d      Inode: 1052413     Links: 1
Access: (0644/-rw-r--r--)  Uid: (  500/ jbriggs)   Gid: (  500/ jbriggs)
Access: 2004-06-15 18:30:07.564976512 -0600
Modify: 2004-06-15 18:30:07.564976512 -0600
Change: 2004-06-15 18:30:07.564976512 -0600
[jbriggs@oberon 14:57:01 (0) ~/working/javabench/bin/cpp/athlon-xp]
$ gcc ackermann.cpp >& /dev/null
[jbriggs@oberon 14:58:03 (1) ~/working/javabench/bin/cpp/athlon-xp]
$ stat ackermann.cpp
  File: `ackermann.cpp'
  Size: 853             Blocks: 2          IO Block: 65536  regular file
Device: 902h/2306d      Inode: 1052413     Links: 1
Access: (0644/-rw-r--r--)  Uid: (  500/ jbriggs)   Gid: (  500/ jbriggs)
Access: 2004-06-15 18:30:07.564976512 -0600
Modify: 2004-06-15 18:30:07.564976512 -0600
Change: 2004-06-15 18:30:07.564976512 -0600
[jbriggs@oberon 14:58:04 (0) ~/working/javabench/bin/cpp/athlon-xp]

Here, gcc did not update the modification date.

Both files are under /home which is the same Reiser4 filesystem for both
of them.  Why the difference in behavior?  The sd plugin is the same for
both files:
[jbriggs@oberon 15:04:40 (0) /home/linux/linux-2.6.7]
$ cat init/main.c/metas/plugin/sd
0 sd stat-data

[jbriggs@oberon 15:05:06 (0) ~/working/javabench/bin/cpp/athlon-xp]
$ cat ackermann.cpp/metas/plugin/sd
0 sd stat-data

I'm sure I'm missing something, but what?
-- 
Jonathan Briggs
jbriggs@esoft.com

