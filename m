From: Rene Rebe <rene@rocklinux-consulting.de>
Subject: Re: Reiser4 DOS
Date: Sun, 02 May 2004 15:54:19 +0200 (CEST)
Message-ID: <20040502.155419.607957586.rene@rocklinux-consulting.de>
References: <200405021539.05907.mbuesch@freenet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18362-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200405021539.05907.mbuesch@freenet.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: mbuesch@freenet.de
Cc: reiserfs-list@namesys.com

Hi,

On: Sun, 2 May 2004 15:38:47 +0200,
    Michael Buesch <mbuesch@freenet.de> wrote:

> #!/bin/sh
> mount -treiser4 /dev/hdX /mnt/reiser4
> cd /mnt/reiser4
> while `/bin/true`; do
> 	cd metas
> done

Are you sure this does not happen on other filesystem? This loop
mainly creates process creation pressure and is more likely some
scheduler thing than Reiser4.

Maybe you can cure this using:

while : ; do
...

Sincerely yours,
  Ren=E9 Rebe
    - ROCK Linux stable release maintainer

--  =

Ren=E9 Rebe - Europe/Germany/Berlin
  rene@rocklinux.org rene@rocklinux-consulting.de
http://www.rocklinux.org http://www.rocklinux-consulting.de

