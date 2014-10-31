From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 corruption.
Date: Fri, 31 Oct 2014 18:26:19 +0100
Message-ID: <5453C63B.5020808@gmail.com>
References: <5453BACD.8040801@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=ztjBIgCd4qPHAnL/d8cEXI05pefagohg1SXGOH/TMIg=;
        b=uuvUHzcqAuECaKFNEcV6uBEMFIGbIu4Gv3u7aMWi7t+j07+V0t9JhJDUS60aIN9nX9
         u7e6W+LAQJ6iSuSKiXrEb2BrKK1kIwtRShX0MwV+qc7qyYePe/PyqVu/rB006e6hqclY
         TMBzFbju9VxWYRUptA6SYiFfW383PGdOMCtwSnxsVW+Tle4JaFJHVwCRL5vhpC+VeCfD
         LlsYA8loJ3owz93B8MzxDAV03NCtg+7IC2h1DDf48c236jJdjbALP304AFQevYL3v3C0
         p0P2lNJSPKO/EvkS88y5re80WgBZqXyIlh32CjlhxXR1luEOEyxB7BLn17/hXEMQzzw/
         Mdjw==
In-Reply-To: <5453BACD.8040801@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: dE <de.techno@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 10/31/2014 05:37 PM, dE wrote:
> Hi!
>


Hello.


> I've encountered a corruption again.
>
> This's what I get when accessing a certain file --
>
> [ 2449.493892] reiser4[gwenview(7968)]: dc_check_checksum 
> (fs/reiser4/plugin/file/cryptcompress.c:1025)[edward-156]:
> WARNING: Bad disk cluster checksum -1008173184, (should be 
> -1553131906) Fsck?
>
> [ 2449.493898] reiser4[gwenview(7968)]: reiser4_inflate_cluster 
> (fs/reiser4/plugin/file/cryptcompress.c:1192)[edward-1460]:
> WARNING: Inode 3109170: disk cluster 0 looks corrupted
> [ 2449.493926] reiser4[gwenview(7968)]: dc_check_checksum 
> (fs/reiser4/plugin/file/cryptcompress.c:1025)[edward-156]:
> WARNING: Bad disk cluster checksum -1008173184, (should be 
> -1553131906) Fsck?
>
> [ 2449.493929] reiser4[gwenview(7968)]: reiser4_inflate_cluster 
> (fs/reiser4/plugin/file/cryptcompress.c:1192)[edward-1460]:
> WARNING: Inode 3109170: disk cluster 0 looks corrupted
> [ 2449.493971] reiser4[gwenview(7968)]: dc_check_checksum 
> (fs/reiser4/plugin/file/cryptcompress.c:1025)[edward-156]:
> WARNING: Bad disk cluster checksum -1008173184, (should be 
> -1553131906) Fsck?
>
> [ 2449.493974] reiser4[gwenview(7968)]: reiser4_inflate_cluster 
> (fs/reiser4/plugin/file/cryptcompress.c:1192)[edward-1460]:
> WARNING: Inode 3109170: disk cluster 0 looks corrupted
> [ 2449.494145] reiser4[gwenview(7968)]: dc_check_checksum 
> (fs/reiser4/plugin/file/cryptcompress.c:1025)[edward-156]:
> WARNING: Bad disk cluster checksum -1008173184, (should be 
> -1553131906) Fsck?
>
> [ 2449.494157] reiser4[gwenview(7968)]: reiser4_inflate_cluster 
> (fs/reiser4/plugin/file/cryptcompress.c:1192)[edward-1460]:
> WARNING: Inode 3109170: disk cluster 0 looks corrupted
>
> This again happened with the .mozilla/firefox dir.
>
> Anything I can do to report?


Which kernel version?
Is it annoying (reproducible)?

Thanks,
Edward.
