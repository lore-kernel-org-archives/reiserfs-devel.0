From: Spam <spam@tnonline.net>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 19:26:07 +0100
Message-ID: <234966540.20041230192607@tnonline.net>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local>
 <m38y7gx8kq.fsf@merlin.emma.line.org>
 <20041230235911.4911a20c.hihone@bigpond.net.au>
 <m3sm5nj2ef.fsf@merlin.emma.line.org> <87is6jpvdu.fsf@quasar.esben-stien.name>
 <20041230174732.GB5206@favonius>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22967-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041230174732.GB5206@favonius>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com


 =20

> Esben Stien wrote (ao):
>> I really don't like that there is no undelete feature in reiserfs -
>> it's not planned for reiserfs-4 either. I see desperate users all the
>> time trying to get back what they mistakenly removed.

> If you 'see desperate users all the time' you might be amoung the wrong
> people ;-)

> Maybe you can clue them in the wonderful world of making backups?

  This is the standard Linux comment... But in reality, it just a way
  to say you do not know, or that linux lacks an (in this users
  opinion) important feature.

  In any case. Undelete has been since ages on many platforms. It IS a
  useful feature. Accidents CAN happen for many reasons and in some
  cases you may need to recover data.

  Besides, a deletion does not fully remove the data, but just unlinks
  it. In Reiser where there is tailing etc for small files this can be
  a problem. Either the little file might not be able to be recovered
  (shouldn't the data still exist, even if it is tailed), or the user
  need to use a non-tailing policy?

> Next time it is not their mistake, but instead a broken harddisk.
> Undelete wont save them then.

  Indeed. Backups are important. But the backup does not recover the
  last minute changes. They may be a day or a week old at best - even
  at larger sites!

> Or they just edited it instead of rm.
=B4
  well, overwritten data is not so easy to get back. But from what I
  understand in Linux, is that many applications actually write
  another file and then unlinks the old file? If that is the case then
  it may even be possible to get back some overwritten files!
 =20
  ~S

--=20

