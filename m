From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: The argument for fs assistance in handling archives
Date: Fri, 03 Sep 2004 00:36:34 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87zn48vui5.fsf@uhoreg.ca>
References: <20040901200806.GC31934@mail.shareable.org> <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org>
 <1094118362.4847.23.camel@localhost.localdomain>
 <20040902203854.GA4801@janus>
 <1094160994.31499.19.camel@shaggy.austin.ibm.com>
 <20040902214806.GA5272@janus>
 <20040902220027.GD23987@parcelfarce.linux.theplanet.co.uk>
 <4137B5F5.8000402@slaphack.com> <1862674154.20040903024407@tnonline.net>
 <4137C8B4.2030009@slaphack.com>
 <20040903034448.GJ32697@ZenIV.linux.org.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21392-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

>>>>> "Chris" == Chris Dukes <pakrat@www.uk.linux.org> writes:

Chris> Ahem, Wasn't this the goal of GNU HURD?

Chris> I really think you should ask them why they haven't delivered
Chris> something useful, then come back to this thread.

Note: this is just an outsider's view of HURD.  I mostly just lurk on
some HURD lists.

AFAIK, their concept of translators seems to be working fine.  The ext2
translator had problems because it wanted to mmap the whole partition,
and so could only load partitions up to 2 GB or so, but I haven't heard
any problems with the translators concept.  That particular problem with
the ext2 translator, I think, has been fixed.

They are also porting the HURD to another microkernel (L4), since GNU
Mach is outdated (I forget exactly what problems they were having, but
it might have been that IPC is too slow on Mach).  (Unfortunately, L4
itself seems to still be under development...)

They also have a lot less developers than Linux...

Again, I haven't heard of any problems with their concept of
translators.  That seems to be working fine.  The fact that they
haven't produced anything "useful" (for some values of useful) seems to
be mostly due to other things.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

