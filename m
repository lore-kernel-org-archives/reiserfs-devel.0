From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Thu, 08 Apr 2004 00:45:10 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87y8p7rsbt.fsf@uhoreg.ca>
References: <a9e27b0360.b0360a9e27@cyberschools.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17790-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Dave" == Dave Poirier <dpoirier@dsfm.mb.ca> writes:

[...]

Dave> I was thinking from a user point of view when browsing a directory
Dave> structure or even simply listing files, normally files/directories
Dave> starting with a single dot are hidden (by default), and in
Dave> graphical modes their icons are shaded to signify they are special
Dave> files/directories.

Dave> I believe it would make sense to have the "metas" folder hidden or
Dave> shaded rather than always displayed, it would be less intrusive
Dave> for users not requiring access to those files.

The metas directory is "hidden" anyways, because it is not returned by
readdir(3).

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

