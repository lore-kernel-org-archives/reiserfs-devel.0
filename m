From: Shawn Rutledge <e_cloud@yahoo.com>
Subject: Re: Reiser4 kernel modules
Date: Sat, 6 Nov 2004 11:00:29 -0800 (PST)
Message-ID: <20041106190029.16253.qmail@web52807.mail.yahoo.com>
References: <1099299984.1712.82.camel@tribesman.namesys.com>
Reply-To: e_cloud@yahoo.com
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22289-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1099299984.1712.82.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reiser4 <reiserfs-list@namesys.com>


--- Vladimir Saveliev <vs@namesys.com> wrote:
> reiser4 needs some changes in kernel code.
> ftp://ftp.namesys.com/pub/reiser4-for-2.6.9 contains all things which
> are necessary to run reiser4 on 2.6.9

Right now I go there and find only two files:

ncftp /pub/reiser4-for-2.6.9 > ls -al
-rw-r--r--    1 0        0               0 Nov  2 18:40
reiser4-for-2.6.9-TEMPORARY_NOT_AVAILABLE
-rw-r--r--    1 0        0             454 Nov  2 15:24
reiser4-on-2.6.9-HOWTO

I also tried downloading the (huge) 2.6.9-mm patch from ftp.kernel.org.
 After I had applied it, to a vanilla 2.6.9 source tree, I couldn't
find Reiser4 anywhere under filesystems when doing a make config.  I
built it anyway with ReiserFS enabled, in case you didn't make it a
separate option but just merged it into the existing option, but I
cannot mount a Reiser4 partition.  So where should I expect to find
Reiser4 in the config menus?

I have been using an old Tyan dual-PII machine for a file server etc.
for years.  Lately I have gotten fed up with NFS problems and have
resorted to using it mostly as a machine to store backups from other
machines (via rsync usually) and my MP3 collection, and as my main home
web server.  It was stable with a 2.2 kernel, with all filesystems
being ReiserFS 3.  I got tired of not being able to run some newer
stuff (mainly fuser) and upgraded to Gentoo and used their 2.6.8
patched kernel, but now it crashes sometimes, typically every few days.
 Last time it crashed, 3 ReiserFS filesystems on one drive would no
longer mount.  I used reiserfsck and managed to recover quite a bit,
but on one of them, all the files ended up in lost+found.  (No biggie
with MP3's - there are programs that can re-organize them later.) 
These partitions were so hosed that I had to use --rebuild-sb and
--rebuild-tree.  I'm guessing this has something to do with the IDE
controller (as I had crashes with 2.4 kernels too - why I never
upgraded from 2.2) so with the next kernel I will try more conservative
settings (like leaving DMA turned off) and see if it becomes stable
again.  I did run badblocks for a full day (on the same kernel, no
less, which had crashed and done all the carnage) and it didn't crash
and didn't find any problems either.  Also ran the s.m.a.r.t. self
tests and didn't find any problems with the drive.  I'm not whining
(the issues are elsewhere than ReiserFS), but it's an interesting
experience with reiserfsck (it works reasonably well considering) and I
also wonder if Reiser4 will recover even better in cases like this.


=====
. _______  Shawn T. Rutledge / KB7PWD ecloud@bigfoot.com
 (_  | |_)    http://ecloud.org/  kb7pwd@kb7pwd.ampr.org
 __) | | \______________________________________________
