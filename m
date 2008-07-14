From: doiggl@velocitynet.com.au
Subject: 1 big file copy and removal timing.
Date: Tue, 15 Jul 2008 00:40:45 +1000 (EST)
Message-ID: <13998.202.168.22.19.1216046445.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Here is my timing on copying and removing 1 big file on a reiser4
partition. The Reiser4 partition is a separate Sata type disk.

Observation: The removal took some time. I was surprised about the time
taken to remove the file.
Glenn

# time cp /tmp/openSUSE-11.0-DVD-x86_64.iso .

real    1m37.936s
user    0m0.048s
sys     0m13.969s

# ll openSUSE-11.0-DVD-x86_64.iso
-rw-r--r-- 1 root root 4651712512 Jun 19 23:04

# time rm openSUSE-11.0-DVD-x86_64.iso

real    4m24.826s
user    0m0.000s
sys     0m46.571s


