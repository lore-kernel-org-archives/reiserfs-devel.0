From: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Subject: Re: reiserfs on removable media
Date: Wed, 02 Jul 2003 16:19:28 -0400
Message-ID: <pan.2003.07.02.16.19.28.146493.20132@umail.hungrycats.org>
References: <pan.2003.07.02.14.23.09.812119.20132@umail.hungrycats.org> <20030702124544.Z7414@schatzie.adilger.int> <20030702124544.Z7414@schatzie.adilger.int> <3F032A33.3050303@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-14811-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wed, 02 Jul 2003 14:53:39 -0400, Hans Reiser wrote:
> Remind me about removable media around January, and we'll write some
> code for reiser4 to make it more graceful for it (somehow prompt the
> user to insert disk, etc.)

Ow!  Ow!  Ow!  Kernel prompting the user...  Ow!  ;-)

Now, "kernel notifying an automounter daemon process, which talks to the
user in user-space" is somewhere in the realm of possibility...

Actually to be clear there are two topics here:  removable _media_ and
removable _drives_.  e.g. a typical IDE disk is non-removable media in a
non-removable drive.

A floppy disk in a typical floppy drive is removable media in a
non-removable drive, but a floppy disk in a USB floppy drive is removable
media in a removable drive.  Practically speaking there's not much
difference--if the drive was removed, you'd have to assume the media was
removed as well, if only because there's no way to receive media-change
notifications if the drive isn't connected.

The USB drive I wrote about earlier is a desktop non-removable IDE disk in
a removable drive.

The difference is subtle but it does allow for some interesting stuff to
happen in the block device layer.  The hard drive has a serial number,
which (in theory) could be queried by the USB storage layer and used as a
unique identifier for the drive.  This could e.g. suspend all read/write
requests to the drive while it is disconnected, and resume said requests
when it is reconnected.  That's all I'd need for my laptop setup
(assuming I don't connect the drive somewhere else, that is)...and it
doesn't require changing one line of reiserfs.
