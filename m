From: Xuan Baldauf <xuan--reiserfs@baldauf.org>
Subject: Re: LFS and Large File Support for reiserfs 3.6 (kernel 
 2.4.19)
Date: Sun, 08 Sep 2002 02:08:11 +0200
Message-ID: <3D7A94EB.1590F710@baldauf.org>
References: <IMELKMOINBOOFMGACNMDIENOCLAA.dbergstein@comcast.net> <20020907202709.A28312@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11402-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Oleg Drokin <green@namesys.com>
Cc: "David R. Bergstein" <dbergstein@comcast.net>, ReiserFS List <reiserfs-list@namesys.com>



Oleg Drokin wrote:

> Hello!
>
> On Sat, Sep 07, 2002 at 12:09:21PM -0400, David R. Bergstein wrote:
>
> > I seem to have hit a file size limit on my system where files exceed =
4GB in
> > size.  I do have an LFS capable glibc (glibc-2.2.4-10.1mdk) on Mandra=
ke 8.1,
>
> 4Gb? Hm, strange number, usually LFS problems manifest themselves at
> 2Gb size.

Maybe samba is limiting here? Usually, the copy operation should fail wit=
h "No
space left on device" if the library or kernel is unable to handle the fi=
le size,
it should not officially succeed and silently fail.

>
>
> > running stock kernel 2.4.19, w/o additional patches applied.  This pr=
events
> > me from backing up a large directory of video files over the network,=
 since
> > the file truncates itself after 4GB is exceeded.  Any hints to solve =
this
>
> What tool do you use, have you tried something other?
>
> Bye,
>     Oleg

--
Mit freundlichen Gr=FC=DFen

Xu=E2n Baldauf
Medium.net Internet Server Software


