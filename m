From: "darren" <teodarren@myrealbox.com>
Subject: RE: samba
Date: Sat, 5 Oct 2002 17:26:30 +0800
Message-ID: <000c01c26c51$4e1f7370$0101a8c0@bummer>
References: <5.1.1.6.2.20021006021931.031d5998@192.168.2.131>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11616-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5.1.1.6.2.20021006021931.031d5998@192.168.2.131>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: system_lists@nullzone.org, 'Gertjan Vinkesteijn' <gvink@xs4all.nl>, 'the filesystem' <reiserfs-list@namesys.com>

I am running Samba on Reiserfs 20GB hdd, Kernel 2.4.19.

I noticed that the performance is quite bad when you copy large amount
of files into or out of the "shared folder".

Top shows that Samba is taking up like 80% of the CPU time during the
transfer process.

-----Original Message-----
From: system_lists@nullzone.org [mailto:system_lists@nullzone.org] 
Sent: Sunday, October 06, 2002 8:21 AM
To: Gertjan Vinkesteijn; the filesystem
Subject: Re: [reiserfs-list] samba


Samba here in a 0+1 HW Raid of 4*80 GB IDE disks

At 08:18 05/10/2002 +0200, Gertjan Vinkesteijn wrote:
>Dear audience,
>
>Last year samba was not yet possible on reiserfs, it is on xfs from sgi

>though. Does anybody know if work has been done in that area? It would
be 
>very handy having (parts of) my 40GByte reiserfs filesystem letting
share 
>on our subnet with windows computers.
>
>Appreciate your thoughts
>
>--
>Gertjan Vinkesteijn
>mailto:gvink@xs4all.nl
>homepage: http://gershwin.xs4all.nl
>





