From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes with reiser4
Date: Sun, 29 Aug 2004 17:05:17 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87fz65wt82.fsf@uhoreg.ca>
References: <Pine.LNX.4.44.0408272158560.10272-100000@chimarrao.boston.redhat.com> <Pine.LNX.4.58.0408271902410.14196@ppc970.osdl.org>
 <20040828170515.GB24868@hh.idb.hist.no>
 <Pine.LNX.4.58.0408281038510.2295@ppc970.osdl.org>
 <4131074D.7050209@namesys.com>
 <Pine.LNX.4.58.0408282159510.2295@ppc970.osdl.org>
 <4131A3B2.30203@namesys.com> <20040829104413.GE871@zip.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21086-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

>>>>> "CaT" == CaT  <cat@zip.com.au> writes:

CaT> My apologies if this question has been raised (and answered)
CaT> elsewhere.  I tried to keep up with the flamefest/discussion but it
CaT> wasn't always possible.

CaT> How would you do it for directories without making certain names
CaT> illegal? ie taking the above you'd do:

CaT> cat dirA/metas/permissions > dirB/metas/permissions

Yes.  Directories are not allowed to contain objects with a filename
"metas".  The naming of "metas" has been discussed quite a bit on the
Reiserfs list, and I don't think there was much consensus that came out
of it.  Currently for Reiser4, AFAIK, the "metas" name is a compile-time
option that you can change by changing a #define, if you're worried
about name clashes.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

