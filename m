From: Alexander Lyamin <flx@msu.ru>
Subject: Re: Newbiw question on write barriers and ordered write barriers
Date: Tue, 2 Sep 2003 15:48:48 +0400
Message-ID: <20030902154848.A8083@t-raenon.nmd.msu.ru>
References: <000501c370c4$94165ba0$fe0aa8c0@lancaster.beardandsandals.co.uk>
Reply-To: flx@msu.ru
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15509-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <000501c370c4$94165ba0$fe0aa8c0@lancaster.beardandsandals.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roger James <rogerjames99@btinternet.com>
Cc: reiserfs-list@namesys.com

Mon, Sep 01, 2003 at 09:06:37PM +0100, Roger James wrote:
> Hi,
> 
>  
> 
> Ever since I updated my SuSE Linux 8.1 set up with the latest patches
> from SuSE I have been seeing the following messages at boot up time
> (once only for each drive).
> 
>  
> 
> <4>hda: drive_cmd: status=0x51 { DriveReady SeekComplete Error }
> 
> <4>hda: drive_cmd: error=0x04 { DriveStatusError }
> 
> <4>hda:saw err in ide_end_drive_cmd, disabling write barriers
> 
> <4>hda: drive_cmd: status=0x51 { DriveReady SeekComplete Error }
> 
> <4>hda: drive_cmd: error=0x04 { DriveStatusError }
> 
> <4>hda:saw err in ide_end_drive_cmd, disabling write barriers
> 
> <4>reiserfs: using ordered data mode
> 
> <4>Using r5 hash to sort names
> 

To me and my expirience, it seeems like your hard drive about to fail.
And it seems like its about to fail in area where jdata stored.


do backup (dd_rescue) , then try to run vendor utilities which relocate
bad blocks ( i dont know if they have something like that for MAXTOR,
but for IBM/HITACHI it would be DFT utility, and for most of hard-drives
ONTRACK Tech. does something that matches DFT functionality.

> I have struggled to find out whether I should be worried about this. I
> guess this is something to do with journaling and ordered writes, but
> the messages are somewhat cryptic. Is this the kernel detecting a
> problem with the drive based controllers (they are both Maxtor 6Y120L0s)
> or the motherboard chipset (Nvidia NForce) and disabling the
> functionality? I don't see the message again, but one of the reasons I
> did upgrade the kernel was that I was having occasional disk
> corruptions. Are there any switches/parameters I should be setting?
> 
>  
> 
> Can anyone give me a heads up on this.
> 
>  
> 
> Roger
> 

-- 
"the liberation loophole will make it clear.."
lex lyamin
