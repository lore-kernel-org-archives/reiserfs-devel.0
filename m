From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Sun, 28 Mar 2004 14:13:32 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <874qs8kco3.fsf@uhoreg.ca>
References: <200403271537.52955.sikkh@wp.pl> <40670001.60302@namesys.com>
 <200403281957.57226.filipe@rnl.ist.utl.pt>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17544-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Filipe" == Filipe Almeida <filipe@rnl.ist.utl.pt> writes:

[...]

Filipe> About the user user friendliness issue, would novice users be
Filipe> messing with the metadata exposed by reiser4 pseudo files? I
Filipe> think this will be a feature for software and advanced users.

I agree.  I think that metas should be prefixed with at least a
period (i.e. .metas).  There is enough precedent for dot-files that it
shouldn't be too much of a user-friendliness issue.  Actually, I would
argue that using a prefix would be more user-friendly, since it
indicates that metas is not a standard directory, and would lead to less
confusion.

Also, in terms of adoption of Reiser4, it's the techies who pick the
filesystem, not the users, and my feeling is that techies wouldn't like
just plain "metas" with no prefix.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

