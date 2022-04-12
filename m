From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 on an inherently read-only block device
Date: Tue, 12 Apr 2022 21:27:54 +0200
Message-ID: <879c3df3-e369-797f-a412-022621d738be@gmail.com>
References: <c80ff400-479f-0730-506b-5a1e8edf9e82@thinlinx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uFb+8fd6oKI+PamDxoqjGB/pr5KXwRCQXKN0fGxEF3Q=;
        b=YSj9dm5+k0ooYhu7+DRAzTvwPjPSrBXJwtbmezGGOrvG227pEWn60SGtuGVbv4ZP3g
         /DMIKho3T8hbBSPVMSwvD1lczCJIykX37znKQcWHbLuRp55LcK5a6VT1KUI7X0SYrzA9
         Gh+sft2WbnoM+U6E/USJBIbsvffpoNWplNoZQyhcO7+n21xZ/lG2/I2nnrBIcUDd8sUv
         PTJk/s/CiwnFhF4Rhfslurbq7v68c2yY4H5HSiGlhXAIwdDdFQ6NMFBlvQY74y9lee3Z
         gwbTCPRkwrtC9OgfLPpx9s8Q9QTUU20VGoaRtr8v3v5R/H6uBkIzo3qVkUuwdy9PxZ2s
         BJCw==
In-Reply-To: <c80ff400-479f-0730-506b-5a1e8edf9e82@thinlinx.com>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Paul Whittaker <pawhitt69@gmail.com>, reiserfs-devel@vger.kernel.org
Cc: John Nicholls <john@thinlinx.com>


On 04/12/2022 01:42 AM, Paul Whittaker wrote:
> Hi Reiser developers,


Hi Paul,


> 
> Reiser4 is almost perfect for our (thinlinx.com's) needs except for one 
> problem: it wants to write to the block device even when mounted 
> read-only,


After issuing a "mount -o ro" command, reiser4 can potentially issue
write IO requests in the following cases:

1) Upgrading Format Version (it happens when you mount a reiser4 volume
    of format 4.X.A in the system with reiser4 module of software version
    4.X.B, where B > A).
2) Your volume has uncommitted transactions, that should be replayed.
3) Other possible mount-time cases that I don't remember.
4) Possible bugs in reiser4 code (e.g. ignoring the read-only flag in
    the write(2) context, etc).

 From your message it is not clear, which one takes place in your case.


> and handles errors ungracefully (read as: crashes and burns) 
> when it can't - specifically, when performing the umount operation.  I 


So what exactly happens at umount?


> haven't been able to devise a simple reproducer for this, e.g. using a 
> tiny ISO9660 filesystem, so there must be some subtleties that I am 
> unaware of, but it happens 100% of the time when using our real data.
> 


Yeah, some "non-enterprise bits" still take place in reiser4, mostly
because of restricted development resources. Right now I can help only
with 100% reproducible scenarios provided..


> We have a couple of use cases that necessarily involve inherently 
> read-only block devices:
> 
> 1) We want to provide an ISO9660-based installer for our O/S that 
> contains a Reiser4 (kinda-sorta-)root filesystem image that the 
> installer would mount read-only via loopback to inspect certain files 
> prior to dd'ing it to a target disk.
> 
> 2) We want to share a copy of the Reiser4 (kinda-sorta-)root filesystem, 
> which is mounted read-only on a writeable medium, read-only via the 
> ATA-over-Ethernet protocol for use by network-booted instances of our 
> O/S (this is feasible because the *real* root filesystem is AUFS with a 
> couple of additional writeable layers).  The resulting /dev/etherd/eX.Y 
> block device is inherently read-only - if it isn't, we risk write 
> contention and Bad Things.
> 
> Unless I'm missing something, Reiser4 doesn't provide any mount option 
> that would permit safe operation in the above use cases. Btrfs provides 
> a "norecovery" a.k.a. "nologreplay" option that allows suppression of 
> transaction log replay in situations in which the integrity of the 
> filesystem is already guaranteed.


What are you going to do in cases when the integrity is not guaranteed
without log replay?


> Is it possible to add a comparable 
> mount option in Reiser4?  It seems to me that read-only should mean 
> **read only**!


Yeah, it is possible. Reiser4 does not distinguish between critical and
non-critical logs though. However, it is possible to use a 
"write-anywhere" transaction mode (mount option "txmod=wa"), in which only
system blocks are logged. So that *all* logs are critical and you can
not simply ignore them without breaking consistency. Again, here is an
interesting question: what to do with not cleanly unmounted volumes,
specifically, if there are logs to replay? Refuse to mount? Are such
failures acceptable for you?

Thanks,
Edward,
