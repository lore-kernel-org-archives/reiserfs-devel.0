From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes in reiser4 (brief attempt to document
 the idea of what reiser4 wants to do with metafiles and why
Date: Tue, 31 Aug 2004 17:58:49 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87vfezkm06.fsf@uhoreg.ca>
References: <41323AD8.7040103@namesys.com> <200408312055.56335.v13@priest.com>
 <36793180.20040831201736@tnonline.net> <200408312235.35733.v13@priest.com>
 <874qmjm51g.fsf@uhoreg.ca> <1125457632.20040831223154@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21184-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: linux-kernel@vger.kernel.org

>>>>> "Spam" == Spam  <spam@tnonline.net> writes:

V13> The only thing that changes (from the userland POV) is the way
V13> someone can enter the 'metadata directory'. This way you don't have
V13> to have a special name, just a special function and no existing
V13> application (like tar) can possibly break because it will not know
V13> how to enter this 'metadata directory'.

>> tar won't be able to backup the metadata.  That's the major breakage
>> of tar that we're worried about.

Spam>   However, if we do a "cp fileA fileB" then the metadata and
Spam> streams ought to be copied too, even if "cp" does not support
Spam> them.

Huh?  How do you plan on pulling that off?  Unless cp uses the
not-yet-existing copy syscall, if cp can't see the metadata or streams,
how is it going to copy it?

Spam> This is the real challenge. Backup tools like tar can be patched
Spam> just like it has so many times before.

Yes.  And if we can get file-as-dir, then we only need to patch tar
once, since everything can be exported through that interface.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

