From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes in reiser4 (brief attempt to document
 the idea of what reiser4 wants to do with metafiles and why
Date: Tue, 31 Aug 2004 16:22:19 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <874qmjm51g.fsf@uhoreg.ca>
References: <41323AD8.7040103@namesys.com> <200408312055.56335.v13@priest.com>
 <36793180.20040831201736@tnonline.net> <200408312235.35733.v13@priest.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21175-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: linux-kernel@vger.kernel.org

>>>>> "V13" == V13  <v13@priest.com> writes:

V13> On Tuesday 31 August 2004 21:17, Spam wrote:

>> It is a good thought. However I think they are trying to figure out a
>> way to have the metadata and streams to be accesible with legacy
>> applications.

V13> They will be since after chdir_meta() the user will be able to look
V13> at the metadata just like Hans described it.

Uh, no.  Legacy means no changes made.  It shouldn't need to be modified
to use chdir_meta.

From what I can see, your proposal isn't much different from the openat
proposal.

V13> The only thing that changes (from the userland POV) is the way
V13> someone can enter the 'metadata directory'. This way you don't have
V13> to have a special name, just a special function and no existing
V13> application (like tar) can possibly break because it will not know
V13> how to enter this 'metadata directory'.

tar won't be able to backup the metadata.  That's the major breakage of
tar that we're worried about.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

