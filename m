From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: "df -i" support
Date: Fri, 14 May 2004 21:56:17 +0400
Message-ID: <16549.2113.605523.340611@laputa.namesys.com>
References: <20040513093432.52d3d7a3.turtle.power@wanadoo.es>
	<1084439945.14090.6209.camel@tribesman.namesys.com>
	<20040514173227.5b0541b5.turtle.power@wanadoo.es>
	<200405141655.i4EGtrAT007250@turing-police.cc.vt.edu>
	<20040514194040.22389128.turtle.power@wanadoo.es>
	<1084557009.3263.7.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18697-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1084557009.3263.7.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: Miguel <turtle.power@wanadoo.es>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Jonathan Briggs writes:
 > On Fri, 2004-05-14 at 11:40, Miguel wrote:
 > > On Fri, 14 May 2004 12:55:53 -0400
 > > Valdis.Kletnieks@vt.edu wrote:
 > > 
 > > > On Fri, 14 May 2004 17:32:27 +0200, Miguel said:
 > > > 
 > > > > We are migrating our mtas from ext3 to reiserfs and the
 > > > > monitorization(a plugin) relies on the output of df -i, this output
 > > > > is very diferent between those filesystems, because reiserfs always
 > > > > return -1 as a total number of inodes.
 > > > 
 > > > The only reason you care about df -i is because on ext[23] and
 > > > similar, it is possible to run out of inodes before you run out of
 > > > files.  Since reiserfs allocates inodes as needed, you can't run out
 > > > of them unless you run out of space - in which case your monitoring
 > > > system should be flagging that.
 > > 
 > > No, we check this value to know how many files are in that
 > > partition (well an aproximation). I hope that this is true for ext2/3,
 > > isn't?
 > > 
 > 
 > Would this help you?
 > 
 > # cat /proc/fs/reiserfs/md1/oidmap
 > 
 > At the end of oidmap is a line like this:
 > total:  46 [46/972] used: 176147 [exact]
 > 
 > I think the used: 176147 is pretty close to what you want.  The number

Yes, it is. On the other hand, oidmap can "overflow", then only
estimated number of files will be shown.

 > goes up and down when I create or remove files.  When I ran 'find /
 > -xdev | wc -l' I got 174425.  I'm not sure where the extra 1,000+ comes
 > from.  

"find | wc -l" returns number of _names_ rather than files. I.e.,
hard-linked files are counter more than once.

 > 
 > You would need to have CONFIG_REISERFS_PROC_INFO set in your kernel, and
 > of course you would need to replace md1 with whatever device you were
 > using.
 > -- 
 > Jonathan Briggs
 > jbriggs@esoft.com
 > 

Nikita.
