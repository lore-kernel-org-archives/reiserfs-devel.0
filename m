From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: http://www.namesys.com/snapshots/2004.06.14-internal.testing/
Date: Tue, 15 Jun 2004 01:27:42 +0400
Message-ID: <200406150127.42697.vitaly@namesys.com>
References: <200406150022.34578.vitaly@namesys.com> <20040614210531.GU4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19186-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040614210531.GU4990@nysv.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Markus =?utf-8?q?T=D0=96rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

On Tuesday 15 June 2004 01:05, Markus T=D0=96rnqvist wrote:
> On Tue, Jun 15, 2004 at 12:22:34AM +0400, Vitaly Fertman wrote:
> >When you run fsck.reiser4 on your old reiser4 filesystem it should report
> >about missed plugin set members in the root directory. fsck should be ab=
le
> >to fix it running with the --fix option.
>
> I tried this on the image I ran bonnie++ while fsck'ing on.
> It suggested --rebuild-sb first, then I did --rebuild-sb --fix and
> it worked.
>
> Any ideas or caveats about how to handle my root partition with this?
>
> Do I have to boot my emergency medevac partition and do --fix from there?

or you can remount it ro, fsck, reboot. it should work also now.
--=20
Thanks,
Vitaly Fertman

