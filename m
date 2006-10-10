From: Daniel Kasak <dkasak@nusconsulting.com.au>
Subject: Reiser4: Running out of room still causes corruption
Date: Tue, 10 Oct 2006 15:48:46 +1000
Message-ID: <452B343E.1020402@nusconsulting.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30023-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi all.

I'd had more problems with filesystem corruption after running out of space.

I was using 2.6.17-beyond-3, which has reiser4-for-2.6.17-3 merged in ( 
that's what they call it anyway ). I was compiling stuff when I ran out 
of room on my root partition. Unfortunately I rebooted in a panic ( 
after removing some stuff ) before it occured to me to copy down some 
output from dmesg. When I had rebooted ( luckily there was enough stuff 
intact to boot and to compile ) I got mysterious 'bus error' messages 
when using portage ( which uses python ). I ran fsck.resier4 and found 
that quite a decent number of files indeed ( including some stuff that 
python wanted ) were damaged. They got removed by fsck.resier4. I then 
dodgied things up sufficiently to fix python ( copied .so files from a 
previous version of python ), and incredibly was able to rebuild all the 
rest of the damaged stuff.

So anyway ... sorry I don't have any kernel message output stuff, but I 
think someone needs to revisit what happens when there is no room left 
on a reiser4 partition.

-- 
Daniel Kasak
IT Developer
NUS Consulting Group
Level 5, 77 Pacific Highway
North Sydney, NSW, Australia 2060
T: (+61) 2 9922-7676 / F: (+61) 2 9922 7989
email: dkasak@nusconsulting.com.au
website: http://www.nusconsulting.com.au
