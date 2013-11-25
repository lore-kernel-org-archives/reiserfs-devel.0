From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 kernel compilation problem.
Date: Mon, 25 Nov 2013 20:37:44 +0100
Message-ID: <5293A708.2090907@gmail.com>
References: <35ffb317ffa4ed9987117759f51ebd1f@mail.velocitynet.com.au> <20131123161309.1b321a45@Ulf.tvoe.tv> <3ff712c55494331e10c9f7fc0b7b8d25@mail.velocitynet.com.au> <20131125135635.36d29c28@Ulf.tvoe.tv> <529334E8.40704@gmail.com> <20131125190313.79962097@Ulf.tvoe.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=0UuPKNWy6Kw6UjvV3rAkz4z9PciRX13bXjPTcxssarY=;
        b=OvLL9azBdanbuB/xT5OC7d06C1fpQ9n8mpkwdJdHP+KbmueGK1S+3iyTEnjGqEtfxg
         uL9BZiP2PbdFDUZQhNtgwrp5Tl9Rt05sH6V0nbBRG6lloc68NdI9/ioyTQ7kfb+C+8HH
         gpdh1k02m+0HvLShGW8PMZcJXx4IKzIrnl1er2T12vl7UljCQ+WteqEZNu6Uw+zsY3dw
         LIQzASgme1GxHFjd4hjnUvKIh+odoqNLMO4yrUwX6h9iYh6RTIQ35ccZIwGqViqry0sQ
         tl49rfl8VkGgmkPCQUH/sCRAGRn1bdEhyh3JC/Yg7bxsuXXvQT+qyd9IowZzd9AK2yvg
         vfag==
In-Reply-To: <20131125190313.79962097@Ulf.tvoe.tv>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, dimas000@ya.ru

On 11/25/2013 04:03 PM, dimas wrote:
>> Fsck doesn't report if compression has been enabled.
>> debugfs.reiser4 should be patched to show value of "create" (reg40 or
>> ccreg40),
>> "compress" (lzo1, or gzip1), etc.
> oh, didn't know, thanks! i thought that "format40" is just equal to "reg40".

Not really.
"format4x" is per-volume thing, whereas "reg4x" is per-directory thing.
BTW, "ccreg40" is bad name: I insisted on "reg41", but reiser4progs
authors were too lazy to change things...



> thus, there is currently no way to determine fs format (reg40 or ccreg40)

Volume format (only "format40" for now) is determined at mkfs time.
"Create" value (only reg40 and ccreg40 for now) of root directory is
determined at mkfs time and inherited by children.

You can change "create" value of any directory (including the root one)
at any time (e.g. with ioctl(2) ), so that new children will inherit
that new value (not implemented).


>   and
> compression type (if any)? maybe, such information in fsck would be nice?))

Actually, fsck is to check consistency.#0  SD (stat40): 
[29:1(SD):0:2a:0] OFF=28, LEN=94, flags=0x0
exts:           3
mask:           0x13
plugin:         sdext_lw
offset:         2
len:            14
mode:           drwxr-xr-x
nlink:          4
size:           3
plugin:         sdext_unix
offset:         16
len:            28
uid:            0
gid:            0
atime:          Mon Nov  4 21:22:24 2013
mtime:          Mon Nov  4 21:13:07 2013
ctime:          Mon Nov  4 21:13:07 2013
rdev:           150
bytes:          150
plugin:         sdext_plugin_set
offset:         44
len:            50
Pset count:     12
         permission : id = 0
         formatting : id = 2 (smart)
               hash : id = 1 (r5_hash)
          fibration : id = 2 (ext_1_fibre)
           statdata : id = 0 (stat40)
            diritem : id = 2 (cde40)
             crypto : id = 0
             digest : id = 0
           compress : id = 0 (lzo1)
       compressMode : id = 4 (conv)
            cluster : id = 0 (64K)
             create : id = 0 (reg40)

There is a special tool for such needs (debugfs.reiser4).
With the option -t it dumps the whole tree. You should
find any stat-data item, and take a look at the "create"
parameter.

In the following example compression has been disabled:

#0  SD (stat40): [29:1(SD):0:2a:0] OFF=28, LEN=94, flags=0x0
exts:           3
mask:           0x13
plugin:         sdext_lw
offset:         2
len:            14
mode:           drwxr-xr-x
nlink:          4
size:           3
plugin:         sdext_unix
offset:         16
len:            28
uid:            0
gid:            0
atime:          Mon Nov  4 21:22:24 2013
mtime:          Mon Nov  4 21:13:07 2013
ctime:          Mon Nov  4 21:13:07 2013
rdev:           150
bytes:          150
plugin:         sdext_plugin_set
offset:         44
len:            50
Pset count:     12
         permission : id = 0
         formatting : id = 2 (smart)
               hash : id = 1 (r5_hash)
          fibration : id = 2 (ext_1_fibre)
           statdata : id = 0 (stat40)
            diritem : id = 2 (cde40)
             crypto : id = 0
             digest : id = 0
           compress : id = 0 (lzo1)
       compressMode : id = 4 (conv)
            cluster : id = 0 (64K)
             create : id = 0 (reg40)
