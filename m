From: berthiaume_wayne@emc.com
Subject: RE: Error messages.
Date: Thu, 6 Mar 2003 09:32:21 -0500
Message-ID: <93F527C91A6ED411AFE10050040665D0049C07A8@CORPUSMX1>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13131-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andewid@tnonline.net
Cc: reiserfs-list@namesys.com

	Originally, I was -W0 with fsync(2) being used to insure data
integrity. I'm presently testing lk 2.4.19 + Namesys patches 1 thru 13 +
Chris Mason's write barrier patch with hdparm -W1 and fsync(2). Under this
configuration I don't see the problem you are encountering, but am
investigating data coruption on the ReiserFS partitions.

-----Original Message-----
From: Anders Widman [mailto:andewid@tnonline.net]
Sent: Thursday, March 06, 2003 9:20 AM
To: berthiaume_wayne@emc.com
Cc: reiserfs-list@namesys.com
Subject: Re: Error messages.


>         Anders, here is what I have and it works on thousands of duplicate
> servers:

> Tyan S2420 with 1.0GHz PIII
> 512MB RAM
> Promise PDC20269 in PCI1

Using PDC20268

> Intel Dual 10/100 NIC in PCI2
> Four Maxtor 250GB IDE drives off of the Promise controller
> lk 2.4.19 on RH7.3

> hdparm -a64 -K1 -W1 -u1 -m16 -c1 -d1 /dev/hd<x>

hm.. The big difference I see is -that I normally use -c3.


