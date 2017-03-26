From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 fallocate (was Re: Xattr items)
Date: Mon, 27 Mar 2017 00:11:09 +0300
Message-ID: <58D82E6D.6080205@gmail.com>
References: <CAJZSrNKQ+t+V7GEKEjDNmaUy1KZYPuJX5cuyetjL-6mh=cjFKA@mail.gmail.com> <58D4307D.7040103@gmail.com> <CAJZSrNL1_XtWVft2fKxuMArFLnNp73BKiaL3_cQKyYyUXe-UCw@mail.gmail.com> <58D580E2.1060400@gmail.com> <CAJZSrNKSC7kf=26Mmd9+NSOMVch2FnK+Dhb4MJ62vCR5d4twXw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-transfer-encoding;
        bh=k+k85kKz8E+74e2Cl1Gx+fjol7cl/GRFTEvUDPMxWWQ=;
        b=ZEK+IrDYPyru6+Ujgba8A3qqgnukNpxqzSNr6/U0eyQVVfFyvXRWZuY2Fk6SX6offT
         G8V/qarQCna3A2lR1y4jgF2zcBwXzN7BKUwyFxaX6Sx+T2qR66BzewT076yIOhP3m6r9
         vYBeJcdwVVursnoaNwZMyVIFIuoJqm1LRWLQmmQblIAU++hI96hq2kTThPxadK/Fc3bx
         XuDw/F1+yJof7cc8TUKif5+4Royx717Yh3l+KG9dmv6MDvt30iHSQrBNtLUqdI4BwoIo
         FHXptZxSDO+daT/qv1j/6yXJYlgs6M0OgSW0O2Ty7HK7VTVQTOWAPpAF6tdhBDnK/xKL
         f1rQ==
In-Reply-To: <CAJZSrNKSC7kf=26Mmd9+NSOMVch2FnK+Dhb4MJ62vCR5d4twXw@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Daniel Horne <daniel.horne@gmail.com>
Cc: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

Yeah, it would be nice. This feature is used by various virtualization
technologies, i.e. is rather important.

I think that existing low-level framework is enough to implement it.
So, we need to implement a ->fallocate() method of the regular file
plugin. Actually it will resemble write and truncate file operations.
E.g. in default mode it will look like something between write and
expanding truncate. Specifically ->write() inserts extents, allocates
pages, charges the transaction manager to allocate disk space and
issue IO requests. Expanding truncate only inserts extents. And
->fallocate() should insert extents and charge the transaction manager
to allocate disk space. That "charge" is made by allocating a jnode
(per block), capturing it, and making it dirty. The problem is that by
default our transaction manager will try to issue a write IO request
against such jnode, so we'll need to mark that jnode by some special
way, and to teach the lowest-level IO issuer
(write_jnodes_to_disk_extent) to not issue a write request, but
instead uncapture that jnode and make it clean. Also we'll need a new
state of extents (besides the three existing ones):
ALLOCATED_HOLE_EXTENT. The trouble is that we don't have a dedicated
field to store this new state on disk. I suggest to store it in the
high bits of the extent's width. Thus, we'll need to modify (with
masking, etc) extent_get_width, extent_set_width, state_of_extent in
reiser4 kernel module and reiser4progs. Blocks pointed by extent of
that new state are "reserved", they contain garbage. Any attempts to
read blocks pointed by such extents should not issue read IO requests:
respective pages should be filled by zeros. Attempts to write to a
block of such extent should "plug an allocated hole", see the function
plug_hole() - if we can not reuse it, then let's create a similar
function plug_allocated_hole().

Basically that is all. It can happen that I missed some minor issues
though. If you find it is too complicated, then we'll find more easy
task.

Thanks,
Edward.

On 03/25/2017 11:46 PM, Daniel Horne wrote:
> On 24 March 2017 at 20:26, Edward Shishkin<edward.shishkin@gmail.com>  wrote:
>> Could you have a look at fallocate / hole-punching  support, if
>> interesting? For beginning I would recommend to implement it for
>> files managed by unix-file plugin and built of extent items.
> Ok, I'll take a look at that.
>
> Thanks,
> DH

