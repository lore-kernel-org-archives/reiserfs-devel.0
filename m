From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: How to break a reiserfs on Linux 2.4.20
Date: Tue, 14 Jan 2003 16:56:01 +0000 (UTC)
Message-ID: <b01ff1$sp0$1@genki.hungrycats.org>
References: <avprcs$bfi$1@satsuki.furryterror.org>
Return-path: <reiserfs-list-return-12334-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <avprcs$bfi$1@satsuki.furryterror.org>,
Zygo Blaxell <eazgwmir@umail.furryterror.org> wrote:
>I think I'm seeing a pattern of failure.  ...

And now I can reliably reproduce it.  It has nothing to do with MD,
linear, raid, SMP, or unclean shutdowns.

I can reproduce this bug on a plain IDE disk partition in about three
hours on Linux 2.4.20 (compiled for SMP but running on UP, full .config
and system details available on request).  My test system has about 4 gigs
under /etc, /usr, and /var, /dev/hdc2 is 25GB, and there is 1G of swap.




BEGIN cut-and-paste-into-a-root-shell

# Create an empty filesystem:

mkreiserfs -f -f /dev/hdc2
mount /dev/hdc2 /test
cd /test

# Script used to control the load average.  Note that as written the loops
# below will keep spawning new processes, so we need some way to throttle
# them.  Change the '-lt 10' to another number to change the number
# of processes.

cat <<'LC' > loadcheck && chmod 755 loadcheck
#!/bin/sh
read av1 av5 av15 rest < /proc/loadavg
echo -n "Load Average: $av1 ... "
av1=${av1%.*}
if [ $av1 -lt 10 ]; then
        echo OK
        exit 0
else
        echo "Whoa, Nellie!"
        exit 1
fi
LC

# Create directories used by test
mkdir foo bar

# Start up some rsyncs.  I use /etc, /usr, and /var because there's a 
# good mixture of files with some hardlinks between them, and on a normal
# Linux system some of them change from time to time.

while sleep 1m; do 
	./loadcheck || continue; 
	for x in usr etc var; do 
		rsync -avxHS --delete /$x/. foo/$x/. & 
	done; 
done &

# Start up some cp -al's and rm -rf's.  Note there are two concurrent
# sets of 'cp's and two concurrent sets of 'rm's, and each of those
# has different instances of 'cp' and 'rm' running at different times.
for x in  1 2; do
	while sleep 1m; do 
		./loadcheck || continue; 
		cp -al foo bar/`date +%s` & 
	done &
	while sleep 1m; do 
		./loadcheck || continue; 
		for x in bar/*; do 
			rm -rf $x; 
			sleep 1m; 
		done & 
	done &
done &

END cut-and-paste-into-a-root-shell




rm and occasionally cp will frequently complain about "No such file
or directory".  This is normal.  After about 3 hours, the following
non-normal messages appear:

readlink lib/R/library/base/help/contrasts: Permission denied
readlink lib/R/library/base/html/hsv.html: Permission denied
rm: cannot remove `bar/1042550428/usr/src/kernel-source-2.4.20-zb-586-smp/drivers/net/appletalk/ltpc.o': Permission denied
rm: cannot remove `bar/1042550428/usr/src/kernel-source-2.4.20-zb-586-smp/drivers/net/aironet4500_proc.c': Permission denied
cp: cannot stat `foo/usr/src/kernel-source-2.4.20-zb-586-smp/drivers/net/e1000/.e1000_ethtool.o.flags': Permission denied
cp: cannot stat `foo/usr/src/kernel-source-2.4.20-zb-586-smp/drivers/net/.eepro.o.flags': Permission denied

This needs a 'reiserfsck --fix-fixable' to fix.  

It looks to me like there may be some sort of locking bug triggered by
concurrent link/unlink/rename calls, but I'm not even a filesystem expert,
much less a reiserfs expert.  ;-)

-- 
Opinions expressed are my own, I don't speak for my employer, and all that.
Encrypted email preferred.  Go ahead, you know you want to.  ;-)
OpenPGP at work: 3528 A66A A62D 7ACE 7258 E561 E665 AA6F 263D 2C3D
