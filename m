From: "David R. Bergstein" <dbergstein@comcast.net>
Subject: RE: LFS and Large File Support for reiserfs 3.6
 (kernel 2.4.19)
Date: Sat, 07 Sep 2002 21:37:46 -0400
Message-ID: <IMELKMOINBOOFMGACNMDAEOACLAA.dbergstein@comcast.net>
References: <20020907202709.A28312@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-11399-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020907202709.A28312@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>

> -----Original Message-----
> From: Oleg Drokin [mailto:green@namesys.com]
> Sent: Saturday, September 07, 2002 12:27 PM
> To: David R. Bergstein
> Cc: ReiserFS List
> Subject: Re: [reiserfs-list] LFS and Large File Support for
> reiserfs 3.6 (kernel 2.4.19)
>
>
> Hello!
>
> On Sat, Sep 07, 2002 at 12:09:21PM -0400, David R. Bergstein wrote:
>
> > I seem to have hit a file size limit on my system where files
> exceed 4GB in
> > size.  I do have an LFS capable glibc (glibc-2.2.4-10.1mdk) on
> Mandrake 8.1,
>
> 4Gb? Hm, strange number, usually LFS problems manifest themselves at
> 2Gb size.
>
> > running stock kernel 2.4.19, w/o additional patches applied.
> This prevents
> > me from backing up a large directory of video files over the
> network, since
> > the file truncates itself after 4GB is exceeded.  Any hints to
> solve this
>
> What tool do you use, have you tried something other?
>
> Bye,
>     Oleg
>

Hi Oleg,

I was running a Win2k ntbackup job over the network via samba.  I remember
fixing this issue quite some time ago by building samba locally, but it
appears that the version of samba may be at fault (samba-2.2.2-3.2mdk, from
Mandrake Update).  I will check to see if there is any separate issues by
running a dd command to create a large dummy file in the meantime.

- David


