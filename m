From: Vladimir Shebordaev <vladimir.shebordaev@gmail.com>
Subject: Re: using debugfs.reiser4 options to access R4 on /dev/sdb
Date: Tue, 24 Feb 2015 23:22:12 +0300
Message-ID: <1424809332.12259.67.camel@home.ted.local>
References: <2a39c4776614cb7a675f299083a3627a@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version:content-transfer-encoding;
        bh=xJ3N5aY6wYUewF7dpQNesTzDfpE51PjhsWZNnRcGDEw=;
        b=KJd7D4HZ23oqy7tfpGMaxdjr2M13Ck3h3FtiZOJGL2Aa6XgwWOOMzRjkljf+/ao4tM
         LGHOeNluxaBjy3wfheR42bhNsGa2JdHL/cXnQ/lNenJATZ/uWlm2IZ1aMkk8wbG1qxg2
         L2rEb1I24G0Yjwf+NzmUn2PVRSj0ntSGVNyrPgwTmSBcazD+2p7fqsP5LjskYXlVZaH0
         7cAamxecGw+1dCUeso+3W4OcASGqxPbAmMrWwjaI6mDfd1+F4xTMtmV00FBh6cCAYtQQ
         Rp4UO9LoZH/yCaecCUsriXpCZPkXUXtxO/Iz2cavdnrPMTt8YBpwKsTZ3U832munn7tB
         dEEw==
In-Reply-To: <2a39c4776614cb7a675f299083a3627a@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

On Wed, 2015-02-25 at 01:24 +1100, doiggl@velocitynet.com.au wrote:
> Hello,
> Are there any switches with using 'debugfs.reiser4' to help using mount or
> print details on R4 disk/partition. Im trying get to access /dev/sdb

Well, most of the switches enable some very specific data dumps. You can
use for sure 

-l to dump all plugins known to libreiser4
-p to show default profile
-t to dump the tree
-n <file> to dump all nodes where <file> resides

I guess, the tree dump is the most curious data you can get out of that
disk. 

But did you use some released reiser4/progs version when you created
filesystem that time? It seems, you've got reiser4 and progs in some
inconsistent state. I guess, it is the reason for unexpected fsck
behavior that Edward was talking about.  

By the way, do you have something valuable on that disk? Latest release
from sf.net is expected to work out of the box, you could use it to
format the disk anew.


> Thanks Glenn
> 
> /dev/sdb problem encountered:
> ============================
> http://www.spinics.net/lists/reiserfs-devel/msg04665.html
> 
> # which debugfs.reiser4                                                   
>                                                                          
> /usr/sbin/debugfs.reiser4
> 
> # debugfs.reiser4 -V
> debugfs.reiser4 1.0.9
> 
> #  debugfs.reiser4
> Usage: debugfs.reiser4 [ options ] FILE
> Browsing options:
>   -k, --cat FILE                browses passed file like standard
>                                 cat and ls programs.
> Print options:
>   -s, --print-super             prints the both super blocks.
>   -t, --print-tree              prints the whole tree.
>   -j, --print-journal           prints journal.
>   -d, --print-oid               prints oid allocator data.
>   -a, --print-alloc             prints block allocator data.
>   -b, --print-block N           prints block by its number.
>   -n, --print-nodes FILE        prints all nodes file lies in.
>   -i, --print-file FILE         prints all items specified file
>                                 consists of.
> Metadata options:
>   -P, --pack-metadata           fetches filesystem metadata and writes it
>                                 to standard output.
>   -U, --unpack-metadata         uses metadata stream from stdandard input
>                                 to construct filesystem by it.
> Space options:
>   -O, --occupied-blocks         works with occupied blocks only(default).
>   -F, --free-blocks             works with free blocks only.
>   -W, --whole-partition         works with the whole partition.
>   -B, --bitmap                  works with blocks marked in the bitmap
> only.
> Plugins options:
>   -p, --print-profile           prints the plugin profile.
>   -l, --print-plugins           prints known plugins.
>   -o, --override TYPE=PLUGIN    overrides the default plugin of the type
>                                 "TYPE" by the plugin "PLUGIN" in the
>                                 profile.
> Common options:
>   -?, -h, --help                prints program usage.
>   -V, --version                 prints current version.
>   -f, --force                   makes debugfs to use whole disk, not
>   -y, --yes                     assumes an answer 'yes' to all questions.
>                                 block device or mounted partition.        
>                            
>   -c, --cache N                 number of nodes in tree buffer cache
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


