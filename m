From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS v3 + millions of files?
Date: Mon, 27 Oct 2003 09:55:41 +0300
Message-ID: <3F9CC16D.10109@namesys.com>
References: <200310262146.28850.d.oglesby@insightbb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15892-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200310262146.28850.d.oglesby@insightbb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dan Oglesby <d.oglesby@insightbb.com>
Cc: reiserfs-list@namesys.com

Dan Oglesby wrote:

>Greetings...
>
>Long time ReiserFS user, first time I've had a problem.  Signed up for the 
>mailing list last week, and was surprised to see so little traffic (might be 
>a good thing?).
>
>I'm running Red Hat 7.3 using a Red Hat 2.4.20 kernel.  The system has a 
>RAID-5 array via 3Ware 7500 controller, and three Western Digital 120GB 
>"Special Edition" hard drives.  The array is one filesystem, ReiserFS.  The 
>operating system, swap, and other files are stored on a hard drive that is on 
>the primary IDE controller off of the motherboard.
>
>The system is a single board computer, with a P4 3.06 GHz hyperthreaded 
>processor (kernel is SMP enabled), 512MB of RAM, and contains a mix of 
>ReiserFS and EXT2 filesystems on the primary drive (ReiserFS only on the 
>array).  No NFS.
>
>The array is used to store what will basically amount to more than one million 
>files with an average size of sixty kilobytes.
>
>During simulations for file writes, I'm seeing write performance begin to drop 
>dramatically after 800,000 files have been stored on the filesystem.
>
>The filesystem is being mounted with the following options:  
>defaults,notail,noatime,nodiratime
>
>The filesystem was created with default options, basically a "mkreiserfs /dev/
>sda1".
>
>Is this behavior I should expect from ReiserFS v3?
>
>This week I will be switching from a Red Hat kernel to a vanilla kernel (from 
>kernel.org), first the latest 2.4 kernel, then the latest 2.6 kernel.  After 
>that...  I dunno.
>
>Help?
>
>--Dan Oglesby
>
>
>
>  
>
what size directories?

-- 
Hans


