From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: More on Hard Links
Date: Tue, 09 Dec 2003 21:53:59 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <87u149wfg8.fsf@uhoreg.ca>
References: <87k755y8xf.fsf@uhoreg.ca> <20031209234740.27534.qmail@web25010.mail.ukl.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16315-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Narcoleptic" == Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk> writes:

[...]

Narcoleptic> If there is a way to quickly and reliably verify that two
Narcoleptic> files are identical (or not), then when committing a
Narcoleptic> transaction, each file in the sync list can be resolved as
Narcoleptic> follows: ...

I'm temporarily confused and can't think straight.  I'll reply to this
proposal later.  My immediate reaction is that it doesn't solve the
problem that I brought up, but I'll think about it later.

[...]

>> >> It's hard to differentiate that from the volume just being
>> unmounted.

Narcoleptic> There is no need to differentiate from a volume going down
Narcoleptic> and just being unmounted.

There is, because if a volume is just unmounted, then you can go ahead
and prevent writes to a file that is shared on that volume.  But if the
volume dies for some reason, the filesystem should allow writes, since
you can't mount the dead volume to re-allow writes.  So that file
becomes perpetually unwritable.

I suppose that you could write a recovery program such that you enter a
dead volume's ID, and it searches through the other volumes and cleans
up the now-dead links.  It might be annoying to have to do that, but I
suppose it's doable.  Of course, that's assuming you've recorded the
volume ID... :-/

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

