From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: when distros do not support official Marcelo kernels they are
 not being team players
Date: Tue, 04 Feb 2003 02:55:55 +0100
Message-ID: <m3znpchkr8.fsf@merlin.emma.line.org>
References: <20030131115333.GC15359@marowsky-bree.de>
	<3E3A67AE.4050601@namesys.com>
	<20030131122147.GE15359@marowsky-bree.de>
	<3E3A6D76.7080300@namesys.com> <86lm0xpmho.fsf@trasno.mitica>
	<3E3E7A95.1050908@namesys.com>
	<1044284001.15685.358.camel@tiny.suse.com>
	<3E3EBA3F.7060806@namesys.com>
	<1044300746.15684.428.camel@tiny.suse.com>
	<3E3EC7EC.8090005@namesys.com>
	<20030203203439.GA4251@marowsky-bree.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12625-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030203203439.GA4251@marowsky-bree.de> (Lars Marowsky-Bree's
 message of "Mon, 3 Feb 2003 21:34:39 +0100")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Lars Marowsky-Bree <lmb@suse.de> writes:

> This is part of the deal: We support what we deliver. Anything else is not
> supported, and there are core pieces which void the entire warranty. Usually,
> such pieces include the kernel and glibc.

Well, "support" is something SuSE used to be MUCH better at. Unless you
can talk to a maintainer directly, you're getting less than 33% of
issues to feedback@suse.de past the defense line (aka 1st level support)
through to people who do real work. I know that all costs money, but why
not release less often and offer more updates in-between...

For example, a problem that bothers me right now, and to remain remotely
on-topic, I have a specific application pattern that drives ext3fs on
IDE drives mad on SuSE 8.1 with k_athlon-2.4.19-167 -- it will cause
high block-out rates to the drive, but the same application won't do
that on ext2fs, won't do that on reiserfs and won't do that on ext3fs
when on a SCSI drive. It's just ext3fs + IDE. Given that Andrew Morton
finds the bug which hogs some applications down big time, would SuSE
offer new kernels? That'd be "support".

> If you want someone to support your home-brew system - which is an entirely
> reasonable request - you are probably much better off paying a local smaller
> Linux company or some inspired college students. Or be prepared to pay a
> _really_ impressive sum to a commercial distributor ;-)

The idea is to have common standards, and the vanilla kernel is one
such. The diversification of kernels and their
bugfixes/tuning/... patches doesn't make it easier to maintain the
baseline code, because figuring if it's the distributor's patch, a
combination of patches, this all eats up and binds time that could be
better invested into the base line kernel. I understand it's too
conservative or at the wrong moment when a distro is released, but the
issue is that the "community" gets split up that way.

-- 
Matthias Andree
