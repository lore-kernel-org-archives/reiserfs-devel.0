From: Spam <spam@tnonline.net>
Subject: Re: silent semantic changes in reiser4 (brief attempt to document the idea of what reiser4 wants to do with metafiles and why
Date: Wed, 1 Sep 2004 00:15:57 +0200
Message-ID: <881572472.20040901001557@tnonline.net>
References: <41323AD8.7040103@namesys.com> <200408312055.56335.v13@priest.com>
 <36793180.20040831201736@tnonline.net> <200408312235.35733.v13@priest.com>
 <874qmjm51g.fsf@uhoreg.ca> <1125457632.20040831223154@tnonline.net>
 <87vfezkm06.fsf@uhoreg.ca>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21186-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87vfezkm06.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org


  

>>>>>> "Spam" == Spam  <spam@tnonline.net> writes:

V13>> The only thing that changes (from the userland POV) is the way
V13>> someone can enter the 'metadata directory'. This way you don't have
V13>> to have a special name, just a special function and no existing
V13>> application (like tar) can possibly break because it will not know
V13>> how to enter this 'metadata directory'.

>>> tar won't be able to backup the metadata.  That's the major breakage
>>> of tar that we're worried about.

Spam>>   However, if we do a "cp fileA fileB" then the metadata and
Spam>> streams ought to be copied too, even if "cp" does not support
Spam>> them.

> Huh?  How do you plan on pulling that off?  Unless cp uses the
> not-yet-existing copy syscall, if cp can't see the metadata or streams,
> how is it going to copy it?

  My first thought would change the API that cp uses to copy the file.
  But  in  an earlier response on this message thread I have found out
  that  there is no such API (well there is, but it is linked into the
  program)  and  cp  in fact itself is doing the copying. this is also
  what  I  objected  against  before. It is a bad design and should be
  attended  much  higher  interest to change than just adding adding a
  new type of file-as-dir.

Spam>> This is the real challenge. Backup tools like tar can be patched
Spam>> just like it has so many times before.

> Yes.  And if we can get file-as-dir, then we only need to patch tar
> once, since everything can be exported through that interface.

  Yes. This seem to be an acceptable way to do things. But next time
  someone comes and want to do changes like this we need to start
  patching things again. If there was an API that was separate from
  the programs then new features could be included much more easily as
  things could be done behind the scenes. ie the "cp fileA fileB"
  would succeed and all the extended attributes, metas, streams etc
  would be copied too. Nothing would ever be lost unless copying to a
  filesystem that doesn't support the special stuff. (as with NTFS
  file streams).

  ~S


