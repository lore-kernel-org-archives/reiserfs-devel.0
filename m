From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: How do I  list  Reiser4 statistics on number of files on r4 partition
 and disk space used
Date: Wed, 19 Jan 2011 01:37:17 +0100
Message-ID: <4D36323D.1090206@gmail.com>
References: <5ee8be91243c959b67cf2073736efe35@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=kBXFLZhCBDzXRD8b7/4HdPLWMSLA5gz28DVzCBf+FIc=;
        b=t91n/yMTywY4Qb8cSK8fAgLddXny+ucLRlBiI80rkivwZOr1E52ZkcJDTmanCWJyQ9
         bzM4ftZQgqZo8EVqbwXMF5zyoNSPKD4LIvTqmAnqW0Uw//34iTJ7B6cLpduC6eFhYMk1
         DGeHcIDeUIiZAZvaO5ONtLcTyBI8R3PWJm5NE=
In-Reply-To: <5ee8be91243c959b67cf2073736efe35@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

On 01/19/2011 12:32 AM, doiggl@velocitynet.com.au wrote:
> Hello

Hi

> How do I  list  Reiser4 Statistics on number of files on r4 partition and

ls mountpoint | wc -l

I don't know how to do it offline. Perhaps there are
proper tools (measurefs, or so) in reiser4progs.


> disk space used and space saved with compression ?

sync(1) + df(1) will show occupied space.

Also you can use du(1) utility. However,
you must fsck your partition with --fix option before
using du (i_blocks and i_bytes are unsupported online
because of performance issues).

Edward.


> I can list these items at this time [1]
> Thanks Glenn
>
> [1]
>
> # fsck.reiser4 --print-profile /dev/sdb
> Default profile:
> create:          "reg40"           (id:0x0 type:0x0)    [Regular file
> plugin for creat(2)]
> key:             "key_large"       (id:0x1 type:0xb)    [Key plugin]
> compress:        "lzo1"            (id:0x0 type:0xc)    [Compression
> plugin]
> compressMode:    "conv"            (id:0x4 type:0xd)    [Compression Mode
> plugin]
> cluster:         "64K"             (id:0x0 type:0x10)   [Cluster plugin]
> hash:            "r5_hash"         (id:0x1 type:0x3)    [Directory entry
> hash plugin]
> fibration:       "ext_1_fibre"     (id:0x2 type:0x4)    [Key fibration
> plugin]
> formatting:      "smart"           (id:0x2 type:0x5)    [File body
> formatting plugin]
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

