From: Adrian Phillips <a.phillips@dnmi.no>
Subject: reiserfs_file_write: item has been moved
Date: 02 Apr 2002 08:29:22 +0200
Sender: "Adrian Phillips,,," <a.phillips@dnmi.no>
Message-ID: <wvhemubol9.fsf@freeze.oslo.dnmi.no>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


I got one of these in my logs :-

kernel: reiserfs_file_write: item has been moved while we were in copy_from_user (appending to the direct item)

No other messages in the kern.log, using :-

Linux dusk 2.2.20pre2 #1 Tue Jun 26 11:50:29 CEST 2001 i686 unknown

linux-2.2.19-reiserfs-3.5.34-patch.bz2
linux-2.2.19-reiserfs-3.5.32-buffer-300.patch
linux-2.2.18-rawio.patch  # For LVM
lvm-1.0.1-2.2.20.patch
ide.2.2.19.05042001.patch.bz2 # New IDE for 2.2
max_tasks.patch  # Increases max_tasks to 2048

I couldn't find this mentioned in google, but is this a warning,
serious ?

Thanks for any help,

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
