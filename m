From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: 2 Terabyte install
Date: Tue, 11 May 2004 21:41:50 -0600
Message-ID: <20040512034150.GS9641@schnapps.adilger.int>
References: <409AC2FF.7080800@lindows.com> <1083917932.14089.281.camel@tribesman.namesys.com> <409BB690.6030604@namesys.com> <409BBDC9.3030809@lindows.com> <409FB387.8080804@namesys.com> <40A19147.4010703@lindows.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18625-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40A19147.4010703@lindows.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Clifford Beshers <clifford.beshers@lindows.com>
Cc: Hans Reiser <reiser@namesys.com>, Vladimir Saveliev <vs@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>, Vitaly Fertman <vitaly@namesys.com>

On May 11, 2004  19:51 -0700, Clifford Beshers wrote:
> Thanks for the help everyone.  In the end, it turned out that sfdisk is 
> indeed the culprit.  We created a 2.1T partition with fdisk, then asked 
> sfdisk for the size and it said: -92,xxx,xxx.  Unfortunately, this means 
> we have to either fix it or find an alternate solution to creating 
> partitions.  If the word ``parted'' is on the tip of your tongue  I'll 
> bet you haven't actually used the thing...
> 
> There were a few bugs of ours that acted as red herrings, but Linspire 
> is now up and running on this system with ReiserFS 3 and kernel 2.6.5.
> 
> While I'm here, I have some other questions:
> 
>    * What is the time complexity of mounting a ReiserFS partition?  It
>      seems to be proportional to the size of the partition?  Is it
>      different for Reiser4?

AFAIK, reiserfs will do the initial zeroing of the journal and filesystem
bitmaps at the first mount time instead of at mkreiserfs time.  I don't
know why it was done that way.

>    * Is there a tool to determine the type of file system on a
>      partition without mounting it?

Lots of them.  "file -s /dev/foo" or if you have a newer e2fsprogs (1.33
and newer I think) you can use "blkid [dev ...]" to tell you a bunch of
things about each device (LABEL, UUID, TYPE).

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

