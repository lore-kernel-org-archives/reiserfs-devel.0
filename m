From: Heinz-Josef Claes <hjclaes@web.de>
Subject: Re: duplicate files and recent changes
Date: 09 Jun 2002 16:30:54 +0200
Message-ID: <1023633054.1039.21.camel@kakapo>
References: <Pine.WNT.4.43.0206060127230.1296-100000@fanatic>
	<1023440037.971.6.camel@kakapo> <20020608125053.GA11270@blueyonder.co.uk>
	<3D01FCFF.7020307@namesys.com>  <3D0200CF.1050604@swelltech.com> 
	<1023625034.1041.10.camel@kakapo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10692-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1023625034.1041.10.camel@kakapo>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Dr. Heinz-Josef Claes" <hjclaes@web.de>
Cc: Joe Cooper <joe@swelltech.com>, Hans Reiser <reiser@namesys.com>, Debian User <mtoseland@blueyonder.co.uk>, reiserfs-list@namesys.com

Am Son, 2002-06-09 um 14.17 schrieb Heinz-Josef Claes:
> Am Sam, 2002-06-08 um 15.04 schrieb Joe Cooper:
> > Hans Reiser wrote:
> >  > Debian User wrote:
> >  >
> >  >> On Fri, Jun 07, 2002 at 10:53:57AM +0200, Heinz-Josef Claes wrote:
> >  >>
> >  >>
> >  >>>
> >  >>> But I've written a well tested tool for backing up directories on
> >  >>>  another disk which uses md5 sums to recognize same files (even
> >  >>> in one backup) and hard links them. By this way, it combines the
> >  >>> advantages of full and incremental backup. It also uses
> >  >>> compression and has a lot of other options and optimisations. It
> >  >>> runs best with reiserfs, because reiserfs has no preconfigured
> >  >>> number of inodes and is fast with hard linking. So, if you need
> >  >>> to backup, try http://sourceforge.net/projects/storebackup
> >  >>>
> >  >>
> >  > Would anyone care to check this tool out, and post a review?
> >  >
> >  > Hans
> > 
> > Not to discount the work Heinz-Josef has done, but rdiff-backup may be a 
> > better way to achieve a similar goal.  It does not have the benefit of 
> > being "best with reiserfs" but it works great on ReiserFS partitions (as 
> > well as ext2/3 and probably anything else).
> > 
> > http://www.stanford.edu/~bescoto/rdiff-backup/
> > 
> > Binary diffs are fun.  I'd be surprised if an MD5/hardlink system could 
> > match it for compression of increments over time, or beat the 
> > flexibility of being able to keep potentially weeks or months worth of 
> > daily diffs in a very small space.  I may be wrong, of course.  But 
> > rdiff-backup is working great for me.
In a real world case, a backup for 30 days from monday to friday and 60
days for fridays was smaller than the source tree (compressed with
bzip2). But that depends on two factors:
- are there changes in many files?
- how many users share the same files (they are also hard linked). We
also mirrored the user data of laptops with rsync and than used
storebackup. You will not belief, how many same files the have.
The "real world" case has about 1.4 millon files/directories with about
40 GB. There were not too much changes, so it may be different in
another case.

> > -- 
> > Joe Cooper <joe@swelltech.com>
> > Web caching appliances and support.
> > http://www.swelltech.com
> > 
> It depends on what you want to do. If you want backup big files
> with only some changes in it (eg. vmware), you can simply forget
> my tool.
> But if you have "normal" user files, you have the possiblity to backup
> them with the following advantages:
> - reduced space (because of compression) [from my understanding rdiff
> cannot do this, but I don't really know]
> - every backup is a full backup (because of hard links). That means,
> you can delete whatever backup you want (A future version will be able
> to delete parts of an old backup for different livetime). So the tool
> has features to delete special week days of old backups (and others).
> [with rdiff, you have deltas, which should make the world much more
> complicated]
> - users can access there backups directly via the filesystem, eg. using
> NFS or SAMBA or whatever. This helps to reduce administrational overhead
> a lot.
> 
> (The principal idea came from the snapshot of netapp files, but it's not
> implemented on the filesystem level and has a different behaviour. Only
> for the user, it's seems to be a little similar.)
Sorry for the typo, naturally it's netapps filers (Network Appliance)
> 
> So, rdiff is another solution for the same problems with different
> advantages and disadvantages ;-)
> 
> Regards,
> Heinz-Josef
> 
> 
> 
> 



