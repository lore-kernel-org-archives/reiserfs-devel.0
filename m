From: Jens Benecke <jens@spamfreemail.de>
Subject: Re: v3 logging speedups for 2.6
Date: Wed, 14 Jan 2004 13:47:35 +0100
Sender: news <news@sea.gmane.org>
Message-ID: <bu3dp7$q9a$1@sea.gmane.org>
References: <1071166228.11147.122.camel@tiny.suse.com> <2652990.fVlIM9mB2a@spamfreemail.de> <1073919431.32706.843.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16498-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Chris Mason wrote:

>> > ftp.suse.com/pub/people/mason/patches/data-logging
experimental/2.6.0-test11
>> Does it make sense to apply those to 2.6.1-mm2?
>>=20
> Not those at least, since I managed to screw up the diff.  I've got a
> 2.6.1 directory under experimental now with better patches.
> I'm checking now to see if they apply to -mm2.

I made a patch but it seems GMane doesn't forward attachments. There were
only three (somewhat trivial) rejects, so if you need the patch just say
so, I'll mail it privately.
=20
>> Does "except the data=3Dordered changes" mean that data journalling ist
>> _not_ in there, or that that data journalling is there but hasn't been
>> updated to what is there for 2.4.x yet?
> Correct, but I'm almost there.  Thing got off track a lot during xmas
> break.

Great! :-)
Thanks!


--=20
Jens Benecke (jens at spamfreemail.de)
http://www.hitchhikers.de - Europaweite kostenlose Mitfahrzentrale
http://www.spamfreemail.de - 100% saubere Postf=E4cher - garantiert!
http://www.rb-hosting.de - PHP ab 9? - SSH ab 19? - g=FCnstiger Traffic

