From: Anders Widman <andewid@tnonline.net>
Subject: Re: Error messages.
Date: Thu, 6 Mar 2003 15:20:25 +0100
Message-ID: <1597951187.20030306152025@tnonline.net>
References: <93F527C91A6ED411AFE10050040665D0049C07A5@CORPUSMX1>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13129-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <93F527C91A6ED411AFE10050040665D0049C07A5@CORPUSMX1>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: berthiaume_wayne@emc.com
Cc: reiserfs-list@namesys.com

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



