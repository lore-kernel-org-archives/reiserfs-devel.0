From: Marcel Hilzinger <marcel@hilzinger.hu>
Subject: Re: journal size reiserfs vs reiser4
Date: Thu, 1 Sep 2005 15:13:36 +0200
Message-ID: <200509011513.36586.marcel@hilzinger.hu>
References: <20050901134604.31ddd297@SiRiUS.home> <4316F9CC.2090904@namesys.com> <20050901150507.3d6f53c7@SiRiUS.home>
Reply-To: marcel@hilzinger.hu
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25781-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050901150507.3d6f53c7@SiRiUS.home>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-list@namesys.com

Am Donnerstag, 1. September 2005 15:05 schrieb Thomas Kuther:
> On Thu, 01 Sep 2005 16:53:32 +0400
>
> "Vladimir V. Saveliev" <vs@namesys.com> wrote:
> > Hello
> >
[...]
> >
> > reiser4 reserves 5% of disk space for its internal needs.
>
> Ah OK, that computes. So i'll go with reiserfs on that big one (11 GB
> for internal stuff is too much i have to admit).

If I remember well, you can adjust this value in the code.

=2D-=20
=C3=9Cdv=C3=B6zlettel -- Mit freundlichen Gr=C3=BCssen,
Marcel Hilzinger
