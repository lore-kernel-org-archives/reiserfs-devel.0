From: "Sonke Ruempler" <ruempler@topconcepts.com>
Subject: Re: reiserfs bug
Date: Thu, 28 Nov 2002 10:04:10 +0100
Message-ID: <079a01c296bd$1d51f150$6600a8c0@topconcepts.net>
References: <072801c296b8$2cb01000$6600a8c0@topconcepts.net> <20021128114755.A2724@namesys.com> <077201c296bb$43b4ac40$6600a8c0@topconcepts.net> <20021128115708.A2792@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12066-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

> Sorry, but you seems to have faulty hardware (bad harddrive or something).
> Reiserfs cannot tolerate bad blocks in journal area right now.
> I'd suggest you to make a backup of your device and then to replace bad
> harddrive.

umm, that are originally freecom 20gig ide hdds in a firewire-case, i
replaced the hdds with 120gig maxtor hdds and they worked for 2 weeks until
today.

maybe the firewire<->ide converter is corrupted?

