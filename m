From: michael chang <thenewme91@gmail.com>
Subject: Re: Apparent fsck failure ...
Date: Thu, 18 Aug 2005 15:57:39 -0400
Message-ID: <b14e81f00508181257ba60bc8@mail.gmail.com>
References: <1124392060.12959.5.camel@linux.site>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25560-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1124392060.12959.5.camel@linux.site>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill.Wilken@comcast.net
Cc: reiserfs-list@namesys.com

On 8/18/05, Bill Wilken <bill.wilken@comcast.net> wrote:
> because dev/hda2 is mounted with write permissions (See below) Why
> wouldn't you mount a hard drive partition with write permissions?

Because then something can write to the partition when fsck is
working.  Solution? Remount read only.

Same with ext2/3 and everything else, IIRC....

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
