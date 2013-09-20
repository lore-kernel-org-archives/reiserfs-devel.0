From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Is it possible to speed up the command fsck.reiser4
Date: Fri, 20 Sep 2013 23:07:04 +0200
Message-ID: <523CB8F8.1010200@gmail.com>
References: <1949faca7affee8130ee710c63d9e3eb@mail.velocitynet.com.au> <20130920081132.Horde.Y-RztXjJvXUJYU-W3fifxw1@mail.thieu.so>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=gRkPTiDXbro+2Za5ne5bgD5XcIZdH6xYOcCi0td0xQA=;
        b=GU2asFshFTdp/SZveGZoKsT66Y1MXASnc4LXqrHCV19sdORn2hbvAA8vDlH4sdymYc
         BGaRABQEbhzzX6E0trSwqbZMAjFnYoY60rJ9tnxvCps9jpM44i67HXXQvf+/ZdDLr2Of
         A6krPZ0yPgxRkx6K465phRMRaX91VNBRH6KcbbA1o12D8N53HOy7KS8Ri9tpkDJnRfDB
         JX0gK8ov95oGiZ20DDq8KFohrVO9wxe739llZOfEVklGWIAdwaI79Btgtx0HMASuMkez
         XFb0a76MJTWnGMOUFNLfZfuZoG/PmpYh4uAPxtfhpJ5JoEPWZ6XC7ozmapGemjb/V0jS
         ay5A==
In-Reply-To: <20130920081132.Horde.Y-RztXjJvXUJYU-W3fifxw1@mail.thieu.so>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mathieu Belanger <m@thieu.so>
Cc: doiggl@velocitynet.com.au, reiserfs-devel@vger.kernel.org

A real possibility to speed up fsck is supporting many storage trees per 
volume.

This feature has a special name "subvolumes": you marked some directories as
"subvolumes", so that (meta)data of their children will be stored in the 
respective
storage tree.

So, instead of processing one storage tree fsck will process many trees 
in parallel.

The old name of this feature is "ChunkFS": there were attempts to 
organize something
similar in ext3..

Thanks,
Edward.


On 09/20/2013 10:11 AM, Mathieu Belanger wrote:
>
> A build-fs probably read the whole disk to find what it need to 
> rebuild (I did not check inside but it sound like that). After, if you 
> add that for reading a fatty 2TB hard drive still go at the speed of a 
> 80GB drive, that will justify the time ;)
>
> So if fsck go read the nodes "one at a time" and that you have 
> something like a Western digital Grean 2TB, you end up with a nominal 
> transfer speed of 56.6MiB/s with is about half the max because you 
> miss one (slow)RPM of read, you end up with 609 minutes and so just to 
> read the STORAGES TREE nodes...
>
> If fsck read them "one at a time", it could be speed-up by doing a 
> sequential read of the whole disk and using the ram for buffer to scan 
> for theses nodes but it's not actually the priority (lot of thing are 
> more important than the speed of fsck, for exemple FITRIM to keep our 
> SSD fast).
> -- 
> To unsubscribe from this list: send the line "unsubscribe 
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

