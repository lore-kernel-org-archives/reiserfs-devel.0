From: "David R. Bergstein" <dbergstein@comcast.net>
Subject: RE: reiserfsck question - session results
Date: Mon, 29 Jul 2002 07:20:45 -0400
Message-ID: <IMELKMOINBOOFMGACNMDOEFHCLAA.dbergstein@comcast.net>
References: <20020729100033.A13890@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-11092-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020729100033.A13890@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Oleg,

Thanks very much for this information.  I sounds like what I did overall
suppressed several harnless messages, i.e., by mounting the root reiserfs
read-write, and skipping fsck in the initscripts.  From what you are saying,
journal replay can also work safely when even a reiserfs fs is mounted
read-only.  Is the warning message about journal replay on read-only
filesystems outdated and if so, will it be removed sometime in the near
future?

Regards,

- David

David R. Bergstein
Systems Engineer and Blues Musician -
http://mywebpages.comcast.net/dbergstein/
Heart of Blue - bookings on-line at http://www.heartofblue.com
OpenPGP Public Key 0xE1F138CA - For info see http://www.gnupg.org
Key fingerprint = C86E CA2A 4171 AC73 91D7  3DCE 8832 D764 E1F1 38CA

> -----Original Message-----
> From: Oleg Drokin [mailto:green@namesys.com]
> Sent: Monday, July 29, 2002 2:01 AM
> To: David R. Bergstein
> Cc: reiserfs-list
> Subject: Re: [reiserfs-list] reiserfsck question - session results
>
>
> Hello!
>
> On Mon, Jul 29, 2002 at 12:43:08AM -0400, David R. Bergstein wrote:
>
> > It turned out there was no problem after I ran reiserfsck, it was an
> > initscript issue, specifically in /etc/rc.d/rc.sysinit on
> Mandrake 8.1.  The
> > script assumes that the root filesystem is first mounted
> read-only, however I
> > had previously taken steps to ensure that this reiserfs
> partition is mounted
> > read-write so journal replays work correctly.  This resulted in
> the boot time
>
> In fact journal replays work ok even with readonly mounts. So
> mounting rootfs
> readonly is not required in reiserfs case.
>
> Bye,
>     Oleg
>


