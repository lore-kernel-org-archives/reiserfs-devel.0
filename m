From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: problem with a bad block in bitmap table
Date: Wed, 27 Aug 2003 18:28:45 +0400
Message-ID: <200308271828.45686.vitaly@namesys.com>
References: <20030827132052.GA13552@linalco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15459-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030827132052.GA13552@linalco.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ragnar Hojland Espinosa <ragnar@linalco.com>, reiserfs-list@namesys.com


Hi, 

On Wednesday 27 August 2003 17:20, Ragnar Hojland Espinosa wrote:
> One of my HDs at home is dying, bad blocks (and other nastiness)
> appeared, and I can't mount it to recover whatever I might, as it
> complains on a bad block (32768) on a rather unfriendly place:
>
> bread: Cannot read the block (32768): (Input/output error).
>
> Aug 27 14:36:09 lightside kernel: reiserfs: found format "3.6" with
> standard journal Aug 27 14:36:10 lightside kernel: hdb: read_intr:
> status=0x59 { DriveReady SeekComplete DataRequest Error } Aug 27 14:36:10
> lightside kernel: hdb: read_intr: error=0x40 { UncorrectableError },
> LBAsect=302464, sector=262144 Aug 27 14:36:10 lightside kernel:
> end_request: I/O error, dev 03:42 (hdb), sector 262144 Aug 27 14:36:10
> lightside kernel: ide0(3,66):sh-2029: reiserfs read_bitmaps: bitmap block
> (#32768) reading failed Aug 27 14:36:10 lightside kernel:
> ide0(3,66):sh-2014: reiserfs_read_super: unable to read bitmap Aug 27
> 14:36:12 lightside kernel: hdb: read_intr: status=0x59 { DriveReady
> SeekComplete DataRequest Error } Aug 27 14:36:12 lightside kernel: hdb:
> read_intr: error=0x40 { UncorrectableError }, LBAsect=52993408,
> sector=52953088 Aug 27 14:36:12 lightside kernel: end_request: I/O error,
> dev 03:42 (hdb), sector 52953088

this is unfortunatelly the block the reiserfs keeps its system info in,
and there is no way to relocate it or just mark as bad.

Have you tried to write into this block? If the internal harddrive's list of badblocks 
is not full, it may get remapped and block may become readable again. In the 
case this succeeds you will need to run reiserfsck --fix-fixable after. But if it 
does not, that means that you have a lot of bad blocks and there is no space 
in the harddrive internal list of bad blocks -- you really need to replace the 
harddrive. While replacing you can run 
        dd if=/dev/hdb2 of=somewhere conv=sync,noerror
(or even better to use dd_rescue). 
Am I right that hdb2 is the fauly one? 
And after that run 
        reiserfsck --fix-fixable the_copy
to fix the bitmap on the fs.

> Unfortunately I dont have enough space to do a dd of 120 GB and make a
> backup of the beast, so I'm not feelink very adventureous.  First I
> would run a badblocks -n, and then another badblocks with an
> add-bad-block to mark the block as used.. but unfortunantely it seems
> that it requires a file in the command line?  Or should I run a
> --check-tree..    I'm a bit lost without debugfs and dump.

the tree inself is ok (I hope), but reiserfs has some system info in the block
that is not readable anymore. If you really want to continue with this broken 
harddrive and need our assistance, visit please our support page 
(www.namesys.com/support.html) -- we deal with hardware problems in term 
of this page.

-- 
Thanks,
Vitaly Fertman
