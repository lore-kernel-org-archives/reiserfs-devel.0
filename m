From: Metztli Information Technology <jose.r.r@metztli.com>
Subject: Re: Making a test version of Bullseye as a GCE image available?
Date: Thu, 25 Mar 2021 15:22:17 -0700
Message-ID: <7ccfdb59794f9f1eddc845141dd1c3e6b879e46d.camel@metztli.com>
References: <YFjZS8DsVQQeE5Ov@mit.edu>
         <3502816731a314939e4dc04edd5c1ce2744bda11.camel@metztli.com>
         <YFyjFt/lmE6ECGcS@mit.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=8RZJr7rpYeHiP6WceJRt920FbUL9za0Nv+mWI5pW7yQ=;
        b=EQ4c2LdVedBCOSXvRFPKBMvB21q2+vL7gwQBLuPCDdmgq8sEARRdtHBXFtBYhWCSN4
         Rc94wEoKwApdy8P3PsXxhlUXppJc6u/wJxe22lnNY2Z9Bf2EeTU8vuPWYHKDXPJt381A
         Q3rt4NVbz8FGFUOM1pzhnpOX+x8zbE4BL0Ix9BVP5HdxWVMTSm0ky4HyEFrQ5Kh7CQ4H
         2N9Da5HhxV8h3slqb/J1EU/tTGyprlKewigpq5beXvEhStugCxgJDY3GyeM7QpqWTrHz
         CST91XqQjds/7/1RBkL6q6tSI79roXnvaEQLsFNGbv2TkWRl092Z0afVssBiqlG7M5cv
         B/Ag==
In-Reply-To: <YFyjFt/lmE6ECGcS@mit.edu>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Theodore Ts'o <tytso@mit.edu>
Cc: debian-cloud@lists.debian.org, Edward Shishkin <edward.shishkin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On Thu, 2021-03-25 at 10:49 -0400, Theodore Ts'o wrote:
> On Wed, Mar 24, 2021 at 10:38:33PM -0700, Metztli Information
> Technology wrote:
> > Note, however, that when I built reiser4 SFRN 4 -enabled 5.10.23
> > kernel
> > for Debian 11 Bullseye a few days ago, I had to use the guest
> > environment for Debian 10 Buster since there was not even a repo
> > for
> > bullseye 
> > < https://github.com/GoogleCloudPlatform/compute-image-packages >
> > to
> > include in /etc/apt/sources.list.d/google-cloud.list
> 
> I just checked, and while the documentation in:
> 
>    https://github.com/GoogleCloudPlatform/compute-image-packages
> 
> hasn't been updated to include Bullseye, but if you follow the
> pattern
> given:
> 
>    Add a source list file /etc/apt/sources.list.d/google-cloud.list
> and
>    change DIST to either stretch for Debian 9 or buster for Debian
> 10:
> 
>    DIST=stretch
>    sudo tee /etc/apt/sources.list.d/google-cloud.list << EOM
>    deb http://packages.cloud.google.com/apt google-compute-engine-
> ${DIST}-stable main
>    deb http://packages.cloud.google.com/apt google-cloud-packages-
> archive-keyring-${DIST} main
>    EOM
> 
> And you use "bullseye" for DIST, it appears, that if you look at:
> 
> https://packages.cloud.google.com/apt/dists/...
> 
> the relevant subdirectories (e.g.,
> google-compute-engine-bullseye-stable) do exist and appear to be
> populated.
Cool. The reiser4 GCE image is not obsolete, though, as the above
bullseye repos -- in addition to the buster ones -- were additionally
specified in the file:
/etc/apt/sources.list.d/google-cloud.list

and, as shown in either of the videos previosly cited [1], can be
enabled by simply editing the relevant file, wielding root/sudo
privilege, and deleting the leading '#' char(s) from the bullseye
directives and commenting out and/or deleting the whole buster line
directives.

Once those modifications are made and the file saved, the process of
upgrading the Linux Guest Tools in the image is as simple (and typical)
as:
apt-get update && apt-get upgrade

That's it!

Caveat: *do not* do a 'dist-upgrade' as I did in the cited videos[1] --
as the running reiser4 enabled Debian kernel cloud image is 5.10.23-2
but the Debian Bullseye team has recently realeased kernel 5.10.24-x

Evidently, doing a 'dist-upgrade' would install the Debian Bullseye
kernel cloud image -- which is not enhanced with reiser4 and does not
include support for JFS (among others features) in the cloud either.

On the other hand, our reiser4 debian kernel hacks -- baremetal and
cloud -- support JFS (with fixes backported from 5.11) as well as HPFS
(in case IBM attains enlightenment and decides to release OS/2 as
opensource ;-)
> 
> I haven't tried them using them, so I don't know how well they work,
> but it looks like they do exist and are ready for people to test them
> out and report issues.  (Insert standard caveat of using Debian
> Testing in production environments, of course.  If it breaks, you get
> to keep both pieces.  :-)
> 
> Cheers,
> 
>                                                 - Ted

Best Professional Regards.

[1]
< https://youtu.be/WvieIZNH8KM >

< https://metztli.blog/amatl/aS4 >
-- 
-- 
Jose R R
http://metztli.it
-----------------------------------------------------------------------
----------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.9.16 AMD64
-----------------------------------------------------------------------
----------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-----------------------------------------------------------------------
----------------------
or SFRN 5.1.3, Metztli Reiser5 https://sf.net/projects/debian-reiser4/
-----------------------------------------------------------------------
--------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/


