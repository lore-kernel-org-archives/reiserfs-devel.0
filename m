From: Sander <sander@humilis.net>
Subject: Re: 2.4.21 -> 2.4.25 cryptoloop mess
Date: Sun, 9 Jan 2005 13:42:36 +0100
Message-ID: <20050109124236.GB862@favonius>
References: <20050108144309.GA27949@favonius> <8944.1105265334@www26.gmx.net>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23097-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <8944.1105265334@www26.gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Danny Norging <norging@gmx.de>
Cc: reiserfs-list@namesys.com

Danny Norging wrote (ao):
> > >From your mail it seems you only made a copy after you already
> > >fsck'ed
> > (pun intended) the original image. Now this is your second mistake.
> > The first one: you didn't have (or seem to have had) backups.
> 
> Sad thing is when you even know all this, and it still happens to
> you... just didnt get to make a big backup (no dvd-burner at the
> time), it was planed, though :(

My experience is that backup to disk is cheaper. Especially if it is
meant as a recovery solution (because you through away old archives as
soon as the disk get full and thus re-use space). Dvd might be cheaper
for archiving, but they have a limited lifetime.

Disk is also faster, and you can have fully automated backups. A dvd you
have to change.

I have 1.1TB disk storage at the office for automated backups and sell
our disk-based remote backup/recovery solutions to other companies.

At the moment I consider dvd storage too small, but with the upcomming
50GB dvds this might change.


> > Did you mount the fs afterwards? Did you find any new content? What
> > reiserfscs version did you use?
> 
> No new content in the lost+found dir after the reiserfsck, which was
> version 3.6.17. I am just running a reiserfsck version 3.6.19 and will
> report on those results.

Please do. I'm interested in this and hope you will succeed.


> > > > > To: support@namesys.com
> > > > if you run reiserfsck --rebuild-tree on the device with the
> > > > wrong decryption you probably erase all the data on it. 
> > 
> > Isn't it more likely that reiserfsck in that case doesn't recognize
> > the filesystem at all and just exits with an error? (I'm just a user
> > though).
>
> Well, it was running for about a day, so it did something.

Yes, that is why I believe your hope is justified.

For example, if I try to run reiserfsck (with or without --rebuild-tree)
on my swapfile, it says:

Will read-only check consistency of the filesystem on /swapfile
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes

reiserfs_open: the reiserfs superblock cannot be found on /swapfile.
Failed to open the filesystem.

If the partition table has not been changed, and the partition is
valid  and  it really  contains  a reiserfs  partition,  then the
superblock  is corrupted and you need to run this utility with
--rebuild-sb.


If your device was decrypted not the right way, it would contain garbage
like a swapfile contains garbage to reiserfsck, right? Reiserfsck would
not have chewed on it for a day.


-- 
Humilis IT Services and Solutions
http://www.humilis.net
