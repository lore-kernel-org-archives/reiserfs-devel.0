From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: when distros do not support official Marcelo kernels they are not being team players
Date: Tue, 4 Feb 2003 04:32:44 +0100
Message-ID: <20030204033244.GA17331@merlin.emma.line.org>
References: <3E3A6D76.7080300@namesys.com> <86lm0xpmho.fsf@trasno.mitica> <3E3E7A95.1050908@namesys.com> <1044284001.15685.358.camel@tiny.suse.com> <3E3EBA3F.7060806@namesys.com> <1044300746.15684.428.camel@tiny.suse.com> <3E3EC7EC.8090005@namesys.com> <20030203203439.GA4251@marowsky-bree.de> <m3znpchkr8.fsf@merlin.emma.line.org> <200302040224.h142OJa0030111@turing-police.cc.vt.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12633-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200302040224.h142OJa0030111@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Mon, 03 Feb 2003, Valdis.Kletnieks@vt.edu wrote:

> The important question is, of course, what the *proper* disposition of the
> other 67% should be. Are the other 67% *also* real bugs, or are they
> pilot error, RTFM/FAQ, "Oh that's already fixed in the patch we're about
> to ship", etc etc?

This isn't really the place to discuss SuSE policy that is unrelated to
kernel/reiserfs or something; on topic, they haven't updated reiserfs to
3.6.4. Besides that, I usually only report real issues and I think that
less than 1/6 of my reports are false in the sense of not being bug
reports.

SuSE seem to have a lot of time to help an individual
who hosed his system by installing a vendor driver compiled with wrong
options -- OTOH, there are problems: gfxboot (security), NTP (critical
regression, bcastclient, reported against SuSE 7.3), leafnode-1.9.19
(critical, locking doesn't work), lpr (critical) are unfixed still --
and numerous issues I haven't bothered to report, because what good is
adding new reports if the old aren't being worked on?

How dare they waste time helping with nonstandard setups when even the
shipped software doesn't work right?
