From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: More on Hard Links
Date: Tue, 09 Dec 2003 22:05:30 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <87n0a1wex1.fsf@uhoreg.ca>
References: <20031209234740.27534.qmail@web25010.mail.ukl.yahoo.com> <20031210001327.54822.qmail@web25005.mail.ukl.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16316-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Narcoleptic" == Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk> writes:

[...]

Narcoleptic> Think of the non-writable, offline file as a "cached"
Narcoleptic> version of the file, and you can make a copy for
Narcoleptic> modification if you wish.  I don't see a usability issue
Narcoleptic> here.

Here's a use case: there's a shared file, "foo.txt", that I am working
with collaboratively with a bunch of other people.  It resides on a
network volume.  I decide I want a local copy on my laptop, so I make a
hardlink on my local disk.  Now I take my laptop home, so it's no
longer connected to the network.  The other guys want to make some
changes, but since the file has a remote link that isn't mounted, it's
unwritable.  The guys are annoyed at having to copy the file, leaving
"foo.txt" hanging there.  (They're even more annoyed when they find out
that I had mass-hardlinked the whole directory.)  They track me down
and beat me up. :-P

It's even worse if "foo.txt" was, say, actually a configuration file in
/etc, so you can't just copy it and make changes, because the program
won't be able to find the new version.

It's a bit of a contrived example, but not *completely* ridiculous.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

