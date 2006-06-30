From: Erik Mouw <erik@harddisk-recovery.com>
Subject: Re: BUG IN REISERFS
Date: Fri, 30 Jun 2006 14:29:06 +0200
Message-ID: <20060630122906.GE11568@harddisk-recovery.com>
References: <1151658708.6499.16.camel@tribesman.namesys.com> <4EEB5A4713E61F49A759A504BECCBC0A028D1CCB@bgeexc01.asiapacific.cpqcorp.net>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4EEB5A4713E61F49A759A504BECCBC0A028D1CCB@bgeexc01.asiapacific.cpqcorp.net>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Masthan, Dudekula (STSD)" <dudekula.masthan@hp.com>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org

Please choose your subject carefully. Claiming that you found a bug in
reiserfs while you only met a boundary condition isn't very polite.

On Fri, Jun 30, 2006 at 05:51:14PM +0530, Masthan, Dudekula (STSD) wrote:
> Mkreiserfs command is failing by showing " There are no enoguh blocks on
> this device" , What is the minimum size of a disk to create reiserfs
> file system

That mainly depends on the journal size. The default journal size is 32
MB which means that an actual useful disk size is about 100 MB. See
mkreiserfs(8), -s option.


Erik

-- 
+-- Erik Mouw -- www.harddisk-recovery.com -- +31 70 370 12 90 --
| Lab address: Delftechpark 26, 2628 XH, Delft, The Netherlands
