From: Jens Benecke <jens-unibw@spamfreemail.de>
Subject: Re: Strange errors with 2.4.22 patches (from Chris) and bonnie++
Date: Thu, 04 Dec 2003 13:44:32 +0100
Sender: news <news@sea.gmane.org>
Message-ID: <bqna7g$8gg$1@sea.gmane.org>
References: <bq8f7u$ufn$1@sea.gmane.org> <1070286549.12807.22.camel@tiny.suse.com> <bqhisl$7il$1@sea.gmane.org> <1070478784.27611.105.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16223-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Chris Mason wrote:

>> so... the worst-case impact on this bug is that reiserfs will report
>> "disk full" when you still have some space available. Right? No data
>> loss, corruption, or similar Bad Things(tm)?
>>=20
> Correct.  I'll have a fix available today along with a remerge of data
> logging and quota against 2.4.23.

Thank you!
=20
>> btw, what are the patches that SuSE uses? IIRC, SuSE ships with
>> data-logging enabled, right?
> SUSE ships data logging and the xattr patches, along with a few others.

What patches exactly?=20
Are they available in public to be applied to a vanilla kernel?


--=20
Jens Benecke (jens-unibw@spamfreemail.de)
http://www.hitchhikers.de - Europaweite kostenlose Mitfahrzentrale
http://www.spamfreemail.de - 100% saubere Postf=E4cher - garantiert!
http://www.rb-hosting.de - PHP ab 9? - SSH ab 19? - g=FCnstiger Traffic

