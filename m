From: Oleg Drokin <green@namesys.com>
Subject: Re: =?koi8-r?B?09TSwc7O?=
	=?koi8-r?B?wdEg2sHQydPYINc=?= dmesg
Date: Tue, 24 Sep 2002 12:38:47 +0400
Message-ID: <20020924123847.A22203@namesys.com>
References: <3D902295.6010700@ap-plastic.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11520-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3D902295.6010700@ap-plastic.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Anton Erofeevskij <ae@ap-plastic.ru>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Sep 24, 2002 at 02:30:13PM +0600, Anton Erofeevskij wrote:

> [root@cpq370 root]# uname -a
> Linux cpq370.plastic 2.4.12 #7 SMP =F7=D4=D2 =EF=CB=D4 16 09:43:09 YEKST =
2001 i686=20
> unknown
> PAP-5710: reiserfs_paste_into_item: entry or pasted byte ([22 172943=20
> 0x1281001 IND]) exists

This is known race between two processes writing into file's hole located
at the end of a file.
This problem is fixed in 2.4.18.
Though this problem is not very dangerous by itself, you'd better
upgrade your kernel because there are more dangerous bugs present
in kernels prior to 2.4.18 including several data corrupting ones.

Bye,
    Oleg
