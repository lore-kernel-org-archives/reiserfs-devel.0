From: Joachim Zobel <jzobel@heute-morgen.de>
Subject: Re: undelete
Date: Sun, 06 Nov 2005 13:51:07 +0100
Message-ID: <1131281467.4478.6.camel@test.asus>
References: <871119507.20051103221858@pobox.com>
Reply-To: jzobel@heute-morgen.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26789-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <871119507.20051103221858@pobox.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Chris Drake <christopher@pobox.com>

Am Donnerstag, den 03.11.2005, 22:18 +1100 schrieb Chris Drake:
> The most important feature of Microsofts new server file-system
> announcement is the ability to easily "undelete":-
> http://www.microsoft.com/windowsserver2003/evaluation/overview/technologies/storage.mspx
> 
> Could this be incorporated into reiserfs ?  (including the recovery of
> overwritten files etc of course)

Are you referring to the "Volume Shadow Copy Service"? This is not a FS
feature, it is AFAIK implemented below in the "block device layer" (this
has quite shure a different name on windows). You can do the same thing
on Linux with LVM (it was however not usable with LVM2 on my system at
the beginning of the year).

A real file system undo would however be really good to have.

Sincerely,
Joachim



