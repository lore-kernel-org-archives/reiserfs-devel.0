From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: can't find a reiserfs file ssytem! 2
Date: Wed, 17 Mar 2004 20:15:11 +0300
Message-ID: <200403172015.11781.vitaly@namesys.com>
References: <20040317140309.ABECF3982E7@ws5-1.us4.outblaze.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17270-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040317140309.ABECF3982E7@ws5-1.us4.outblaze.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mite pascoff <ttl@linuxmail.org>, Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On Wednesday 17 March 2004 17:03, mite pascoff wrote:
> Ok I did what you sad but some problems accur:
> > create a copy of that partition on spare device
> > dd if=problemdevice of=sparedevice
>
> my problem partition is 15GB large and dd stoped after copying 2GB of data
> with a messige like: File size limit exceeded

what fs do you copy the partition to?

> So I began testing this part/image of the problem partition

do you want to recover only first 2G of your data?

> > get the latest reiserfsprogs
> > (ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.13.tar.gz)
>
> did that
>
> > reiserfsck --rebuild-sb sparedevice
> > reiserfsck --rebuild-tree sparedevice
>
> did that too
>
> > Lets us know the result
>
> A LOT of messages came out and after --rebuild-sb and --rebuild-tree
> reiserfsck --check reports that "No corruptions found" ... but now I cant
> mount this imige file ... the command I try is "mount -t reiserfs
> image.file /mnt/test -o loop" even -o loop=/dev/loop[0-3] ... mount exits
> with the usual error and nothing happens ... so what should I do now ...

what do you see in the syslog related to this mount failure?
could you prepare the metadata of _this_ spare device with:
    debugreiserfs -p sparedevice | bzip2 -c > sparedevice_meta.bz2
and provide it for downloading ?

what kernel do you use?

> perform these actions on the problem partition or to find a way to mount
> the image.file and see if aeverything is OK there ?

-- 
Thanks,
Vitaly Fertman


