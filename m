From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: "Metas"
Date: Sun, 25 Apr 2004 01:44:42 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87smeshar9.fsf@uhoreg.ca>
References: <408045B8.7000102@mrs.umn.edu> <20040418033328.24278.qmail@web25006.mail.ukl.yahoo.com>
 <c5t3lg$g9g$1@satsuki.furryterror.org> <40869EAD.9020806@namesys.com>
 <4086ABE8.4090806@mrs.umn.edu> <408B472C.5090000@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18201-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "David" == David Masover <ninja@slaphack.com> writes:

[...]

David> Another idea which seems to work much better is to merely have
David> two modes for each file -- one for the file-as-a-file and one for
David> the file-as-a-directory.  ...

This makes a lot of sense to me.  I like it.  I think that it's
reasonable to say that the desired permissions for a file as a file may
not necessarily be the same as the desired permissions for a file as a
directory.

I wonder if this would require more or less changes to the VFS compared
to creating a new permission for chdir.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

