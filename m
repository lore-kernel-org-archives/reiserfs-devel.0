From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Compile problem with reiser4progs
Date: Thu, 8 Jan 2004 16:39:59 +0300
Message-ID: <200401081638.41382.vitaly@namesys.com>
References: <3FFD48F2.5050306@vrt.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16438-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FFD48F2.5050306@vrt.be>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kris Van Bruwaene <kris.vanbruwaene@vrt.be>, reiserfs-list@namesys.com

On Thursday 08 January 2004 15:11, Kris Van Bruwaene wrote:
> Hi
>
> I installed and patched kernel 2.6.0 exactly as described in the
> procedure on the site (install_v4.html), compiled libaal and configured
> reiser4progs (both without any options), and when 'make'ing reiser4progs
> I got the following error messages:
> libaal.c:13 multiple definition of 'libreiser4_max_interface_version'
> reiseprogs-0.4.20/libreiser4/libreiser4.c:242: first defined here
> collect 2: ld returned 1 exit status
>
> I'm using gcc 3.2.3

oh, this is a bug, the wrong version method in libaal, strange 
that it has not been revealed yet. We are cleanuping it.

-- 
Thanks,
Vitaly Fertman
