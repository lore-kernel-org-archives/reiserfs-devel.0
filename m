From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes in reiser4 (brief attempt to document
 the idea of what reiser4 wants to do with metafiles and why
Date: Tue, 31 Aug 2004 18:46:22 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87r7pnkjsx.fsf@uhoreg.ca>
References: <41323AD8.7040103@namesys.com> <200408312055.56335.v13@priest.com>
 <36793180.20040831201736@tnonline.net> <200408312235.35733.v13@priest.com>
 <874qmjm51g.fsf@uhoreg.ca> <1125457632.20040831223154@tnonline.net>
 <87vfezkm06.fsf@uhoreg.ca> <881572472.20040901001557@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21187-reiserfs=m.gmane.org@namesys.com>
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

>> Yes.  And if we can get file-as-dir, then we only need to patch tar
>> once, since everything can be exported through that interface.

Spam>   Yes. This seem to be an acceptable way to do things. But next
Spam> time someone comes and want to do changes like this we need to
Spam> start patching things again. ...

But that's my point.  Anything that I can imagine anyone ever wanting to
extend the filesystem to do can be exported through this file-as-dir
system.  ACLs (or insert your favourite access-control scheme here),
xattrs, streams.  If you want to add something new, just make sure that
it can be seen through the file-as-dir interface, and you don't need to
patch tar again.  Want to use mandatory access control instead of
acl's?  Just export through foo.txt/metas/mac_level, and tar will catch
it with no problems.  Want to let your streams have substreams too?
export through foo.txt/streams/bar/streams/baz, and tar will still
catch it.

And you get the added bonus that you can use any program to edit these
extra things, no modifications needed.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

