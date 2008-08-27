From: Zan Lynx <zlynx@acm.org>
Subject: Re: Hi Reiserfs-dev
Date: Tue, 26 Aug 2008 18:46:01 -0600
Message-ID: <48B4A3C9.2090508@acm.org>
References: <325143.47271.qm@web53207.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <325143.47271.qm@web53207.mail.re2.yahoo.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: stevenaaus@yahoo.com
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Steven wrote:
> Been using Reiser 3 for years now, messing round with m-multiple 
> operating systems. Imho, it's easily the best general purpose linux 
> filesystem.  Does anyone here say otherwise ?
> 
> I went through the hassle of installing reiser 4 on 2.6.24 about a 
> year ago, but it seemed to have latency issues, esp. at start-up 
> (fedora 4, 1.13 PIII dell laptop with 256ram) and reverted back to 
> reiser 3. Ideas?
> 
> Thanks, Steven.

I've been running Reiser4 on my laptop as / for a long time now. I have
two bits of advice.

Make sure it mounts at boot with the noatime option. Something like
"rootflags=noatime" on your LILO or GRUB kernel options line.

Have your init scripts set the queue depth on your block IO scheduler to
1024. Something like "echo 1024 > /sys/block/sda/queue/nr_requests".
With just 256 MB you might want to try smaller values. I'm not very
clear on how much RAM each queue slot can use.

I found that Reiser4 will appear to hang if it cannot flush an entire
transaction atom to the IO queue in one go. Make sure it's big enough.

The other thing that seems to make it a little slow is that it uses
barriers.  This is a Linux feature that serious filesystems use to
guarantee data integrity.  ext3 uses barriers for its journal and XFS
uses barriers too.  I believe there were patches for reiser3 to use
barriers too but I don't know if those are in all Linux or just SUSE.

As I understand it, on an IDE drive, a barrier is pretty slow because it
forces a full write queue flush, does the write, then flushes the queue
*again* before continuing.  On a real SCSI device with tagged queuing
this works much more quickly because it can continue to issue disk
commands after the barrier.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.8 (Darwin)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAki0o8gACgkQolqWs/Y4NLy9MgCgh3v5mB4uLx673JT1sz6dgJyA
1XEAni0AZxC6DokBQQ+sDu18qbzxP0s5
=K2Cy
-----END PGP SIGNATURE-----
