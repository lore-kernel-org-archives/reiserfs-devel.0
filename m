From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: "df -i" support
Date: Fri, 14 May 2004 12:48:23 -0600
Message-ID: <20040514184823.GG18086@schnapps.adilger.int>
References: <20040513093432.52d3d7a3.turtle.power@wanadoo.es> <1084439945.14090.6209.camel@tribesman.namesys.com> <20040514173227.5b0541b5.turtle.power@wanadoo.es> <200405141655.i4EGtrAT007250@turing-police.cc.vt.edu> <20040514194040.22389128.turtle.power@wanadoo.es> <1084557009.3263.7.camel@localhost.localdomain> <20040514202627.18ddc7b2.turtle.power@wanadoo.es>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18701-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040514202627.18ddc7b2.turtle.power@wanadoo.es>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miguel <turtle.power@wanadoo.es>
Cc: Jonathan Briggs <jbriggs@esoft.com>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

On May 14, 2004  20:26 +0200, Miguel wrote:
> Jonathan Briggs <jbriggs@esoft.com> wrote:
> > Would this help you?
> > 
> > # cat /proc/fs/reiserfs/md1/oidmap
> > 
> > At the end of oidmap is a line like this:
> > total:  46 [46/972] used: 176147 [exact]
> > 
> > I think the used: 176147 is pretty close to what you want.  The number
> > goes up and down when I create or remove files.  When I ran 'find /
> > -xdev | wc -l' I got 174425.  I'm not sure where the extra 1,000+
> > comes from.  
> > 
> > You would need to have CONFIG_REISERFS_PROC_INFO set in your kernel,
> > and of course you would need to replace md1 with whatever device you
> > were using.
> 
> I can't set this kind of debuging in a production enviroment but those
> are the values that i'm seeking for. There's another way to get this?.

Hmm, why wouldn't reiserfs_statfs() just use that number for the "in use"
inodes in the first place?  Sadly, the statfs() interface is broken in
the sense that it contains "total" inodes and "free" inodes instead of
"in use" inodes, but it shouldn't be difficult to just subtract the
number of in-use inodes from 2^32-1 and stick that into the "free" field
so that when user-space does the reverse it gets the right number.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

