From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes with reiser4
Date: Sun, 29 Aug 2004 17:35:44 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87brgtwrtb.fsf@uhoreg.ca>
References: <Pine.LNX.4.44.0408272158560.10272-100000@chimarrao.boston.redhat.com> <Pine.LNX.4.58.0408271902410.14196@ppc970.osdl.org>
 <20040828170515.GB24868@hh.idb.hist.no>
 <Pine.LNX.4.58.0408281038510.2295@ppc970.osdl.org>
 <4131074D.7050209@namesys.com>
 <Pine.LNX.4.58.0408282159510.2295@ppc970.osdl.org>
 <4131A3B2.30203@namesys.com>
 <Pine.LNX.4.58.0408291055140.2295@ppc970.osdl.org>
 <41323436.80007@namesys.com> <1093810490.2766.8.camel@entropy>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21088-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

>>>>> "Nicholas" == Nicholas Miell <nmiell@comcast.net> writes:

Nicholas> On Sun, 2004-08-29 at 12:53, Hans Reiser wrote:
>> With your model, can I do:
>> 
>> cat filenameA/metas/permissions > filenameB/metas/permissions
>> 

Nicholas> runat filenameA "cat permissions" | runat filenameB "cat > permissions"

The world is more than the commandline.  Say I have an application icon
stored in xterm/icon.png.  Can I just open xterm/icon.png in Gimp
without having to open up a new instance of Gimp, and just use the old
instance that I was using for other images?  Or Can I use emacs to edit
xterm/description.txt without having to open up a new instance of emacs?
Will scripts be able to use metafiles and normal files at the same time?

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

