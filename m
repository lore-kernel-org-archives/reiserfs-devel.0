From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: quick question about pack
Date: Fri, 7 Jun 2002 23:12:29 +0400
Message-ID: <200206072312.29524.vitaly@namesys.com>
References: <326.59.1023476026713@foce.eiomail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-10678-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <326.59.1023476026713@foce.eiomail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: timothy bauscher <timothy@foce.eiomail.com>
Cc: reiserfs-list@namesys.com

On Friday 07 June 2002 22:53, timothy bauscher wrote:
> unpack seems to compile by default, but pack
> does not. How can i tell ./configure to install
> pack as well?

debugreiserfs -p is used to pack reiserfs *metadata* 
from the specified partition. unpack unpacks the data 
into specified partition or file. This is to help 
developers to not fsck remotely but to get metadata 
and to test fsck locally.

The data themselves are skipped of course.

> I have looked at ./configure --help and the
> README and INSTALL files, but i haven't been
> able to find information specific to pack.
>
> Thanks in advance :)

-- 

Thanks,
Vitaly Fertman
