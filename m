From: Ragnar =?iso-8859-15?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Subject: Re: Advangates (A file-based interface for mount)
Date: Thu, 10 Jul 2003 04:55:45 +0200
Message-ID: <20030710025545.GB1160@vestdata.no>
References: <3F078EF1.6090908@mrs.umn.edu> <3F0C161B.6030707@namesys.com> <16140.7137.369855.682433@laputa.namesys.com> <877k6r8q7x.fsf@labatt.uhoreg.ca> <3F0C89FC.8060604@mrs.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14854-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F0C89FC.8060604@mrs.umn.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Wed, Jul 09, 2003 at 04:32:44PM -0500, Grant Miner wrote:
> Two reasons why this is nice:
> First, the permissions of ..mount could be inherited, so that users would=
=20
> be able to mount things in their home directories but not system=20
> directories.

That would be nice, but having the correct permissions for the mount-
point is not sufficient from a security perspective.

I suppose the user would need read (and write) permissions to the
device/file he's mounting from?=20

You would also need to avoid suid / sgid files and device-nodes - this
could probably be done by enforcing nosuid and nodev mount-flags. (Is
that enough? or are there filesystems that have suid-support but don't
support the nosuid flag?)

The last problem, which I don't see an easy solution for, is that the
filesystem-code in the kernel dosn't do sufficient data-checking that
it's safe to run it on user-controlled data. I'm sure that for most if
not all filesystems it will be possible to corrupt the metadata in a way
that will make the kernel crash or lock up - in some cases it may even
be possible to corrupt the data in such a way that it becomes a
security-problem? How could this be solved?

Personally I don't think it will ever be safe to let users mount from
user-controlled devices (files or block-devices) as long as the
filesystem-code is running in the kernel with full priveleges.

The only solution is to run the filesystem-code in userspace, like hurd
does.


Now. If all those problems were solved it would be possible to allow
users to mount any filesystem from any device on their writable
directories. But - I don't see why the mount-interface would need to be
changed? mount is already suid (on some systems, at least), and could
easily allow ordinary users to mount filesystems as well. (actually it
already does - but limited to filesystems listed in fstab with the
"user" option)

> Second, the file format makes is intuitive for specifying layered mounts =

> like plan 9.

A new mount interface is certainly no requirement for layered mounts -
if it's more intuitive or not is debatable. A central list of mounts may
become long and hard to read - but a decentralized list of mounts
certainly has it's drawbacks as well - how are you supposed to get a
complete list of what is mounted?



Basicly I think both user-mountable filesystems and layered mounts both
have their purposes, but theese features are ortogonal to a new mount-
interface.=20



--=20
Ragnar Kj=F8rstad
