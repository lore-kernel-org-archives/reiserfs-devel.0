From: Jens Benecke <jens-unibw@spamfreemail.de>
Subject: Re: Strange errors with 2.4.22 patches (from Chris) and bonnie++
Date: Tue, 02 Dec 2003 09:35:33 +0100
Sender: news <news@sea.gmane.org>
Message-ID: <bqhisl$7il$1@sea.gmane.org>
References: <bq8f7u$ufn$1@sea.gmane.org> <1070286549.12807.22.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16200-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Chris Mason wrote:

> On Fri, 2003-11-28 at 16:38, Jens Benecke wrote:
>=20
>> b) bonnie++ on a (previously created) reiserfs partition (with
>>    mkreiserfs 3.6.6) exited with random "disk full" errors, although
>>    the disk was never full. This didn't happen before.
>> (...)
>> I would appreciate any help. Thank you! :-)
>=20
> Ugh, the new block allocator isn't properly forcing a commit when an
> allocation fails, so we don't reclaim blocks deleted in an uncommitted
> transaction.  I thought this fix got pulled out of the suse kernel when
> namesys and I pulled out the important bug fixes, but it got missed.
>=20
> porting.

Hi Chris,

so... the worst-case impact on this bug is that reiserfs will report "disk
full" when you still have some space available. Right? No data loss,
corruption, or similar Bad Things(tm)?

I have two servers here that are supposed to be deployed next week and use
ReiserFS. I've had some bad issues with MySQL files becoming corrupted
after a crash in the past so I'd really like to put these into production
with data-logging patches.

btw, what are the patches that SuSE uses? IIRC, SuSE ships with data-logging
enabled, right?


--=20
Jens Benecke (jens-unibw@spamfreemail.de)
http://www.hitchhikers.de - Europaweite kostenlose Mitfahrzentrale
http://www.spamfreemail.de - 100% saubere Postf=E4cher - garantiert!
http://www.rb-hosting.de - PHP ab 9? - SSH ab 19? - g=FCnstiger Traffic

