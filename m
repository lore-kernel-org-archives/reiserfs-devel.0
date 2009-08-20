From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13556] Random oopses
Date: Thu, 20 Aug 2009 09:00:03 GMT
Message-ID: <200908200900.n7K903Bw023675@demeter.kernel.org>
References: <bug-13556-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-13556-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13556





--- Comment #3 from Michael Uleysky <uleysky@gmail.com>  2009-08-20 09:00:00 ---
I have three reiserfs mounts (may be more, if needed) on /usr, /var and /home.
This is output of mount:
rootfs on / type rootfs (rw)
/dev/root on / type ext2 (ro,relatime,errors=continue)
none on /tmp type tmpfs (rw,nosuid,nodev,relatime,size=2097152k)
proc on /proc type proc (rw,relatime)
none on /dev type tmpfs (rw,nosuid,relatime,size=1024k)
none on /sys type sysfs (rw,relatime)
none on /dev/pts type devpts (rw,nosuid,noexec,relatime,mode=620)
usbfs on /proc/bus/usb type usbfs (rw,relatime)
none on /proc/fs/nfsd type nfsd (rw,relatime)
/dev/sdb6 on /usr type reiserfs (ro,nodev,noatime)
/dev/sdb5 on /var type reiserfs (rw,nosuid,nodev,relatime,data=journal)
/dev/sdb8 on /home type reiserfs (rw,nosuid,nodev,relatime,data=journal)
/dev/sdb7 on /home/common/cluster type ext2 (rw,noatime,errors=continue)
configfs on /config type configfs (rw,relatime)

I run kernel compilation on all three filesystems. On /var and /home crashes
always happens after some time of compilation, but on /usr kernel compiles
normally. Directories with sources was
{/home/root/Kernels,/usr/local,/var}/linux-2.6.30. Running kernel was 2.6.30.5.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
