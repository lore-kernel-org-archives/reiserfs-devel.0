From: Spam <spam@tnonline.net>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Fri, 31 Dec 2004 00:25:38 +0100
Message-ID: <144678391.20041231002538@tnonline.net>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local>
 <m38y7gx8kq.fsf@merlin.emma.line.org>
 <20041230235911.4911a20c.hihone@bigpond.net.au>
 <m3sm5nj2ef.fsf@merlin.emma.line.org> <87is6jpvdu.fsf@quasar.esben-stien.name>
 <20041230174732.GB5206@favonius> <234966540.20041230192607@tnonline.net>
 <m3brcbqsz6.fsf@merlin.emma.line.org>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22985-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3brcbqsz6.fsf@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com



> Spam <spam@tnonline.net> writes:

>>   In any case. Undelete has been since ages on many platforms. It IS a
>>   useful feature. Accidents CAN happen for many reasons and in some
>>   cases you may need to recover data.
>>
>>   Besides, a deletion does not fully remove the data, but just unlinks
>>   it. In Reiser where there is tailing etc for small files this can be
>>   a problem. Either the little file might not be able to be recovered
>>   (shouldn't the data still exist, even if it is tailed), or the user
>>   need to use a non-tailing policy?

> A working undelete can either hog disk space or die the moment some
> large write comes in. And if you're at that point, make it a versioning
> file system - but then don't complain about space efficiency.

  Yes, When data is overwritten then it is overwritten. The longer the
  user waits to try to recover data, the more risk of this happening.
  Undelete has existed a long time and people know it is not a
  foolproof thing. I do not think anyone asked for automatic backup
  features, but just tools that can try to recover accidental deletions.

>>   well, overwritten data is not so easy to get back. But from what I
>>   understand in Linux, is that many applications actually write
>>   another file and then unlinks the old file? If that is the case then
>>   it may even be possible to get back some overwritten files!

> I see enough applications to just overwrite an output file.=20

  Yes, This was an example only.

  In any case. If there were tools that could scan and recover, even
  partly, deleted files then I would welcome them. I am sure lots of
  other people do too.

  It is very easy to say you need backups of your data, that you need
  versioning filesystems etc. But not all of this is possible for
  everyone. Just take a laptop as example. Making backups is not so
  easy to do frequently - especially not when traveling.

  Sure, if you run in a corporate environment you can do shadow
  copying or use other versioning systems and mount that over the
  network. But for the normal "home" or "small business" users this is
  not really what you can expect...

> This whole discussion doesn't belong here until someone talks about
> implementing a whole versioning system for reiser4.

  I think someone said they wanted undelete recovery features in
  reiser4 - which was what started this discussion?

=B4

--=20

