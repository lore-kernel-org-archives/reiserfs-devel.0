From: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Subject: Re: reiserfs logging patches udpated
Date: Thu, 25 Mar 2004 20:02:06 +0100
Message-ID: <m3hdwchhsh.fsf@merlin.emma.line.org>
References: <1080149399.14737.77.camel@watt.suse.com>
	<20040324143516.3162cbfe.akpm@osdl.org>
	<1080168379.14743.124.camel@watt.suse.com>
	<200403250147.54246.bernd-schubert@web.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17475-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403250147.54246.bernd-schubert@web.de> (Bernd Schubert's
 message of "Thu, 25 Mar 2004 01:47:42 +0100")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Schubert <bernd-schubert@web.de>
Cc: reiserfs-list@namesys.com, Chris Mason <mason@suse.com>, Andrew Morton <akpm@osdl.org>

Bernd Schubert <bernd-schubert@web.de> writes:

>> It does, but the code has been in testing -suse and on the reiserfs
>> list.  This dooesn't mean data=ordered is perfect, but it's not quite
>> day one either.  I can switch the default back, but I'd rather have a
>> trial by fire ;-)
>
> Oh please not, just have a look at german newsgroups, there are real flamewars 
> about the stability of reiserfs. Everytime someone has a disk problem and a 
> reiserfs partion is affected by it, then there are more than a dozen answers 
> that its the fault of reiserfs. PLEASE, don't prove them right.

Sure, distros ship outdated reiserfsck and kernels, that can't fix half
of the real-life bugs and users don't switch off their write caches but
may switch off their machines - how's that supposed to work out?

> reported that his harddisk is ok, I told him to ask here. By his post here, 
> one could see, that his harddisk or ide connection was not so fine as he 
> previously stated, so we continued to discuss in on 
> de.comp.os.unix.linux.misc and finally could solve the problem by setting a 
> lower udma speed.

What's this got to do with reiserfs again if users are using broken
hardware with multi-metre-long illuminated cables?

> IMHO, almost all of the reported reiserfs problems are due to hardware errors, 
> but some are also due to patches which are enabled by default by 
> distributions like Suse or RedHat.

The patches are not a problem, but not updating the kernel when a
problem is being fixed in the upstream. We've been through this with
dozens of critical components, user-space, kernel-space, kernel support
utilities, go fix the distro.

They - SuSE in particular - won't even fix a security regression they've
introduced into a new release (for instance, into ntpd - 8.2 supported
broadcastclient, 9.0 did not - or openssh, they changed the sshd default
to UsePAM yes and ever since, PermitRootLogin without-password was
without effect and allowed for root logins - and without warning in the
admin's mailbox.).

> every ext2 partition by reiserfs on the next Suse-7.0 installation. Then the 
> problems arrived, since I also exported everything via nfs and since the Suse 
> installer had choosen the 3.5 format without warning me about it, I run into 
> serious trouble and reverted everything that was exported by nfs back to ext2 
> for the next 2 years.

The problem was not 3.5 format but the problem was "kernel bug". IIRC,
it had something to do with inode or dentry caching. I have used
reiserfs-3.5 without NFS problems and I have also been through SL 7.0,
7.3.

It appears SuSE's policy to sell bugfixes as the next release that
happens twice a year at most.

Given that data=ordered is only prudent as it prevents the common
failure cases, it should be the default in testing kernels at any rate.

> should be disabled by default. I wouldn't mind if it becomed included, but 
> marked as experimental, so that one can easily wouldn't include it in a 
> server kernel.

Server kernels in particular need data=ordered - of course, only if it
has stabilized.

-- 
Matthias Andree

Encrypt your mail: my GnuPG key ID is 0x052E7D95
