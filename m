From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: Fri, 15 Aug 2003 16:53:22 +0100
Message-ID: <1060962802.32490.164.camel@hades.cambridge.redhat.com>
References: <Pine.LNX.3.96.1030815111741.20604A-100000@gatekeeper.tmr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15324-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.3.96.1030815111741.20604A-100000@gatekeeper.tmr.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Davidsen <davidsen@tmr.com>
Cc: Yury Umanets <umka@namesys.com>, Daniel Egger <degger@fhm.edu>, Hans Reiser <reiser@namesys.com>, Nikita Danilov <Nikita@namesys.com>, Linux Kernel Mailinglist <linux-kernel@vger.kernel.org>, reiserfs mailing list <reiserfs-list@namesys.com>

On Fri, 2003-08-15 at 15:32 -0400, Bill Davidsen wrote:
> On Thu, 14 Aug 2003, David Woodhouse wrote:
> 
> > The raw hardware driver provides only raw read/write/erase
> > functionality; no caching is appropriate. 
> 
> Okay, that's the model I have in mind as the driver, assuming you included
> seek in that list.

No seek -- offsets are passed to the read/write methods, like
pread()/pwrite(). 

We have read(), which reads from the flash hardware, erase() which
resets an eraseblock to all 0xFF, and write() which performs an bitwise
AND operation between the contents of the flash and the buffer provided
(you can only clear bits on flash, you can't set them except by erasing;
qv.).

> > If you want to teach a file system about flash and wear levelling, you
> > end up ditching the pretence that it's a block device entirely and
> > working directly with the flash hardware driver. 
> 
> I don't think that's right. A file system may very well be *optimized* for
> performance on a certain class of device, but that doesn't make it device
> dependent. For example some early SysV filesystems had the directory in
> the middle of the platters to minimize seek distance when the partition
> was only partially filled. I'd bet I could run JFFS2 on a normal drive,
> and I know I can run FAT, ext2, etc on a CF. Now if Linux only knew how to
> read SysV.4 drives I could save some critical old data from the 90's, but
> that's another issue...

CF != flash. For the purpose of this discussion, 'CF' and 'normal drive'
are identical concepts. They are block devices; not MTD devices. JFFS2
does not work on them (without trickery) since JFFS2 is not written to
use block devices.

Conversely, you cannot use FAT/ext/etc on real flash without some kind
of 'translation layer' to make it pretend to be a block device.

CF just happens to have that translation layer built in to its hardware
rather than doing it in software -- so as far as the computer is
concerned, CF _is_ an IDE hard drive.

> > Either that or use a translation layer which does it _all_ for the file
> > system and then just use a standard file system on that simulated block
> > device.
> 
> That sounds like a loopback mount, sort of. At least a feature which could
> be added fairly easily, like crypto mounts.

No, it's nothing like a loopback mount. It's a pseudo-filesystem. Three
sane implementations of such a thing are already in the kernel, and one
hopelessly trivial readonly one.

-- 
dwmw2

