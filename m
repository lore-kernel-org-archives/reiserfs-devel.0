From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsprogs spec file bug report
Date: Wed, 5 Oct 2005 12:43:45 +0400
Message-ID: <200510051243.45427.vitaly@namesys.com>
References: <20051004211558.GB5368@internet2.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26405-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051004211558.GB5368@internet2.edu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Dan Pritts <danno@internet2.edu>

On Wednesday 05 October 2005 01:15, Dan Pritts wrote:
> Hi,

Hello!
 
> I just downloaded & built reiserfsprogs-3.6.19 on Red Hat EL 4.
> 
> This has a newer version of RPM than you've designed your SPEC
> file for, and suffers from problems described in these two URLs:
> 
>   1) http://www.rpm.org/hintskinks/debuginfo/
>   2) http://www.rpm.org/hintskinks/unpackaged-files/
> 
> 1) Before anything happens, I get:
> error: Package already exists: %package debuginfo
> 
> This is easily addressed by changing "%install" in a comment to "% install"
> 
> 2) At the end of the build process, i get:
> 
>    RPM build errors:
>     Installed (but unpackaged) file(s) found:
>    /rpm-filelist
> 
> It looks like you're using this rpm-filelist file as a temporary file
> to show what should go into the RPM.  Not clear why you store that
> information in a temp file instead of the spec file but i'm sure you
> have your reasons.
> 
> The rpm.org site suggests removing any such non-packaged files at the
> end of the %install phase, which would probably not work given what this
> file is for.  Perhaps moving this a file to /tmp is a better way to go
> but there may be reasons not to do this, either.
> 
> 
> i downloaded the equivalent SRPM from fedora core 4 and it "just built"
> using their spec file so i didn't put much more effort into fixing the
> problem myself, but i thought you'd be interested to know about this.  

yes, thank you, I will check it.

-- 
Vitaly
