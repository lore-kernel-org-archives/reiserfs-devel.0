From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: kernel BUG() hit during PCI testing
Date: Tue, 10 May 2005 12:25:01 -0400
Message-ID: <4280E05D.6000000@suse.com>
References: <20050509222314.GA17876@austin.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24024-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050509222314.GA17876@austin.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linas Vepstas <linas@austin.ibm.com>
Cc: reiserfs-dev@namesys.com, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Linas Vepstas wrote:
> 
> 
> Hi,
> 
> I just hit a kernel BUG() during pci testing of 2.6.11.8.  The goal of 
> the testing was to temporarily disable a PCI slot containing a SCSI controller. 
> I think I permanently killed the PCI slot; i/o died, and shortly after 
> I hit the BUG().  See below.
> 
> The goal is, of course, to have the kernel keep on trooping even if 
> the SCSI controller dies out from under it; returning -EIO to user apps
> accessing the failed file system is acceptable.
> 
> --linas
> 
> io-falcons:~ # dmesg
> 
> 
> -bash: /bin/dmesg: Input/output error
> 
> (Above is the "normal" message when a file system returns -EIO to user space;
> I expect to see these kinds of messages if the block device under the
> file system fails. Then, a second later I got the crash:
> 
> io-falcons:~ #
> io-falcons:~ #
> io-falcons:~ # cpu 0x0: Vector: 700 (Program Check) at [c0000001ffe73740]
>     pc: c000000000138b48: .write_ordered_chunk+0xa4/0x100
>     lr: c0000000001392f4: .write_ordered_buffers+0x348/0x364
>     sp: c0000001ffe739c0
>    msr: 9000000000029032
>   current = 0xc0000003fe6d5030
>   paca    = 0xc000000000547000
>     pid   = 942, comm = reiserfs/0
> kernel BUG in submit_ordered_buffer at fs/reiserfs/journal.c:616!

Hi Linas -

This one is on my radar among several others of the same type. What's
happening is that somehow buffers are getting dirtied despite not being
uptodate. They're getting allowed to be put back into the write cycle
which is totally invalid, so they're getting caught rather than being
written to disk. ext3 has similar problems, but tends to handle them as
buffer errors rather than BUGs. I'm investigating whether or not these
errors could occur outside individual filesystems.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFCgOBdLPWxlyuTD7IRAqyHAJ9CNKvE0R8eNZZYb6KbTQ4uKoHNHACfa/kL
CRuuI9esIf10Xr2PGN/O77Y=
=eEwG
-----END PGP SIGNATURE-----
