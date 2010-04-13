From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: problem with GNOME 2.30
Date: Mon, 12 Apr 2010 18:23:12 -0700 (PDT)
Message-ID: <alpine.DEB.2.01.1004121819080.29272@bogon.housecafe.de>
References: <4BC15348.80205@gentoo.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4BC15348.80205@gentoo.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Serkan Kaba <serkan@gentoo.org>
Cc: reiserfs-devel@vger.kernel.org

On Sun, 11 Apr 2010 at 07:42, Serkan Kaba wrote:
> After an upgrade to GNOME 2.30 I cannot create new files with data (i.e save
> as) or cpoy/move files into reiser4 partition.

So, I assume that other programs (Firefox? Openoffice? vi?) can still 
create files on this reiser4 partition. It'd be interesting how Gnome is 
trying to create files. strace(1) comes to mind, I know it will be messy 
to catch all the Gnome processes, but mabe you're lucky...

Christian.
-- 
BOFH excuse #135:

You put the disk in upside down.
