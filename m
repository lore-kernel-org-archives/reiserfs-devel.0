From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiserfs errors in dmesg output
Date: Sat, 03 Jul 2004 16:53:11 +0400
Message-ID: <40E6AC37.1090609@namesys.com>
References: <ae9bd76a040703052222e0065f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19497-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ae9bd76a040703052222e0065f@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sean Plaice <splaice@gmail.com>
Cc: reiserfs-list@namesys.com

Hello

Sean Plaice wrote:
> Hello,
> My system is running linux 2.4.33 

Please double check linux version.

with reiserfs for all of it's files
> systems, The system has a PERC-3DC Raid card (uses the aacraid
> driver).
> 
> The server is a very io intensive mail server.
> 
> I have recently noticed some "troubleing" output in the dmesg output.
> The server does not appear to be having any operational problems but
> the errors are leading me to be quite worried of potential future
> problems.
> 
> Could someone please help me diagnose what these error messages mean,
> and what I should do about them.
> 
> Thank you in advance for your answers, take care.
> 
> <snip>
> 
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 28)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 28)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 28)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 28)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 28)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 28)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 28)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 50)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 50)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 50)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
> 1466199 0x0 SD] (nlink == 1) not found (pos 3)
> 

These is not too bad in this. But,
would you run find -inum 1466199?
What do you get?

> and
> 
> sd(8,6):journal-1777: buffer 109798 bad state !PREPARED !LOCKED !DIRTY
>  JDIRTY_WAIT
> sd(8,6):journal-1777: buffer 185659 bad state !PREPARED !LOCKED !DIRTY
>  JDIRTY_WAIT
> sd(8,6):journal-1777: buffer 208840 bad state !PREPARED !LOCKED !DIRTY
>  JDIRTY_WAIT
> sd(8,6):journal-1777: buffer 300870 bad state !PREPARED !LOCKED !DIRTY
>  JDIRTY_WAIT
> 

IIRC, sometime ago, there were some fixes for race conditions which 
might cause this. Chris, would you please confirm that?

> </snip>
> 


