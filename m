From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: can't find a reiserfs file ssytem! 3.b
Date: Thu, 18 Mar 2004 11:18:00 +0300
Message-ID: <1079597880.2209.35.camel@tribesman.namesys.com>
References: <20040317145013.B6D3B3982E7@ws5-1.us4.outblaze.com>
	 <1079545118.2579.17.camel@wraith.lrp.advansoft.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17292-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1079545118.2579.17.camel@wraith.lrp.advansoft.us>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: lamont@gurulabs.com
Cc: reiserfs-list@namesys.com

On Wed, 2004-03-17 at 20:38, Lamont R. Peterson wrote:
> On Wed, 2004-03-17 at 07:50, mite pascoff wrote:
> > > do you want to recover only first 2G of your data?
> > 
> > NO thats because dd could copy only 2GB af data and stops ... I want to recover the whole 15GB partition
> 
> This is not because of dd; from other messages, I think you are
> indicating that you have mounted the destination space via NFS.  With
> NFS v3 you can only write files across the network up to 2^32-1 bytes in
> length (IIRC).  To get around this, you could do something like this:
> 
> dd if=/dev/bad_part of=/nfs/mount/point/partition_1 bs=1024
> count=2097152
> 
> dd if=/dev/bad_part of=/nfs/mount/point/partition_2 bs=1024
> count=2097152 seek=2097153
> 

This should be seek=2097152

> ...and so on, until you have the files for all.  You should also check
> my math (I just threw this up from memory to illustrate the concept) and
> be sure that you can get these files built right.  If nfs causes too
> much trouble, you could create these files on the 5GB partition and then
> use scp to move them over the network.
> 
> You should be able to use cat to append them one onto the other and
> fully reconstruct the partition image.

