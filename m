From: "David R. Bergstein" <dbergstein@comcast.net>
Subject: RE: LFS and Large File Support for reiserfs 3.6
 (kernel 2.4.19)
Date: Sun, 08 Sep 2002 08:53:07 -0400
Message-ID: <IMELKMOINBOOFMGACNMDKEOBCLAA.dbergstein@comcast.net>
References: <3D7A94EB.1590F710@baldauf.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-11403-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <3D7A94EB.1590F710@baldauf.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>

> -----Original Message-----
> From: Xuan Baldauf [mailto:xuan--reiserfs@baldauf.org]
> Sent: Saturday, September 07, 2002 8:08 PM
> To: Oleg Drokin
> Cc: David R. Bergstein; ReiserFS List
> Subject: Re: [reiserfs-list] LFS and Large File Support for reiserfs 3.6
> (kernel 2.4.19)
[snip]
>
> Maybe samba is limiting here? Usually, the copy operation should
> fail with "No
> space left on device" if the library or kernel is unable to
> handle the file size,
> it should not officially succeed and silently fail.
>

I was able to solve this issue by locally building samba-2.2.5.  It is
definitely not reiserfs, but Mandrake's samba-2.2.3 release that did not
have LFS enabled.


David R. Bergstein
Systems Engineer and Blues Musician -
http://mywebpages.comcast.net/dbergstein/
Heart of Blue - bookings on-line at http://www.heartofblue.com
OpenPGP Public Key 0xE1F138CA - For info see http://www.gnupg.org
Key fingerprint = C86E CA2A 4171 AC73 91D7  3DCE 8832 D764 E1F1 38CA


