From: Szakacsits Szabolcs <szaka@sienet.hu>
Subject: Re: Re: Formatted over NTFS
Date: Thu, 4 Mar 2004 11:50:56 +0100 (MET)
Message-ID: <Pine.LNX.4.21.0403041121140.25854-100000@mlf.linux.rulez.org>
References: <20040304084219.NOLN5247.out014.verizon.net@outgoing.verizon.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17075-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040304084219.NOLN5247.out014.verizon.net@outgoing.verizon.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gmartyn@verizon.net
Cc: reiserfs-list@namesys.com


On Thu, 4 Mar 2004 gmartyn@verizon.net wrote:
> Find a program like Easy Recovery Professional. It will recover anything, 
> unless the place on disk that the file was stored has been completely written 
> over. It will recover files from NTFS even if both the MFT and the backup MFT 
> have been destroyed. Unfortunately it's also expensive as hell. Retail is 
> $1,500. The lite version is $89, but only recovers 25 files at a time. 

There are free tools doing the same. Search sourceforge, freshmeat, etc.

It could be also coded (probably in some hours) using libntfs from
ntfsprogs, most needed code is already there.

	Szaka

