From: Jason Holt <jason@lunkwill.org>
Subject: Re: Write-once file system
Date: Sat, 28 Jun 2003 07:45:09 +0000 (UTC)
Message-ID: <Pine.LNX.4.44.0306280736170.20105-100000@potato.zayda.com>
References: <20030627225410.GK31002@jensbenecke.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14771-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030627225410.GK31002@jensbenecke.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Benecke <written_030626@jensbenecke.de>
Cc: Fong Vang <FVang@Zantaz.com>, "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>


One other thought wrt Mike Young's comments; trust in the enforcement system
could be distributed cryptographically.  Say you go with my suggestion of
user-mode linux running on top of "real" linux which enforces your disk access
policies.  You have auditors observe the setting up of the machine, and
install a script on the "real" side which rotates the "real" root password
periodically to some random value.  It then splits up that password using a
cryptographic secret-splitting algorithm (they're extremely simple) and sends
the pieces to selected individuals.  They all have to get together and agree
to put their pieces together any time you need access to the "real" root
account.

This sort of setup could make a great network appliance for HIPPA shops.

Also,

On Sat, 28 Jun 2003, Jens Benecke wrote:
[...]
> I am using GrSecurity (www.getrewted.net), which is a kernel patch that
> allows detailed ACLs and kernel security enhancements. Once these
> enhancements are configured (at run-time) and "echo 1 >
> /proc/sys/kernel/grsecuity/lock" is executed, it is _not_ possible (even
> for root) to change them again. One of these features is the ability to
> insmod/rmmod, another is the ability to open sockets, another is the
> ability to access raw devices.
[...]

I looked a bit at grsecurity.net, but didn't find anything right off the bat
to explain how they accomplish this securely.  It sounds... really suspicious,
to me anyway.  Do they actually prevent root from, say, manually issuing the
machine code to talk to the disk?  Or does it just keep him from doing it via
the standard syscalls?

						-J



