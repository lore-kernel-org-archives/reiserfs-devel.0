From: "mite pascoff" <ttl@linuxmail.org>
Subject: Re: can't find a reiserfs file ssytem! 3.b
Date: Wed, 17 Mar 2004 16:50:13 +0200
Message-ID: <20040317145013.B6D3B3982E7@ws5-1.us4.outblaze.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17274-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com


----- Original Message -----
From: Vitaly Fertman <vitaly@namesys.com>
Date: Wed, 17 Mar 2004 20:15:11 +0300
To: "mite pascoff" <ttl@linuxmail.org>,"Vladimir Saveliev" <vs@namesys.com>
Subject: Re: can't find a reiserfs file ssytem! 2


> > my problem partition is 15GB large and dd stoped after copying 2GB of data
> > with a messige like: File size limit exceeded
> 
> what fs do you copy the partition to?

FAT32 is the WinXP parttiion I use through the network

> 
> > So I began testing this part/image of the problem partition
> 
> do you want to recover only first 2G of your data?

NO thats because dd could copy only 2GB af data and stops ... I want to recover the whole 15GB partition


> what do you see in the syslog related to this mount failure?

This is what "says" syslog when I try to mount the 2GB image.file of the problem partition:
Mar 17 16:27:37 ttl kernel: reiserfs: checking transaction log (device 07:00) ...
Mar 17 16:27:37 ttl kernel: reiserfs: journal-837: IO error during journal replay
Mar 17 16:27:37 ttl kernel: Replay Failure, unable to mount
Mar 17 16:27:37 ttl kernel: reiserfs_read_super: unable to initialize journal space

> could you prepare the metadata of _this_ spare device with:
>     debugreiserfs -p sparedevice | bzip2 -c > sparedevice_meta.bz2
> and provide it for downloading ?

What device do you mean? I use a spare free space on a harddrive on a pc through the network which runs WinXP ...
 
> what kernel do you use?

2.4.18 / Slackware8.1


-- 
______________________________________________
Check out the latest SMS services @ http://www.linuxmail.org 
This allows you to send and receive SMS through your mailbox.


Powered by Outblaze
