From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: reiserfs bug? ALSO Reiser4 bug!?
Date: Fri, 27 Aug 2004 20:45:55 +0300
Message-ID: <20040827174555.GB1284@nysv.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20923-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi

I set up a symlink /var/log -> /boot/log where /boot is a reiserfs
system. That was because Reiser4 lost log data when we were chasing the
last bug with VS.

Now the partition grew full and it was shown by my computer completely
locking up. Out of the blue. At least that's what I assume caused the
lock-up and the following.

On a reboot I got a trace on the screen from dmesg dying. Unfortunately
I can't use netconsole for some reason, but it was there.
Sometimes it boots but screams a lot that the logfiles are not found,
and for some reason /boot never mounted. 

That's mysterious because /boot must be mounted for the kernel to be
loaded, I don't have a copy in the mount point directory, but dmesg says
nothing about anything but Reiser4 being mounted on /

I don't frankly have the time now to reproduce this, it is somewhat
sporadic and I tried it too many times already. The system is a Debian
Sid (Unstable) and the command was
dmesg -s 524288 > /var/log/dmesg on a full reiserfs /var/log -> /boot/log
partition/directory.

Now that I got my system up, it did not mount /boot or /home/mjt, only /
and it also lost the host name. (none):/etc# is my prompt.

The filesystem is 128480 blocks with just as many used.

Hope this helps in any way!

PS.
Now that I kicked in a reboot, I'm getting:
reiser4[run-parts(2707)]: traverse_tree (fs/reiser4/search.c:755)[nikita-1481]:
WARNING: Too many iterations: 1048576

Where the iteration count varies. Warnings are usually not lethal, right?
But this seems to end never. Time for the sync-umount-reboot sysrq magic..

Thanks!

-- 
mjt

