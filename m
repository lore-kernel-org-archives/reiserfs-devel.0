From: Vladimir Shebordaev <vladimir.shebordaev@gmail.com>
Subject: Re: using debugfs.reiser4 options to access R4 on /dev/sdb
Date: Fri, 27 Feb 2015 08:35:17 +0300
Message-ID: <1425015317.29064.1.camel@home.ted.local>
References: <2a39c4776614cb7a675f299083a3627a@mail.velocitynet.com.au>
	 <1424809332.12259.67.camel@home.ted.local>
	 <4e67fef614d6e56cca9bdb540d592c78@mail.velocitynet.com.au>
	 <1424878538.16839.6.camel@home.ted.local>
	 <d6d728414febcac908cc6aaaf8aebfb6@mail.velocitynet.com.au>
	 <1424954369.18102.19.camel@home.ted.local>
	 <8285e510086433ffcc25556941f7bbe3@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version:content-transfer-encoding;
        bh=Hg3GvSeQDaTNj3YYi/h+GlttyOPgVpNkuNMCj12oorU=;
        b=qHvL8MxFKVhLr33x06240U3d0EGTIddmIzLf5M9tHuFSgnpZisXXU7b/7ZCCUqsUvK
         VYpwTnJaIgooojLcxY5+DJnAtsuskmwBG7VUhzjvktnf9p8PoldWNKrT0siC2ECOyLF4
         3jem3fmBxwS6AnnfQp5hzql0cGUY1pnbfW9XxfVmlRATFuALWbbz7TGk7yOtpzDQ5Tmg
         d5GdDMxgJ6MIxIx8bqTDRZ1zf45r+eARoVQUmtBunHYCNOluwPPEZjRUqWBui4SCGlV1
         efwVzTSjL/87SyR+NxCKmZf6PyLabhO2Ll7d5R8hEdPBE8NT2V11ml8pUln9seSVqL/0
         NvXA==
In-Reply-To: <8285e510086433ffcc25556941f7bbe3@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

On Fri, 2015-02-27 at 02:37 +1100, doiggl@velocitynet.com.au wrote:
> > 
> > 
> > So, you decided you don't need all that gig of text. You are right.
> > 
> > You have to grep the dump file for two strings 
> > 
> > "[29:1(SD):0:2a:0]" which names root directory stat data item
> > "[2a:0(NAME):0:0:0]" which is the root directory item itself
> > 
> > Normally, the output there should look like 
> > 
> > NODE (3851068) LEVEL=1 ITEMS=12 SPACE=15 MKFS ID=0x66d6b8ae FLUSH=0x0
> > #0  SD (stat40): [29:1(SD):0:2a:0] OFF=28, LEN=94, flags=0x0
> > exts:           3
> > mask:           0x13
> > plugin:         sdext_lw
> > offset:         2
> > len:            14
> > mode:           drwxr-xr-x
> > nlink:          7
> > size:           7
> > plugin:         sdext_unix
> > offset:         16
> > len:            28
> > uid:            1000
> > gid:            0
> > atime:          Wed Feb 25 21:45:42 2015
> > mtime:          Wed Mar  5 00:25:14 2014
> > ctime:          Wed Mar  5 00:25:14 2014
> > rdev:           350
> > bytes:          350
> > plugin:         sdext_plugin_set
> > offset:         44
> > len:            50
> > Pset count:     12
> >         permission : id = 0
> >         formatting : id = 2 (smart)
> >               hash : id = 1 (r5_hash)
> >          fibration : id = 2 (ext_1_fibre)
> >           statdata : id = 0 (stat40)
> >            diritem : id = 2 (cde40)
> >             crypto : id = 0
> >             digest : id = 0
> >           compress : id = 1 (gzip1)
> >       compressMode : id = 4 (conv)
> >            cluster : id = 0 (64K)
> >             create : id = 4 (ccreg40)
> > 
> >
> ------------------------------------------------------------------------------
> > #1  DIRITEM (cde40): [2a:0(NAME):0:0:0] OFF=122, LEN=352, flags=0x0
> > NR(7)  NAME                                  OFFSET HASH
> > SDKEY             
> >   0 .                                        184
> > 0000000000000000:0000000000000000 0000291:000002a
> >   1 ..                                       208
> > 0000000000000000:0000000000000000 0000291:000002a
> >   2 data                                     232
> > 0000000000000000:0000000000000000 00002a1:001cd53
> >   3 etc                                      256
> > 0000000000000000:0000000000000000 00002a1:0010000
> > 
> >   <cropped>
> > 
> Hello
> Tried to exclude the unwanted lines.  Came up with this grep with
> exclude... :

But can you read English? Can you find root directory entry and its
stat-data?

> # cat  fsck.reiser4-t.txt  | grep -v "CTAIL" | grep -v "LEVEL=" | grep -v
> "(nodeptr40):" | grep -v "====" | grep -v "\-\-\-\-\-" >result.txt
> Attaching the result output file,a lot smaller.
> 
> # ll  result.txt 
> -rw-r--r-- 1 root users 147419 Feb 27 02:32 result.txt
> 
> 
> Does that contain the wanted detail.
> --Glenn


