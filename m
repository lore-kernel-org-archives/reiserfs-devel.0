From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: More on Hard Links
Date: Mon, 15 Dec 2003 20:27:47 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <87u141tuuk.fsf@uhoreg.ca>
References: <87k755y8xf.fsf@uhoreg.ca> <20031209234740.27534.qmail@web25010.mail.ukl.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16348-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Sorry for the lateness of this reply that I had promised to do.  I've
been a bit busy of late.

>>>>> "Narcoleptic" == Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk> writes:

[...]

Narcoleptic> If there is a way to quickly and reliably verify that two
Narcoleptic> files are identical (or not), then when committing a
Narcoleptic> transaction, each file in the sync list can be resolved as
Narcoleptic> follows: - If a volume ID is not found, don't commit
Narcoleptic> anything (as per the current proposal).  - Otherwise, if a
Narcoleptic> file ID for a given volume ID refers to a file not
Narcoleptic> identical to the current file (or is not found), remove the
Narcoleptic> file from the sync list.

This seems very inefficient, and I don't think it really solves the
problem.

If a file is unlinked, and then an identical file is written in its
place, the system will still think it's part of the same hardlink
collection, even though it shouldn't be.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

