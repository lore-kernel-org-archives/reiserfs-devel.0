From: doiggl@velocitynet.com.au
Subject: Some bonnie++ test results on a reiser4 filesystem
Date: Wed, 16 Jul 2008 00:59:40 +1000 (EST)
Message-ID: <28835.202.168.22.19.1216133980.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello
Here are some tests i did with bonnie++
Glenn.

# bonnie++ -u root -d /reiser4
Using uid:0, gid:0.
Writing with putc()...done
Writing intelligently...done
Rewriting...done
Reading with getc()...done
Reading intelligently...done
start 'em...done...done...done...
Create files in sequential order...done.
Stat files in sequential order...done.
Delete files in sequential order...done.
Create files in random order...done.
Stat files in random order...done.
Delete files in random order...done.
Version 1.01d       ------Sequential Output------ --Sequential Input-
--Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block--
--Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP 
/sec %CP
test            16G 20829  23 23233  12 14092   6 38735  40 39265   7
122.0   0
                    ------Sequential Create------ --------Random
Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read---
-Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP 
/sec %CP
                 16 26414  99 +++++ +++ 21803 100 25668  99 +++++ +++
20072  99
test,16G,20829,23,23233,12,14092,6,38735,40,39265,7,122.0,0,16,26414,99,+++++,+++,21803,100,25668,99,+++++,+++,20072,99

