From: Sean Plaice <splaice@gmail.com>
Subject: Re: reiserfs errors in dmesg output
Date: Sat, 3 Jul 2004 16:10:37 -0700
Message-ID: <ae9bd76a0407031610bfd1c7d@mail.gmail.com>
References: <ae9bd76a040703052222e0065f@mail.gmail.com> <40E6AC37.1090609@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19498-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40E6AC37.1090609@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On Sat, 03 Jul 2004 16:53:11 +0400, Vladimir V. Saveliev <vs@namesys.com> wrote:
> Hello
> 
> Sean Plaice wrote:
> > Hello,
> > My system is running linux 2.4.33
> 
> Please double check linux version.

Please excuse my early morning typing, I meant to type 2.4.22.

> 
> with reiserfs for all of it's files
> > systems, The system has a PERC-3DC Raid card (uses the aacraid
> > driver).
> >
> > The server is a very io intensive mail server.
> >
> > I have recently noticed some "troubleing" output in the dmesg output.
> > The server does not appear to be having any operational problems but
> > the errors are leading me to be quite worried of potential future
> > problems.
> >
> > Could someone please help me diagnose what these error messages mean,
> > and what I should do about them.
> >
> > Thank you in advance for your answers, take care.
> >
> > <snip>
> >
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 28)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 28)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 28)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 28)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 28)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 28)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 28)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 50)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 50)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 50)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> > sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> > 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> >
> 
> These is not too bad in this. But,
> would you run find -inum 1466199?
> What do you get?

I am running the find now, but excuse my ignorance I could not find
any information with a ton of google'ing to determine the exact
partition that is refered to by sd(8,6).

I am assuming sd[scsi_device](8[controller?],6[partition?]. Using that
logic I should be doing the find on /dev/sda5 (if partition referenced
starts at 0). If anyone could clarify this I would appreciate it.

> 
> > and
> >
> > sd(8,6):journal-1777: buffer 109798 bad state !PREPARED !LOCKED !DIRTY
> >  JDIRTY_WAIT
> > sd(8,6):journal-1777: buffer 185659 bad state !PREPARED !LOCKED !DIRTY
> >  JDIRTY_WAIT
> > sd(8,6):journal-1777: buffer 208840 bad state !PREPARED !LOCKED !DIRTY
> >  JDIRTY_WAIT
> > sd(8,6):journal-1777: buffer 300870 bad state !PREPARED !LOCKED !DIRTY
> >  JDIRTY_WAIT
> >
> 
> IIRC, sometime ago, there were some fixes for race conditions which
> might cause this. Chris, would you please confirm that?

If this is a race condition that is specific to the kernel I am
running could this lead to corruption or system instability?


-- 
Sean
