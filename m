From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfs bug
Date: Thu, 28 Nov 2002 12:09:59 +0300
Message-ID: <20021128120959.A2904@namesys.com>
References: <072801c296b8$2cb01000$6600a8c0@topconcepts.net> <20021128114755.A2724@namesys.com> <077201c296bb$43b4ac40$6600a8c0@topconcepts.net> <20021128115708.A2792@namesys.com> <079a01c296bd$1d51f150$6600a8c0@topconcepts.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12067-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <079a01c296bd$1d51f150$6600a8c0@topconcepts.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sonke Ruempler <ruempler@topconcepts.com>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Hello!

On Thu, Nov 28, 2002 at 10:04:10AM +0100, Sonke Ruempler wrote:
> > Sorry, but you seems to have faulty hardware (bad harddrive or something).
> > Reiserfs cannot tolerate bad blocks in journal area right now.
> > I'd suggest you to make a backup of your device and then to replace bad
> > harddrive.
> umm, that are originally freecom 20gig ide hdds in a firewire-case, i
> replaced the hdds with 120gig maxtor hdds and they worked for 2 weeks until
> today.
> maybe the firewire<->ide converter is corrupted?

I do not know. Your log indicates that your scsi subsystem encountered errors.
But I do not know actual source of errors. May be if you enable more verbose
scsi errors reporting it will give you some clue. (like what command
failed, what was the error code and this kind of stuff).

Bye,
    Oleg
