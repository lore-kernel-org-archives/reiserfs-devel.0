From: Mathieu Belanger <m@thieu.so>
Subject: Issue in my API re-implementation in my kernel 3.11
Date: Sat, 21 Sep 2013 03:18:21 +0000
Message-ID: <20130921031821.Horde.7huC_KAbvhnsxkwHkVoEVg2@mail.thieu.so>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="Yes"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

In my kernel 3.11 on my git, I have re-implemented an API because I  
did not know how to port the reiser4 to the new API (readdir ->  
iterate).

I did not get any problem with reiser4 or reiserfs -but- after  
installing the 3.12-rc1 kernel and rebooting, the kernel was missing  
and the grub.conf was total garbage. The /boot is EXT2 on my system.

readdir is for reading dir mostly, I don't know if it's the cause of  
the corruption or if it did not sync properly but still, if you want  
to play with a ext2 partition and you use the kernel 3.11 from my git,  
reboot to another kernel before, just as precaution.

The kernel 3.12-rc1 is not affected if it's because of that readdir  
API reimplementation because it's based on the Ivan port + shrinker  
new API patchs for reiser4.
