From: <doiggl@velocitynet.com.au>
Subject: how can I list out any replayed journal entries on startup in reiser4 filesystem
Date: Sat, 12 Feb 2011 11:33:32 +1100
Message-ID: <a97e8e36d46dfcf2ec71076c895a5d40@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello
Is there a way of listing out any replayed journal entries on startup in
reiser4 filesystem similar to what reiser3 does [1]?
Reiser4 mount point /dev/sdb /media/disk reiser4 defaults 0 0
Full /etc/fstab listing [2]

Thanks Glenn

[1]Reiser 3 shows output like the following if needed
Trans replayed: mountid 104, transid 45277, desc 2570, len 4, commit 2575,
next trans offset 2558
Trans replayed: mountid 104, transid 45278, desc 2576, len 2, commit 2579,
next trans offset 2562
Trans replayed: mountid 104, transid 45279, desc 2580, len 2, commit2583,
next trans offset 2566

[2] /etc/fstab content
/dev/disk/by-id/ata-CRUCIAL_CT64M225_P609410-MIBY-124A767-part4 swap      
         swap       defaults              0 0
/dev/disk/by-id/ata-CRUCIAL_CT64M225_P609410-MIBY-124A767-part2 /         
         reiserfs   acl,user_xattr        1 1

proc                 /proc                proc       defaults             
0 0
sysfs                /sys                 sysfs      noauto               
0 0
debugfs              /sys/kernel/debug    debugfs    noauto               
0 0
usbfs                /proc/bus/usb        usbfs      noauto               
0 0
devpts               /dev/pts             devpts     mode=0620,gid=5      
0 0
/dev/sdb /media/disk reiser4 defaults 0 0

