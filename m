From: Andrew Heberle <heberle@westnet.com.au>
Subject: Re: Error message - vs-13070
Date: Sun, 16 Feb 2003 20:39:56 +0800
Message-ID: <5.2.0.9.0.20030216203350.018dd7d8@mail.bogus.home>
References: <5.2.0.9.0.20030215000534.018ed008@mail.bogus.home>
 <5.2.0.9.0.20030215000534.018ed008@mail.bogus.home>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12780-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030214193950.A27507@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com


>What kernel is that?
>Were there any other messages around this one in logs? (not necessary reiserfs
>related)

It is the latest gentoo-sources kernel, which is based on 2.4.19 I think, 
although Gentoo kernel's
have a number of extras added in them, along with a number of fixes not 
found in the mainline kernel.


>We cannot tell without those extra messages.
>You can execute 'dmesg' and find out what is there in addition to
>those vs-13070

The following errors show up in the kernel logs at the time:

hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hda: dma_intr: error=0x40 { UncorrectableError }, LBAsect=6599945, 
sector=4286584
end_request: I/O error, dev 03:03 (hda), sector 4286584

These errors look to me like a hardware problem (bad sector on the drive).

Definately not a reiserfs problem, thanks for the reply Oleg.

--
Andrew Heberle

