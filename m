From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes with reiser4
Date: Sat, 28 Aug 2004 13:19:55 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87d61bkwn8.fsf@uhoreg.ca>
References: <Pine.LNX.4.44.0408272158560.10272-100000@chimarrao.boston.redhat.com> <Pine.LNX.4.58.0408271902410.14196@ppc970.osdl.org>
 <4130562B.5020709@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21002-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

>>>>> "Hans" == Hans Reiser <reiser@namesys.com> writes:

Hans> Just have a special name instead of a special boundary, or,
Hans> better, have a filename/pseudos/backup method that outputs
Hans> everything needed to backup the object "filename".

For the Reiser4 case, this could also be solved using views, right?
Just create a view that exposes everything that should be backed up,
and nothing else?  What "instructions" would a backup program need,
other than knowing what files to backup, and what files to not backup?

Where are views going to be handled?  It seems like something that would
be useful for every other filesystem, and so shouldn't be handled too
close to Reiser4.  (Or is that a debate/discussion/flamewar we don't
want to get into right now? ;-) )

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

