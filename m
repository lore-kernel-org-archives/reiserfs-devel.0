From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [RFC] reiserfs 3.7
Date: Sun, 21 Nov 2010 12:49:30 +0100
Message-ID: <4CE9074A.8050608@gmail.com>
References: <4CE7F1C3.2010701@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=tEefwa2gUU8xaby47srwWOQJjy45dqvhcQ7F7Vv81f4=;
        b=sE620AaJalTgsSUgEnUNynRqIuJUpY1Iwoo8/9PB+sff133s/KleiIY+nnyQuDFVzZ
         RV4Ox0pf/xQYGtbWrgbHH/DOzf7LxALkrcSpzunXjo477y7W5gTg/kG7+EXaM8U/DwwX
         VWaubMVeFCAQq8L8c/7OBD7RKQSwl6APG/koo=
In-Reply-To: <4CE7F1C3.2010701@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Jeff Mahoney wrote:
> Hi all -
>
> I recently posted about wanting to extend the maximum supported file
> size from the 2 TB limit it currently has to the advertised maximum of 8
> TB. This turned out to be a flop since the file system format uses 512
> byte blocks in the stat data's sd_blocks field.

So what do you want to keep in sd_blocks of 3.7 disks?

> The format supports
> larger file sizes in general, but this field is a stumbling block. Users
> are trying to work within reiserfs's advertised limits and discovering
> that the limits aren't as accurate as we thought.
>
> I commented during that thread about how I should have created a v3.7
> years ago when I first wrote the hack that is extended attributes.
>
> So, I have. See the following posts. The initial version doesn't have
> any extended features - it just adds a new magic number and the feature
> bitmasks to the superblock. It follows the ext[234] system of feature
> bits to define which features are supported on the file system.
>
> I also have fsck support written but it is pretty untested still. Before
> I invest more effort in this, I'd like to get a consensus of whether or
> not this is desirable feature.
>
> My intention is that, once this is upstream, to backport it to our
> earlier products to enable things like the 8 TB limit.
>
> The idea is to be able to convert an existing 3.6 file system to 3.7 ,
> just like the 3.5->3.6 conversion.

You want to prohibit mounting of 3.6 disks to 3.7 kernels?
I am afraid it will be a shock therapy: mandatory fsck can be
rather painful for someone..

Edward.

> For features like the blocksize
> sd_blocks field, fsck --fix-fixable would adjust all the sd_blocks
> values on the file system.
>
> -Jeff
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


