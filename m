From: Jens Benecke <jens-unibw@spamfreemail.de>
Subject: Re: Strange errors with 2.4.22 patches (from Chris) and bonnie++
Date: Mon, 01 Dec 2003 09:02:45 +0100
Sender: news <news@sea.gmane.org>
Message-ID: <bqesj5$i4c$1@sea.gmane.org>
References: <bq8f7u$ufn$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16184-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: reiserfs-list@namesys.com

Jens Benecke wrote:

> a) Synchronizing with drbd (www.drbd.org) shared devices slowed down to
>    a crawl. I guess this might have something to do with the way drbd
>    inserts itself between block device and file system and the changed
>    sync behavoiur.
>    Sync rates were >5000k/s before and <500k/s after I patched.

Hi,

followup: (a) has been solved, it's not the ReiserFS patches, it was
(seemingly) bad interaction between hardware (network) and software
(drivers).


--=20
Jens Benecke (jens-unibw@spamfreemail.de)
http://www.hitchhikers.de - Europaweite kostenlose Mitfahrzentrale
http://www.spamfreemail.de - 100% saubere Postf=E4cher - garantiert!
http://www.rb-hosting.de - PHP ab 9? - SSH ab 19? - g=FCnstiger Traffic

