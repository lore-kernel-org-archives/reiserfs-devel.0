From: Alexander Lyamin <flx@msu.ru>
Subject: Re:  Newbiw question on write barriers and ordered write barriers
Date: Thu, 4 Sep 2003 16:05:37 +0400
Message-ID: <20030904160537.A1018@t-raenon.nmd.msu.ru>
References: <000501c370c4$94165ba0$fe0aa8c0@lancaster.beardandsandals.co.uk> <20030902154848.A8083@t-raenon.nmd.msu.ru> <1062504675.5322.255.camel@tiny.suse.com>
Reply-To: flx@msu.ru
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15546-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1062504675.5322.255.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: flx@msu.ru, Roger James <rogerjames99@btinternet.com>, reiserfs-list@namesys.com

Tue, Sep 02, 2003 at 08:11:15AM -0400, Chris Mason wrote:
> On Tue, 2003-09-02 at 07:48, Alexander Lyamin wrote:
> > Mon, Sep 01, 2003 at 09:06:37PM +0100, Roger James wrote:
> > > Hi,
> > > 
> > >  
> > > 
> > > Ever since I updated my SuSE Linux 8.1 set up with the latest patches
> > > from SuSE I have been seeing the following messages at boot up time
> > > (once only for each drive).
> > > 
> 
> Which kernel are you running now?
> 
> > > <4>hda: drive_cmd: status=0x51 { DriveReady SeekComplete Error }
> > > 
> > > <4>hda: drive_cmd: error=0x04 { DriveStatusError }
> > > 
> > > <4>hda:saw err in ide_end_drive_cmd, disabling write barriers
> > > 
> > > <4>hda: drive_cmd: status=0x51 { DriveReady SeekComplete Error }
> > > 
> > > <4>hda: drive_cmd: error=0x04 { DriveStatusError }
> > > 
> > > <4>hda:saw err in ide_end_drive_cmd, disabling write barriers
> > > 
> > > <4>reiserfs: using ordered data mode
> > > 
> > > <4>Using r5 hash to sort names
> > > 
> > 
> > To me and my expirience, it seeems like your hard drive about to fail.
> > And it seems like its about to fail in area where jdata stored.
> > 
> 
> The barrier patches try a write cache flush command on the drive, and if
> it fails they turn barrier mode off.  These messages mean your drives
> don't support the barrier mode, you can ignore them.  Some drives print
> the failures if you've already got write cache disabled.  Try hdparm -W
> 1 /dev/xxx before mounting an FS on the drive.

<4>hda: drive_cmd: status=0x51 { DriveReady SeekComplete Error }
<4>hda: drive_cmd: error=0x04 { DriveStatusError }

also appear when ide code access bad blocks on drive...
it would be nice if you could suppress thouse lines when probing for 
cache flush functionality on disks, otherwise some people out there
would be upset, and thats why its sprung my WRONG comment. sorry ;)


-- 
"the liberation loophole will make it clear.."
lex lyamin
