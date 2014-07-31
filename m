From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: FITRIM ioctl -- how to grab the space?
Date: Fri, 01 Aug 2014 00:03:58 +0200
Message-ID: <53DABD4E.1000905@gmail.com>
References: <3405506.BC0S4TX54B@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=SAMAhfblWLEQfMxHbpsLjOo4Ii99PYZJgt0ktYNpb14=;
        b=OQmyhFQbGQQn/uvYEQMgfiJ1jQ9WaUb/rIU4HBUXG5bJ5hX6K5+/TR2x0pdtl01jeh
         Njk9GCqhluMxrljUy9pGmIiJnBjRgNlhFOkWMgaxRg2iCpeL04h5wxtyFI5T5q959T9C
         lNftN8VU+58tONknVtMz7P72kejohwJvPX5TmLGRTBJSNa6fHNDi7a1ZmsG/hkfowYJW
         7fKqP4Z1UB9qj2kOfLuCHpo9bmPcSAmN9/aq1SUa+IBX9WWKrUZs25Wk6p1/a9Jtt7Xv
         uom+Q8QRnohR2gyVKrKp4luBumjxUqPD33D3ls4QDCUaWLbcbzRQSu6hElRiN84mmFqj
         JMLg==
In-Reply-To: <3405506.BC0S4TX54B@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org

grab_space() is only for processes which require disk space (including
wandered blocks). For example ->read() modifies a superblock (atime),
which should be written via journal. So ->read() grab 1 block, etc.

As to FITRIM ioctl: I don't think it needs to reserve disk space at all: 
it will
issue only discard requests.

Edward.


On 07/31/2014 10:47 PM, Ivan Shapovalov wrote:
> ...and here is volume 2 of my neverending question series :)
>
> A stub ioctl, placed as I described, seems to work and log a warning each time
> I invoke `fstrim` on anything mounted.
>
> Now on to space allocation. This seems pretty easy in the first approximation:
> reiser4_alloc_blocks_bitmap() seems to do what's needed, finding the nearest
> free extent, not the biggest one. So we could just call reiser4_alloc_blocks()
> plus reiser4_dealloc_blocks(BA_DEFER) repeatedly, while allocations succeed.
>
> However, I suppose we need to grab all free space before proceeding. There is
> no primitive for grabbing all free space, so we need to read block counters,
> calculate amount of space to grab and then call reiser4_grab_reserved()
> (as we want to allocate everything, including the reserved space. This creates
> two problems (as I see it):
> - there is a race between reading block counters (under sb spinlock) and
>    performing the grab (which takes the spinlock on its own);
> - if anything will try to grab space during discarding, it will get an ENOSPC,
>    while it's better to make the process wait until discarding is completed.
>
> I'm not sure whether the last problem really exists (there is BA_CAN_COMMIT,
> but I don't know whether is it used consistently where possible).
>
> Could you explain these things?
>
> Thanks,

