From: "David R. Bergstein" <dbergstein@comcast.net>
Subject: RE: LFS and Large File Support for reiserfs 3.6
 (kernel 2.4.19)
Date: Sat, 07 Sep 2002 22:32:01 -0400
Message-ID: <IMELKMOINBOOFMGACNMDGEOACLAA.dbergstein@comcast.net>
References: <IMELKMOINBOOFMGACNMDAEOACLAA.dbergstein@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-11400-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <IMELKMOINBOOFMGACNMDAEOACLAA.dbergstein@comcast.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>

> -----Original Message-----
> From: David R. Bergstein [mailto:dbergstein@comcast.net]
> Sent: Saturday, September 07, 2002 9:38 PM
> To: ReiserFS List
> Subject: RE: [reiserfs-list] LFS and Large File Support for
> reiserfs 3.6 (kernel 2.4.19)
>
>
> > -----Original Message-----
> > From: Oleg Drokin [mailto:green@namesys.com]
> > Sent: Saturday, September 07, 2002 12:27 PM
> > To: David R. Bergstein
> > Cc: ReiserFS List
> > Subject: Re: [reiserfs-list] LFS and Large File Support for
> > reiserfs 3.6 (kernel 2.4.19)
> >
> >
> > Hello!
> >
> > On Sat, Sep 07, 2002 at 12:09:21PM -0400, David R. Bergstein wrote:
> >
> > > I seem to have hit a file size limit on my system where files
> > exceed 4GB in
> > > size.  I do have an LFS capable glibc (glibc-2.2.4-10.1mdk) on
> > Mandrake 8.1,
> >
> > 4Gb? Hm, strange number, usually LFS problems manifest themselves at
> > 2Gb size.
> >
> > > running stock kernel 2.4.19, w/o additional patches applied.
> > This prevents
> > > me from backing up a large directory of video files over the
> > network, since
> > > the file truncates itself after 4GB is exceeded.  Any hints to
> > solve this
> >
> > What tool do you use, have you tried something other?
> >
> > Bye,
> >     Oleg
> >
>
> Hi Oleg,
>
> I was running a Win2k ntbackup job over the network via samba.  I remember
> fixing this issue quite some time ago by building samba locally, but it
> appears that the version of samba may be at fault
> (samba-2.2.2-3.2mdk, from
> Mandrake Update).  I will check to see if there is any separate issues by
> running a dd command to create a large dummy file in the meantime.
>
> - David
>
>
>

[dbergst@zeus tmp]$ 8192+0 records in
8192+0 records out

[1]+  Done                    dd if=/dev/zero of=large_file_test bs=1024k
count
8192
[dbergst@zeus tmp]$ ls -alh
total 8.1G
drwxr-xr-x    2 dbergst  dbergst        80 Sep  7 22:02 ./
drwx------   31 dbergst  dbergst      1.7k Sep  7 11:25 ../
-rw-rw-r--    1 dbergst  dbergst      8.0G Sep  7 22:29 large_file_test
[dbergst@zeus tmp]$

Well, that worked fine.  At this point I consider this to be a samba issue
and will do a local build of the latest release (2.2.5).

David R. Bergstein
Systems Engineer and Blues Musician -
http://mywebpages.comcast.net/dbergstein/
Heart of Blue - bookings on-line at http://www.heartofblue.com
OpenPGP Public Key 0xE1F138CA - For info see http://www.gnupg.org
Key fingerprint = C86E CA2A 4171 AC73 91D7  3DCE 8832 D764 E1F1 38CA


