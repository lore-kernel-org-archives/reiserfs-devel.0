From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: fsck.reiser4 mishandling large files
Date: Mon, 12 Apr 2010 01:57:32 +0200
Message-ID: <4BC261EC.9000805@gmail.com>
References: <w2m8e7fbfae1004102047vbf40116ejeab6985c2ec368bd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=xsC4BV3a0IdL52B2mnIF8SS8ybFh6FSYZbkiWmcIGa0=;
        b=lGACw7uHBOdtzzV1D8xHUuMTfz0H+l+QndQ/UEx5FR/HYW9PYFooagFZNO451/YIqO
         ttFUt8qLsutFCz7qCYpdJ0Rpoi+6/3OMkds7r4zXGGq8pUfJPziunis3DUBxIMGsR2R6
         qq7a8F9QCAUSw39ES1VI9xRH/E2U13CFchBEc=
In-Reply-To: <w2m8e7fbfae1004102047vbf40116ejeab6985c2ec368bd@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Morgan Smith <moondog13@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Hello.

Thanks a lot for your details.
It seems that some 32-bit fsck counter has overflown.
I'll take a look, as It is reproducible..

In the case of reg40 plugin the file system structure is very
simple: just 2 nodes and a single extent pointer, so I think
it won't be a big deal to catch the bug..

Edward.


Morgan Smith wrote:
> Hello,
>
> I was trying out fsck.reiser4 on an external drive I have and it said
> there were fatal corruptions detected in the file system and suggested
> running again with --build-fs. Looking at the output of fsck.reiser4 I
> found the inode numbers of the files that were listed and I used the
> find command to track them down. All of the files that fsck.reiser4
> listed were large files, 4.4GB a piece (OpenSUSE and CentOS DVD iso
> files). After some testing outside of that disk, it seems as though
> fsck.reiser4 will proclaim fatal corruptions if there are files
> greater than 4GB in size (my iso was 4.4GB) and suggests --build-fs.
> Using --build-fs corrupts the large files. Is there a plugin that I
> may not have enabled to allow for the safe fscking of large files?
>
> The error is experienced using reg40 or ccreg40. Between tests I used
> dd to zero out all data on the partition before reformatting with
> different options. My testing involved creating a small partition on
> the drive, formatting it with reiser4, mounting it, creating a large
> file on the file system (tarball of iso files), dismounting it,
> running fsck.reiser4, mounting it, extracting tarball, verifying iso
> images against the originals with md5sum.
>
> With a reg40 format I get this:
> Master super block (16):
> magic:          ReIsEr4
> blksize:        4096
> format:         0x0 (format40)
> uuid:           f3cb070c-9c88-492d-b6a2-f83025ce6eb6
> label:          <none>
>
> Format super block (17):
> plugin:         format40
> description:    Disk-format plugin.
> version:        0
> magic:          ReIsEr40FoRmAt
> mkfs id:        0x38576ea3
> flushes:        0
> blocks:         1572864
> free blocks:    92393
> root block:     1034712
> tail policy:    0x2 (smart)
> next oid:       0x10001
> file count:     2
> tree height:    2
> key policy:     LARGE
>
>
> CHECKING THE STORAGE TREE
>         Read nodes 2
>         Nodes left in the tree 2
>                 Leaves of them 1, Twigs of them 1
>         Time interval: Sat Apr 10 21:12:39 2010 - Sat Apr 10 21:12:39 2010
> CHECKING EXTENT REGIONS.
> FSCK: extent40_repair.c: 96: extent40_check_layout: Node (1034712),
> item (1), unit (80),
> [2a:4(FB):6c617267652e74:10000:0]: points out of the fs, region
> [1571329..1572863].
>         Read twigs 1
>         Invaid extent pointers 1
>         Time interval: Sat Apr 10 21:12:39 2010 - Sat Apr 10 21:12:39 2010
> CHECKING THE SEMANTIC TREE
>         Found 2 objects (some could be encountered more then once).
>         Time interval: Sat Apr 10 21:12:39 2010 - Sat Apr 10 21:12:39 2010
> FSCK: repair.c: 550: repair_sem_fini: On-disk used block bitmap and
> really used block
> bitmap differ.
> ***** fsck.reiser4 finished at Sat Apr 10 21:12:39 2010
> Closing fs...done
>
> 1 fatal corruptions were detected in FileSystem. Run with --build-fs
> option to fix them.
>
>
> With ccreg40 format I get this:
> Master super block (16):
> magic:          ReIsEr4
> blksize:        4096
> format:         0x0 (format40)
> uuid:           b916bc54-a228-467f-bd0c-9097988d3118
> label:          <none>
>
> Format super block (17):
> plugin:         format40
> description:    Disk-format plugin.
> version:        0
> magic:          ReIsEr40FoRmAt
> mkfs id:        0x4551a4df
> flushes:        0
> blocks:         1572864
> free blocks:    408714
> root block:     1164381
> tail policy:    0x2 (smart)
> next oid:       0x10001
> file count:     2
> tree height:    5
> key policy:     LARGE
>
>
> CHECKING THE STORAGE TREE
>         Read nodes 1164071
>         Nodes left in the tree 1164071
>                 Leaves of them 1150840, Twigs of them 13078
>         Time interval: Sat Apr 10 19:58:04 2010 - Sat Apr 10 19:59:20 2010
> CHECKING EXTENT REGIONS.
>         Read twigs 13078
>         Time interval: Sat Apr 10 19:59:20 2010 - Sat Apr 10 20:00:23 2010
> CHECKING THE SEMANTIC TREE
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [2a:6c617267652e74:10000]
> (ccreg40): the cluster at [319799296] offset 8192 bytes long is corrupted.
>         Found 1 objects (some could be encountered more then once).
>         Time interval: Sat Apr 10 20:00:23 2010 - Sat Apr 10 20:01:39 2010
> ***** fsck.reiser4 finished at Sat Apr 10 20:01:40 2010
> Closing fs...done
>
> 1 fatal corruptions were detected in FileSystem. Run with --build-fs
> option to fix them.
>
>
> Here is some additional information which may help:
>
> # uname -a
> Linux beefy 2.6.31-gentoo-r10 #6 SMP Tue Mar 30 18:36:29 MDT 2010
> x86_64 Intel(R) Xeon(TM) CPU 3.00GHz GenuineIntel GNU/Linux
>
> # fsck.reiser4 --version
> fsck.reiser4 1.0.7
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

