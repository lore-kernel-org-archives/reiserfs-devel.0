From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: [Fwd: filesystem support for XML storage and querying]
Date: Wed, 19 May 2004 14:49:55 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <874qqcfe0c.fsf@uhoreg.ca>
References: <1084953972.14831.3.camel@pear.st-and.ac.uk> <40AC1B2E.7050807@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18768-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Hans" == Hans Reiser <reiser@namesys.com> writes:

Hans> This was a good paper.:)

Thank you. :)

Hans> I don't understand the notion of ids, what motivates them, etc.

They are used in XML query engines for such things as removing duplicate
results.  (Although, I suppose inode number, or something similar, would
work just as well for this.)

Also, since XML nodes don't have names, we need to assign some sort of
ID so that they can be referenced in some way.  (e.g. if you have a
DocBook document with several chapters, you have to be able to tell the
filesystem which chapter you want to edit/remove/etc.)  Assigning each
node a persistent ID seems to be the simplest way to do things.

Hans> ReiserFS originally intended to use unique ids and then we
Hans> realized that keys were better.

I'm not familiar with what you mean by keys vs. ids, but it is possible
that using keys would be better.


As I said before, that paper is just a proposal, and I may or may not
actually implement it.  So unless I specifically re-claim it, that
topic is up for grabs for anyone who's interested.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

