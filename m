From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Subject: Re: Cross compiling reiserfsprogs-3.6.11
Date: Fri, 21 Nov 2003 14:34:43 +0100
Message-ID: <3FBE1473.4060102@gmx.net>
References: <3FBDF571.5070100@sysgo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16143-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FBDF571.5070100@sysgo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pavel Bartusek <pba@sysgo.com>
Cc: Reiserfs-List@namesys.com

Pavel Bartusek wrote:
> Hi list,
> 
> I have downloaded and tried to crosscompile the reiserfsprogs-3.6.11.
[...]
> -#define _GNU_SOURSE

Vitaly, are you aware that the above is a typo and will not work.


Regards,
Carl-Daniel

