From: "Wolfgang Riedmann" <wolfgang@riedmann.it>
Subject: wait_buffer_until_released on Debian 3 i386 2.4.22
Date: Fri, 16 Jan 2004 13:53:27 +0100
Message-ID: <4007ECD7.13898.1E46ABD@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-16540-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-description: Mail message body
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I' m having a problem on a HP/Compaq ProLiant ML350 with a SmartArray 
641 RAID controller. Sometimes (the first time ten days ago, the 
second time yesterday eventing) a smbd process seems to provocate a 
wait_buffer_until_released error. The smbd process is taking 100% of 
the CPU, no Windows client can do anything, but sshd works so I can 
connect.

Unfortunately, I was not able to see the messages after the reboot. 
For the OS the drive is one big drive with about 100 G space....

Is there any patch or fix or something other I can do?

Thank you very much!

Wolfgang

