From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Another panic!
Date: Sun, 21 Nov 2004 19:20:31 +0200
Message-ID: <20041121172031.GW26192@nysv.org>
References: <20041121163755.GV26192@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22468-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20041121163755.GV26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Sun, Nov 21, 2004 at 06:37:55PM +0200, Markus T=F6rnqvist wrote:
>Nov 21 18:27:31 shrike kernel:  <1>Unable to handle kernel paging request =
at virtual address cf607e50
>Nov 21 18:27:31 shrike kernel:  printing eip:

Just for the record, seems to be totally reproducible; This time I didn't
get any info out of it before it totally locked.

Except for this:

Nov 21 19:28:21 shrike kernel: reiser4[http(12259)]: ext_by_ext_coord (fs/r=
eiser4/plugin/item/extent_file_ops.c:26)[vs-1650]:

Hope there's a cure for this :P

Thanks!

--=20
mjt

