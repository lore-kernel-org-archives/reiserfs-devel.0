From: Chris Mason <mason@suse.com>
Subject: Re: Newbiw question on write barriers and ordered write barriers
Date: 02 Sep 2003 08:11:15 -0400
Message-ID: <1062504675.5322.255.camel@tiny.suse.com>
References: <000501c370c4$94165ba0$fe0aa8c0@lancaster.beardandsandals.co.uk>
	 <20030902154848.A8083@t-raenon.nmd.msu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15511-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030902154848.A8083@t-raenon.nmd.msu.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: flx@msu.ru
Cc: Roger James <rogerjames99@btinternet.com>, reiserfs-list@namesys.com

On Tue, 2003-09-02 at 07:48, Alexander Lyamin wrote:
> Mon, Sep 01, 2003 at 09:06:37PM +0100, Roger James wrote:
> > Hi,
> > 
> >  
> > 
> > Ever since I updated my SuSE Linux 8.1 set up with the latest patches
> > from SuSE I have been seeing the following messages at boot up time
> > (once only for each drive).
> > 

Which kernel are you running now?

> > <4>hda: drive_cmd: status=0x51 { DriveReady SeekComplete Error }
> > 
> > <4>hda: drive_cmd: error=0x04 { DriveStatusError }
> > 
> > <4>hda:saw err in ide_end_drive_cmd, disabling write barriers
> > 
> > <4>hda: drive_cmd: status=0x51 { DriveReady SeekComplete Error }
> > 
> > <4>hda: drive_cmd: error=0x04 { DriveStatusError }
> > 
> > <4>hda:saw err in ide_end_drive_cmd, disabling write barriers
> > 
> > <4>reiserfs: using ordered data mode
> > 
> > <4>Using r5 hash to sort names
> > 
> 
> To me and my expirience, it seeems like your hard drive about to fail.
> And it seems like its about to fail in area where jdata stored.
> 

The barrier patches try a write cache flush command on the drive, and if
it fails they turn barrier mode off.  These messages mean your drives
don't support the barrier mode, you can ignore them.  Some drives print
the failures if you've already got write cache disabled.  Try hdparm -W
1 /dev/xxx before mounting an FS on the drive.

-chris


