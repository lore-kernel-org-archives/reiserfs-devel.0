From: Spam <spam@tnonline.net>
Subject: Re: silent semantic changes in reiser4 (brief attempt to document the idea of what reiser4 wants to do with metafiles and why
Date: Tue, 31 Aug 2004 22:31:54 +0200
Message-ID: <1125457632.20040831223154@tnonline.net>
References: <41323AD8.7040103@namesys.com> <200408312055.56335.v13@priest.com>
 <36793180.20040831201736@tnonline.net> <200408312235.35733.v13@priest.com>
 <874qmjm51g.fsf@uhoreg.ca>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21177-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <874qmjm51g.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org


V13>> The only thing that changes (from the userland POV) is the way
V13>> someone can enter the 'metadata directory'. This way you don't have
V13>> to have a special name, just a special function and no existing
V13>> application (like tar) can possibly break because it will not know
V13>> how to enter this 'metadata directory'.

> tar won't be able to backup the metadata.  That's the major breakage of
> tar that we're worried about.

  However,  if  we do a "cp fileA fileB" then the metadata and streams
  ought  to be copied too, even if "cp" does not support them. This is
  the  real  challenge. Backup tools like tar can be patched just like
  it has so many times before.


