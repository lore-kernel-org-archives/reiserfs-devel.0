From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfs on removable media
Date: Thu, 3 Jul 2003 10:08:36 +0400
Message-ID: <20030703060835.GA9411@namesys.com>
References: <pan.2003.07.02.14.23.09.812119.20132@umail.hungrycats.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14815-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <pan.2003.07.02.14.23.09.812119.20132@umail.hungrycats.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Jul 02, 2003 at 02:23:13PM -0400, Zygo Blaxell wrote:

> - If the device is detached while a filesystem is mounted, reiserfs gets a
> whole lot of I/O errors (or worse) and immediately oopses.  It would be
> nice if reiserfs would handle this a bit more gracefully--it should at
> least let me kill processes with open files and umount the filesystem.
> OTOH many other things also oops with with current USB/firewire/scsi device
> driver stack too.  :-P

Write errors to data areas are not mostly "safe".
It's write errors into journal area that kill the thing.
Jeff Mahoney of SuSE have the patch that remounts the FS R/O in
case of such an event (I think he even posted some preliminary patches
here), it is what you most probably need in this case.

Bye,
    Oleg
