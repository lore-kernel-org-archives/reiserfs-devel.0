From: Isaac Chanin <chanin@WPI.EDU>
Subject: AMD64/Reiser4 testing and problems
Date: Thu, 02 Dec 2004 18:13:39 -0500
Message-ID: <41AFA1A3.1040509@wpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22657-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

I did some testing with Resier4 on AMD and was wondering if perhaps 
debug information or anything on this could help with getting Resier4 
stable and working on AMD64.

I have read that if AMD would give an AMD64 cpu that would be a big 
help, but it doesn't seem inheriantly impossible to fix the problem from 
error reports and such.

Anyways, here are the results for my testing.  I used a mm 2.6.10-rc2 
kernel and the filesystem was in a file mounted by loopback.

http://users.wpi.edu/~chanin/r4log.txt

The commands I tried were as follows:
(r4 was a 512mb file made by dd)
mount -o loop /root/r4 /root/r4dir (worked)
df -h (worked)
cd /root/r4 (worked)
ls (worked)
ls -la (worked)
mkdir linux (worked)
cp -r /usr/src/linux linux (worked, but the program hung at the end, 
kill -9 had no effect)
ls (worked, but the program hung at the end, kill -9 had no effect)
cd /root/r4 (no output, program crashed immediately)


Thanks for taking the time to read over the problems - and if there's 
anymore testing I could do or whatnot just ask; and, thanks for making 
what will (hopefully) soon be the fastest file system to work on my 
computer!
