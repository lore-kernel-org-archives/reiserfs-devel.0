From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: noexec, nosuid
Date: Wed, 28 Aug 2002 17:26:23 +0400
Message-ID: <200208281726.23233.vitaly@namesys.com>
References: <3D6BAB29.1070604@iteso.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11334-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D6BAB29.1070604@iteso.mx>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?q?Jos=C3=A9=20Alberto=20Guzm=C3=A1n=20Ram=C3=ADrez?= <jose@iteso.mx>, reiserfs-list@namesys.com

On Tuesday 27 August 2002 20:39, José Alberto Guzmán Ramírez wrote:
>   Hi everyone,
>
>    I was looking at the mount manpage and at the web link it references
> http://namesys.com/mount-options.html to find out if reiserfs supports
> noexec and nosuid mount options or if there are any known issues with this.

There should not be any problem with these options, but if you have please
let us know about it.

> Alas there's no info on this matter and was wondering if you could tell
> me if there are issues with these options, or why aren't they documented?

mount-option.html describes only reiserfs specific options. Common mount 
options are described at mount man page.

>   I'm using Linux 2.4.18 with reiserfs 3.6.25 and quotas on a debian 2.2
> potato box with a 342 G array.

-- 

Thanks,
Vitaly Fertman
