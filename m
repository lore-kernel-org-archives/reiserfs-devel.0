From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: Problem with my HDD
Date: Wed, 29 May 2002 17:19:30 -0400
Message-ID: <200205291719.30901.kuba@mareimbrium.org>
References: <10512850437.20020529194929@starfall.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10439-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <10512850437.20020529194929@starfall.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Cookie-Monster <cookie.monster@starfall.de>
Cc: reiserfs-list@namesys.com

On =B6roda 29 maj 2002 01:49 pm, Cookie-Monster wrote:
> Hi everybody
>
> I hope you can help me. I formated on of my Server-HDDs with ReiserFS
> version, which has been distributed in SuSE Linux 7.3. Sorry, but I
> don't know the version, cause I'm know running SuSE Linux 8.0.
>
> My Problem is, that the HDD cannot be mounted anymore:
>
> 1.   fileserver:/ # mount /dev/sda1 /ftp/apps/
> 2.   mount: Not a directory

try
# ls -la /ftp/apps
# mkdir /ftp/apps
and say what happens

Also, try
# dmesg
and see if there are any read errors on your drive. if there are, you're ou=
t=20
of luck... get a new drive

Cheers, Kuba
